<?php

namespace App\Services\Import;

use Illuminate\Support\Str;
use PhpOffice\PhpSpreadsheet\IOFactory;

class ExcelParser
{
  public function parse(string $path): array
  {
    $spreadsheet = IOFactory::load($path);
    $sheet = $spreadsheet->getActiveSheet();
    $rows = $sheet->toArray();

    $schema = [
      'version' => 1,
      'title' => pathinfo($path, PATHINFO_FILENAME),
      'description' => '',
      'fields' => [],
    ];

    if (count($rows) <= 1) {
      return $schema;
    }

    $headers = collect(array_shift($rows))
      ->map(fn ($header) => Str::lower(trim((string) $header)))
      ->values();

    $sections = [];
    foreach ($rows as $row) {
      if (blank(implode('', $row))) {
        continue;
      }

      $data = [];
      foreach ($headers as $index => $header) {
        $data[$header] = trim((string) ($row[$index] ?? ''));
      }

      $sectionName = $data['section'] ?? '';
      $sectionId = null;

      if ($sectionName !== '') {
        if (!isset($sections[$sectionName])) {
          $sections[$sectionName] = (string) Str::uuid();
          $schema['fields'][] = [
            'id' => $sections[$sectionName],
            'type' => 'section',
            'label' => $sectionName,
            'description' => '',
          ];
        }
        $sectionId = $sections[$sectionName];
      }

      $field = $this->makeField($data);
      $field['section_id'] = $sectionId;
      $schema['fields'][] = $field;
    }

    return $schema;
  }

  protected function makeField(array $row): array
  {
    $type = $row['type'] ?: 'text';

    $field = [
      'id' => (string) Str::uuid(),
      'type' => $type,
      'label' => $row['label'],
      'key' => Str::snake($row['label']),
      'required' => Str::lower($row['required']) === 'yes',
      'help_text' => '',
    ];

    switch ($type) {
      case 'text':
      case 'textarea':
        $field['placeholder'] = '';
        $field['default'] = '';
        $field['validation'] = [
          'min_length' => null,
          'max_length' => null,
        ];
        break;
      case 'email':
      case 'phone':
        $field['placeholder'] = '';
        $field['default'] = '';
        break;
      case 'number':
        $field['placeholder'] = '';
        $field['default'] = null;
        $field['validation'] = [
          'min' => null,
          'max' => null,
        ];
        break;
      case 'dropdown':
      case 'radio':
      case 'checkbox':
        $field['options'] = collect(explode(',', $row['options'] ?? ''))
          ->filter()
          ->map(fn ($option) => [
            'label' => trim($option),
            'value' => Str::slug(trim($option), '_'),
          ])
          ->values()
          ->toArray();
        break;
      case 'file':
        break;
      case 'date':
        break;
      case 'rating':
        $field['max'] = 5;
        break;
    }

    return $field;
  }
}