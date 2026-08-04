<?php

namespace App\Livewire\Forms;

use App\Models\Form;
use Flux\Flux;
use Livewire\Attributes\On;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
  use WithPagination;

  public string $search = '';
  public int $perPage = 10;

  public function updatingSearch(): void
  {
    $this->resetPage();
  }

  public function delete(Form $form): void
  {
    $form->delete();
    Flux::toast(
      heading: 'Form deleted',
      text: 'The form has been deleted successfully.',
      variant: 'success',
    );

    $this->dispatch('form-deleted');
  }

  #[On('form-deleted')]
  public function refresh(): void
  {
  }

  public function render()
  {
    $forms = Form::query()
      ->when($this->search !== '', function ($query) {
        $query->where('name', 'like', '%' . $this->search . '%');
      })
      ->latest()
      ->paginate($this->perPage);

    return view('livewire.forms.index', [
      'forms' => $forms,
    ]);
  }
}