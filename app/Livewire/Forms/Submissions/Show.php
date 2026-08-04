<?php

namespace App\Livewire\Forms\Submissions;

use App\Models\Form;
use App\Models\Submission;
use Livewire\Component;

class Show extends Component
{
  public Form $form;
  public Submission $submission;

  public function mount(Form $form, Submission $submission): void
  {
    abort_unless($submission->form_id === $form->id, 404);
    $this->form = $form;
    $this->submission = $submission;
  }

  public function displayValue(array $field): string
  {
    $value = $this->submission->answers[$field['key']] ?? null;
    if (is_array($value)) {
      return implode(', ', $value);
    }

    return blank($value) ? '—' : (string) $value;
  }

  public function render()
  {
    return view('livewire.forms.submissions.show');
  }
}