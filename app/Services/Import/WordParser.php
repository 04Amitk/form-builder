<?php

namespace App\Services\Import;

use Illuminate\Support\Str;
use PhpOffice\PhpWord\Element\ListItem;
use PhpOffice\PhpWord\Element\Text;
use PhpOffice\PhpWord\Element\TextRun;
use PhpOffice\PhpWord\Element\Title;
use PhpOffice\PhpWord\IOFactory;

class WordParser
{
  public function parse(string $path): array
  {
    $document = IOFactory::load($path);

    $schema = [
      'version' => 1,
      'title' => pathinfo($path, PATHINFO_FILENAME),
      'description' => '',
      'fields' => [],
    ];

    $currentSection = null;
    $lastFieldIndex = null;

    foreach ($document->getSections() as $section) {
      foreach ($section->getElements() as $element) {
        if ($element instanceof Title) {
          $currentSection = (string) Str::uuid();
          $schema['fields'][] = [
            'id' => $currentSection,
            'type' => 'section',
            'label' => trim($element->getText()),
            'description' => '',
          ];
          continue;
        }

        if ($element instanceof ListItem) {
          $text = trim($element->getText());
          if ($lastFieldIndex !== null && isset($schema['fields'][$lastFieldIndex])) {
            $schema['fields'][$lastFieldIndex]['options'][] = [
              'label' => $text,
              'value' => Str::slug($text, '_'),
            ];
          }
          continue;
        }

        $text = null;
        if ($element instanceof Text) {
          $text = trim($element->getText());
        }

        if ($element instanceof TextRun) {
          $buffer = '';
          foreach ($element->getElements() as $child) {
            if (method_exists($child, 'getText')) {
              $buffer .= $child->getText();
            }
          }
          $text = trim($buffer);
        }

        if (blank($text)) {
          continue;
        }

        $field = $this->makeTextField($text);
        $field['section_id'] = $currentSection;
        $schema['fields'][] = $field;
        $lastFieldIndex = array_key_last($schema['fields']);
      }
    }

    return $schema;
  }

  protected function makeTextField(string $label): array
  {
    return [
      'id' => (string) Str::uuid(),
      'type' => 'text',
      'label' => $label,
      'key' => Str::snake($label),
      'placeholder' => '',
      'required' => false,
      'help_text' => '',
      'default' => '',
      'validation' => [
        'min_length' => null,
        'max_length' => null,
      ],
    ];
  }
}