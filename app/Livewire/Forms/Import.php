<?php

namespace App\Livewire\Forms;

use App\Enums\ImportStatus;
use App\Jobs\ImportDocument;
use App\Models\ImportRequest;
use Flux\Flux;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\Attributes\Computed;

class Import extends Component
{
  use WithFileUploads;

  public $file;
  public ?int $importRequestId = null;
  public ?array $parsedSchema = null;

  public function import(): void
  {
    $this->validate([
      'file' => ['required', 'file', 'mimes:docx,xlsx'],
    ]);

    $path = $this->file->store('imports');

    $request = ImportRequest::create([
      'file_name' => $path,
      'file_type' => $this->file->getClientOriginalExtension(),
      'status' => ImportStatus::Pending,
    ]);

    ImportDocument::dispatch($request);
    $this->importRequestId = $request->id;

    Flux::toast(
      heading: 'Import started',
      text: 'Your request has been queued.',
      variant: 'success',
    );
  }

  public function refreshImport()
  {
    if (!$this->importRequestId) {
      return;
    }

    $request = ImportRequest::find($this->importRequestId);
    if (!$request) {
      return;
    }

    if ($request->status === ImportStatus::Completed) {
      return $this->redirectRoute('imports.preview', $request);
      // $this->parsedSchema = $request->parsed_schema;
      // $this->importRequestId = null;

      // Flux::toast(
      //   heading: 'Import completed',
      //   text: 'Review the generated schema and apply it.',
      //   variant: 'success',
      // );

      return;
    }

    if ($request->status === ImportStatus::Failed) {
      $this->importRequestId = null;
      Flux::toast(
        heading: 'Import failed',
        text: $request->error ?? 'Unable to import form.',
        variant: 'danger',
      );
    }
  }

  #[Computed()]
  public function importRequest(): ?ImportRequest
  {
    if (!$this->importRequestId) {
      return null;
    }

    return ImportRequest::find($this->importRequestId);
  }

  public function render()
  {
    return view('livewire.forms.import');
  }
}