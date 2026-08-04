<?php

namespace App\Livewire\Forms;

use App\Enums\AIGenerationStatus;
use App\Enums\FormStatus;
use App\Models\Form;
use Flux\Flux;
use Illuminate\Support\Str;
use Livewire\Attributes\Computed;
use Livewire\Attributes\Validate;
use Livewire\Component;
use Livewire\Attributes\On;
use App\Jobs\GenerateFormSchema;
use App\Models\AIRequest;

class Builder extends Component
{
  #[Validate('required|string|max:255')]
  public string $name = '';

  #[Validate('nullable|string')]
  public ?string $description = null;

  public ?Form $form = null;
  public array $schema = [];
  public ?string $selectedField = null;
  public array $fieldTypes = [];
  public array $editingField = [];
  public string $schemaJson = '';
  public string $viewMode = 'canvas';
  public string $prompt = '';
  public ?array $generatedSchema = null;
  public ?int $aiRequestId = null;

  public function mount(?Form $form = null): void
  {
    $this->form = $form;
    $this->fieldTypes = config('form-builder.field_types');
    if ($form) {
      $this->name = $form->name;
      $this->description = $form->description;

      $this->schema = $form->schema;
    }
    else {
      $this->schema = config('form-builder.default_schema');
    }

    $this->schemaJson = json_encode($this->schema, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
  }

  public function showCanvas(): void
  {
    $decoded = json_decode($this->schemaJson, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
      Flux::toast(
        heading: 'Invalid JSON',
        text: 'Please fix the JSON before switching back.',
        variant: 'danger',
      );

      return;
    }

    $this->schema = $decoded;
    $this->viewMode = 'canvas';
  }

  public function showJson(): void
  {
    $this->syncSchemaJson();
    $this->viewMode = 'json';
  }

  protected function syncSchemaJson(): void
  {
    $this->schemaJson = json_encode($this->schema, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
  }

  public function addField(string $type): void
  {
    $field = $this->defaultField($type);
    $this->schema['fields'][] = $field;
    $this->selectField($field['id']);

    $this->syncSchemaJson();
  }

  private function defaultField(string $type): array
  {
    $count = count($this->schema['fields']) + 1;
    return match ($type) {
      'section' => [
        'id' => (string) Str::uuid(),
        'type' => 'section',
        'label' => 'New Section',
        'description' => '',
      ],
      // 'heading' => [
      //   'id' => (string) Str::uuid(),
      //   'type' => 'heading',
      //   'text' => 'Heading',
      //   'level' => 2,
      // ],
      'text' => [
        'id' => (string) Str::uuid(),
        'type' => 'text',
        'label' => 'Text',
        'key' => "text_$count",
        'placeholder' => '',
        'help_text' => '',
        'default' => '',
        'required' => false,
        'section_id' => null,
        'validation' => [
          'min_length' => null,
          'max_length' => null,
        ],
      ],
      'textarea' => [
        'id' => (string) Str::uuid(),
        'type' => 'textarea',
        'label' => 'Textarea',
        'key' => "textarea_$count",
        'placeholder' => '',
        'help_text' => '',
        'default' => '',
        'rows' => 4,
        'required' => false,
        'section_id' => null,
        'validation' => [
          'min_length' => null,
          'max_length' => null,
        ],
      ],
      'email' => [
        'id' => (string) Str::uuid(),
        'type' => 'email',
        'label' => 'Email',
        'key' => "email_$count",
        'placeholder' => '',
        'help_text' => '',
        'default' => '',
        'required' => false,
        'section_id' => null,
      ],
      'phone' => [
        'id' => (string) Str::uuid(),
        'type' => 'phone',
        'label' => 'Phone',
        'key' => "phone_$count",
        'placeholder' => '',
        'help_text' => '',
        'default' => '',
        'required' => false,
        'section_id' => null,
      ],
      'number' => [
        'id' => (string) Str::uuid(),
        'type' => 'number',
        'label' => 'Number',
        'key' => "number_$count",
        'placeholder' => '',
        'help_text' => '',
        'default' => null,
        'required' => false,
        'section_id' => null,
        'validation' => [
          'min' => null,
          'max' => null,
          'step' => 1,
        ],
      ],
      'date' => [
        'id' => (string) Str::uuid(),
        'type' => 'date',
        'label' => 'Date',
        'key' => "date_$count",
        'help_text' => '',
        'required' => false,
        'section_id' => null,
        'validation' => [
          'min' => null,
          'max' => null,
        ],
      ],
      'dropdown' => [
        'id' => (string) Str::uuid(),
        'type' => 'dropdown',
        'label' => 'Dropdown',
        'key' => "dropdown_$count",
        'placeholder' => '',
        'help_text' => '',
        'required' => false,
        'section_id' => null,
        'options' => [
          [
            'label' => 'Option 1',
            'value' => 'option_1',
          ],
        ],
      ],
      'radio' => [
        'id' => (string) Str::uuid(),
        'type' => 'radio',
        'label' => 'Radio',
        'key' => "radio_$count",
        'help_text' => '',
        'required' => false,
        'section_id' => null,
        'options' => [
          [
            'label' => 'Option 1',
            'value' => 'option_1',
          ],
        ],
      ],
      'checkbox' => [
        'id' => (string) Str::uuid(),
        'type' => 'checkbox',
        'label' => 'Checkbox',
        'key' => "checkbox_$count",
        'help_text' => '',
        'required' => false,
        'section_id' => null,
        'options' => [
          [
            'label' => 'Option 1',
            'value' => 'option_1',
          ],
        ],
      ],
      'file' => [
        'id' => (string) Str::uuid(),
        'type' => 'file',
        'label' => 'File Upload',
        'key' => "file_$count",
        'help_text' => '',
        'required' => false,
        'multiple' => false,
        'accept' => '',
        'max_size' => 2048,
        'section_id' => null,
      ],
      'rating' => [
        'id' => (string) Str::uuid(),
        'type' => 'rating',
        'label' => 'Rating',
        'key' => "rating_$count",
        'help_text' => '',
        'required' => false,
        'max' => 5,
        'section_id' => null,
      ],
      default => throw new \InvalidArgumentException("Unsupported field type [$type]."),
    };
  }

  public function selectField(string $id): void
  {
    $this->selectedField = $id;
    foreach ($this->schema['fields'] as $field) {
      if ($field['id'] === $id) {
        $this->editingField = $field;
        break;
      }
    }
  }

  protected function syncEditingField(): void
  {
    foreach ($this->schema['fields'] as $index => $field) {
      if ($field['id'] === $this->selectedField) {
        $this->schema['fields'][$index] = $this->editingField;
        return;
      }
    }
  }

  public function updatedEditingField(): void
  {
    $this->syncEditingField();
    $this->syncSchemaJson();
  }

  public function save(): void
  {
    $decoded = json_decode($this->schemaJson, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
      Flux::toast(
        heading: 'Invalid JSON',
        text: 'Please fix the schema before saving.',
        variant: 'danger',
      );
      return;
    }
    $this->schema = $decoded;

    $this->validate();
    $this->schema['title'] = $this->name;
    $this->schema['description'] = $this->description;

    if ($this->form) {
      $this->form->update([
        'name' => $this->name,
        'description' => $this->description,
        'schema' => $this->schema,
      ]);

      Flux::toast(
        heading: 'Form updated',
        text: 'Form has been updated successfully.',
        variant: 'success',
        duration: 0
      );
    }
    else {
      $this->form = Form::create([
        'name' => $this->name,
        'slug' => Str::slug($this->name),
        'description' => $this->description,
        'schema' => $this->schema,
        'status' => FormStatus::Published,
        'created_by' => auth()->id(),
      ]);

      Flux::toast(
        heading: 'Form created',
        text: 'Form has been created successfully.',
        variant: 'success',
      );
      $this->redirectRoute('forms.edit', $this->form);
    }

    $this->dispatch('form-saved');
  }

  public function deleteField(string $id): void
  {
    $this->schema['fields'] = array_values(array_filter($this->schema['fields'], fn ($field) => $field['id'] !== $id));
    if ($this->selectedField === $id) {
      $this->selectedField = null;
      $this->editingField = [];
    }

    $this->syncSchemaJson();
  }

  public function addOption(): void
  {
    $this->editingField['options'][] = [
      'label' => '',
      'value' => '',
    ];

    $this->syncEditingField();
  }

  public function removeOption(int $index): void
  {
    unset($this->editingField['options'][$index]);
    $this->editingField['options'] = array_values(
      $this->editingField['options']
    );

    $this->syncEditingField();
  }

  public function duplicateField(string $id): void
  {
    foreach ($this->schema['fields'] as $index => $field) {
      if ($field['id'] !== $id) {
        continue;
      }

      $copy = $field;
      $copy['id'] = (string) Str::uuid();

      if (isset($copy['key'])) {
        $copy['key'] .= '_' . Str::random(4);
      }

      array_splice($this->schema['fields'], $index + 1, 0, [$copy]);
      $this->selectField($copy['id']);
      $this->syncSchemaJson();
      return;
    }
  }

  public function updatedSchemaJson(): void
  {
    $decoded = json_decode($this->schemaJson, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
      return;
    }

    $this->schema = $decoded;
  }

  public function generate(): void
  {
    $this->validate([
      'prompt' => ['required', 'string'],
    ]);

    $request = AIRequest::create([
      'form_id' => $this->form?->id,
      'operation' => $this->form ? 'edit' : 'generate',
      'prompt' => $this->prompt,
      'input_schema' => $this->form?->schema ?? null,
      'provider' => 'gemini',
      'model' => config('services.gemini.model'),
      'status' => AIGenerationStatus::Pending,
    ]);

    GenerateFormSchema::dispatch($request);
    $this->aiRequestId = $request->id;

    Flux::toast(
      heading: 'Generation started',
      text: 'Your request has been queued.',
      variant: 'success',
    );
  }

  public function applyGeneratedSchema(): void
  {
    if (!$this->generatedSchema) {
      return;
    }

    $this->schema = $this->generatedSchema;
    $this->name = $this->schema['title'] ?? $this->name;
    $this->description = $this->schema['description'] ?? $this->description;
    $this->syncSchemaJson();
    $this->generatedSchema = null;
    $this->selectedField = null;
    $this->editingField = [];

    Flux::toast(
      heading: 'Schema applied',
      text: 'The generated schema has been loaded.',
      variant: 'success',
    );
  }

  public function discardGeneratedSchema(): void
  {
    $this->generatedSchema = null;

    Flux::toast(
      heading: 'Discarded',
      text: 'Generated schema was discarded.',
      variant: 'warning',
    );
  }

  public function refreshAIRequest(): void
  {
    if (!$this->aiRequestId) {
      return;
    }

    $request = AIRequest::find($this->aiRequestId);
    if (!$request) {
      return;
    }

    if ($request->status === AIGenerationStatus::Completed) {
      $this->generatedSchema = $request->response;
      $this->name = $this->generatedSchema['title'] ?? $this->name;
      $this->description = $this->generatedSchema['description'] ?? $this->description;
      $this->aiRequestId = null;

      Flux::toast(
        heading: 'AI generation completed',
        text: 'Review the generated schema and apply it.',
        variant: 'success',
      );

      return;
    }

    if ($request->status === AIGenerationStatus::Failed) {
      $this->aiRequestId = null;
      Flux::toast(
        heading: 'Generation failed',
        text: $request->error ?? 'Unable to generate form.',
        variant: 'danger',
      );
    }
  }

  #[Computed]
  public function aiRequest(): ?AIRequest
  {
    if (!$this->aiRequestId) {
      return null;
    }

    return AIRequest::find($this->aiRequestId);
  }

  #[Computed()]
  public function sections(): array
  {
    return collect($this->schema['fields'])
      ->filter(fn ($field) => $field['type'] === 'section')
      ->map(fn ($field) => [
        'id' => $field['id'],
        'label' => $field['label'],
      ])
      ->values()
      ->toArray();
  }

  #[On('fieldMoved')]
  public function fieldMoved(int $oldIndex, int $newIndex): void
  {
    if ($oldIndex === $newIndex) {
      return;
    }

    $fields = $this->schema['fields'];
    $moved = array_splice($fields, $oldIndex, 1);
    array_splice($fields, $newIndex, 0, $moved);
    $this->schema['fields'] = array_values($fields);
    if ($this->selectedField) {
      $this->selectField($this->selectedField);
    }
    $this->syncSchemaJson();
  }

  public function render()
  {
    return view('livewire.forms.builder');
  }
}