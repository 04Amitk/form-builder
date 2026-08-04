<?php

namespace App\Livewire\Imports;

use App\Enums\FormStatus;
use App\Enums\ImportStatus;
use App\Models\Form;
use App\Models\ImportRequest;
use App\Services\AI\SchemaValidator;
use Flux\Flux;
use Illuminate\Support\Str;
use Livewire\Component;

class Preview extends Component
{
  public ImportRequest $importRequest;

  public array $schema = [];

  public function mount(ImportRequest $importRequest): void
  {
    abort_unless($importRequest->status === ImportStatus::Completed, 404);
    $this->importRequest = $importRequest;
    $this->schema = $importRequest->parsed_schema;
  }

  public function save()
  {
    try {
      if (!SchemaValidator::validate($this->schema)) {
        throw new \RuntimeException('Generated schema is invalid.');
      }

      $form = Form::create([
        'name' => $this->schema['title'],
        'slug' => Str::slug($this->schema['title']),
        'description' => $this->schema['description'],
        'schema' => $this->schema,
        'status' => FormStatus::Published,
        'created_by' => auth()->id(),
      ]);

      $this->importRequest->update([
        'form_id' => $form->id,
      ]);

      Flux::toast(
        heading: 'Imported',
        text: 'Form imported successfully.',
        variant: 'success'
      );

      return $this->redirectRoute('forms.edit', $form);
    } catch (\Throwable $th) {
      logger()->error('Error saving imported form', [
        'error' => $th->getMessage(),
        'importRequestId' => $this->importRequest->id,
      ]);

      Flux::toast(
        heading: 'Error',
        text: 'There was an error saving the form. Please try again.',
        variant: 'danger'
      );
    }
  }

  public function removeField(int $index): void
  {
    unset($this->schema['fields'][$index]);
    $this->schema['fields'] = array_values($this->schema['fields']);
  }
  public function render()
  {
    return view('livewire.imports.preview');
  }
}