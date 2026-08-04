<?php

namespace App\Services\AI;

use Illuminate\Support\Facades\Http;
use App\Services\AI\FieldSchema;

class FormGenerator
{
  protected function request(string $prompt, ?array $currentSchema = null): array
  {
    $start = microtime(true);
    $response = Http::baseUrl('https://generativelanguage.googleapis.com/v1beta')
      ->withQueryParameters([
        'key' => config('services.gemini.api_key'),
      ])
      ->timeout(120)
      ->post(
        '/models/' . config('services.gemini.model') . ':generateContent',
        [
          'contents' => [
            [
              'parts' => [
                [
                  'text' => $this->buildPrompt($prompt, $currentSchema),
                ],
              ],
            ],
          ],
          'generationConfig' => [
            'responseMimeType' => 'application/json',
          ],
        ]
      )
      ->throw();

    $body = $response->json();
    $text = data_get($body, 'candidates.0.content.parts.0.text');
    $schema = json_decode($text, true, JSON_THROW_ON_ERROR);
    return [
      'schema' => $schema,
      'usage' => [
        'input_tokens' => data_get($body, 'usageMetadata.promptTokenCount', 0),
        'output_tokens' => data_get($body, 'usageMetadata.candidatesTokenCount', 0),
        'total_tokens' => data_get($body, 'usageMetadata.totalTokenCount', 0),
        'latency_ms' => (int) ((microtime(true) - $start) * 1000),
      ],
    ];
  }

  public function generate(string $prompt): array
  {
    return $this->request(prompt: $prompt, currentSchema: null);
  }

  public function edit(array $schema, string $instruction): array
  {
    return $this->request(prompt: $instruction, currentSchema: $schema);
  }

  protected function buildPrompt(string $prompt, ?array $schema): string
  {
    $fieldTypes = collect(config('form-builder.field_types'))
      ->pluck('type')
      ->implode(', ');

    $sampleSchema = json_encode(FieldSchema::sampleSchema(), JSON_PRETTY_PRINT);

    $message = <<<PROMPT
      You are an expert form designer.

      Generate a COMPLETE editable JSON form schema.

      Requirements:

      - Return ONLY valid JSON.
      - Do NOT return markdown.
      - Do NOT wrap the JSON inside code blocks.
      - Use ONLY these field types:

      {$fieldTypes}

      For every field:
      - Choose the most appropriate field type.
      - Generate a human-friendly label.
      - Generate a unique snake_case key.
      - Generate placeholders where appropriate.
      - Generate help text when useful.
      - Mark required fields appropriately.
      - Generate sensible validation rules.
      - Generate options for dropdown, radio and checkbox fields.
      - Use sections to organize long forms and assign section id to fields that belong to that section.
      - Do NOT invent new field types.
      - Every field must follow the schema shown below.

      Output Contract:
      PROMPT;

    $message .= "\n";
    $message .= json_encode($sampleSchema, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);

    if ($schema) {
      $message .= "\n\nCurrent Form Schema:\n";
      $message .= json_encode($schema, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
      $message .= <<<PROMPT

      Modify ONLY what is requested.

      Preserve existing field ids whenever possible.

      Do not remove existing fields unless explicitly instructed.

      Return the COMPLETE updated schema.
      PROMPT;
    }

    $message .= <<<PROMPT

      User Request:

      {$prompt}

      Return ONLY the JSON object.
      PROMPT;

    return $message;
  }

  public function enhance(array $schema): array
  {
    $prompt = $this->buildEnhancePrompt($schema);
    return $this->request($prompt);
  }

  protected function buildEnhancePrompt(array $schema): string
  {
    $fieldTypes = collect(config('form-builder.field_types'))
      ->pluck('type')
      ->implode(', ');

    $fieldSchemas = json_encode(FieldSchema::defaults(), JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    $sampleSchema = json_encode(FieldSchema::sampleSchema(), JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    $currentSchema = json_encode($schema, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);

    return <<<PROMPT
      You are an expert form designer.

      A Word or Excel document has already been parsed into a valid form schema.

      Your task is to IMPROVE the schema, NOT recreate it.

      STRICT RULES

      - Attach appropriate title and description to the form if missing.
      - Return ONLY valid JSON.
      - Do NOT wrap the response in markdown.
      - Do NOT include explanations.
      - Preserve the JSON structure.
      - Preserve the order of fields.
      - Preserve all ids.
      - Preserve all keys.
      - Preserve all section_id values.
      - Preserve all labels unless they contain obvious spelling mistakes.
      - Never remove a field.
      - Never add a field unless it is absolutely required to complete an existing option list.
      - Never invent unsupported field types.

      ONLY improve the following:

      - field type
      - placeholder
      - help_text
      - required
      - validation
      - options when obvious

      Allowed field types:

      {$fieldTypes}

      Typical mappings:

      - Full Name → text
      - Email Address → email
      - Phone Number → phone
      - Date of Birth → date
      - Age → number
      - Resume / CV → file
      - Gender → radio
      - Country → dropdown
      - Skills → checkbox
      - Rating → rating

      Every field MUST follow one of these schemas exactly.

      Field Schemas:

      {$fieldSchemas}

      Example of a complete valid schema:

      {$sampleSchema}

      Current schema to improve:

      {$currentSchema}

      Return ONLY the improved JSON schema.
      PROMPT;
  }
}