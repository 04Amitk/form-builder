<?php

namespace App\Exports;

use App\Models\Form;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\Exportable;

class FormSubmissionsExport implements FromArray
{
  use Exportable;

  public function __construct(
    protected Form $form
  ) {
  }

  public function array(): array
  {
    $fields = collect($this->form->schema['fields'])
      ->filter(fn ($field) => isset($field['key']))
      ->values();

    $rows = [];

    $headers = [
      'Submission ID',
      'Submitted At',
    ];

    foreach ($fields as $field) {
      $headers[] = $field['label'];
    }

    $rows[] = $headers;
    foreach ($this->form->submissions()->oldest('submitted_at')->get() as $submission) {
      $row = [
        $submission->id,
        $submission->submitted_at->format('Y-m-d H:i:s'),
      ];

      foreach ($fields as $field) {
        $value = $submission->answers[$field['key']] ?? '';
        if (is_array($value)) {
          $value = implode(', ', $value);
        }
        $row[] = $value;
      }
      $rows[] = $row;
    }

    return $rows;
  }
}