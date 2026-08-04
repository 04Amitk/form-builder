<?php

namespace App\Livewire\Forms\Submissions;

use App\Models\Form;
use Livewire\Component;
use Livewire\WithPagination;
use App\Exports\FormSubmissionsExport;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Maatwebsite\Excel\Excel as ExcelFormat;

class Index extends Component
{
  use WithPagination;

  public Form $form;
  public string $search = '';

  public function updatingSearch(): void
  {
    $this->resetPage();
  }

  public function export(): BinaryFileResponse
  {
    return Excel::download(new FormSubmissionsExport($this->form), "{$this->form->slug}-submissions.csv", ExcelFormat::CSV);
  }

  public function render()
  {
    $submissions = $this->form
      ->submissions()
      ->when($this->search !== '', function ($query) {
        $query->where('id', 'like', "%{$this->search}%");
      })
      ->latest('submitted_at')
      ->paginate(10);

    return view('livewire.forms.submissions.index', [
      'submissions' => $submissions,
    ]);
  }
}