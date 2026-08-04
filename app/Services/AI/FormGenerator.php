<?php

namespace App\Services\AI;

use Illuminate\Support\Facades\Http;
use App\Services\AI\FieldSchema;

class FormGenerator
{
  protected function request(string $prompt, ?array $currentSchema = null): array
  {
    $model = config('services.gemini.model');

    $url = 'https://generativelanguage.googleapis.com/v1/models/' .
      $model .
      ':generateContent';
    logger()->info('Sending request to Gemini API', [
      'url' => $url,
      'prompt' => $prompt,
      'currentSchema' => $currentSchema,
    ]);

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

  //   if ($schema) {
  //     $message .= "\nCurrent Schema:\n";
  //     $message .= json_encode($schema, JSON_PRETTY_PRINT);
  //     $message .= "\n\nModify the schema according to the user's instruction.\n";
  //   }

  //   $message .= "\nUser Request:\n{$prompt}";

  //   return $message;
  // }
}