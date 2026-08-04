<?php

namespace App\Livewire\Forms;

use App\Models\Form;
use App\Models\Submission;
use Illuminate\Validation\Rule;
use Livewire\Component;
use Livewire\Attributes\Computed;

class Show extends Component
{
  public Form $form;
  public array $values = [];

  public function mount(Form $form): void
  {
    $this->form = $form;
    foreach ($form->schema['fields'] as $field) {
      if (!isset($field['key'])) {
        continue;
      }

      if ($field['type'] === 'checkbox') {
        $this->values[$field['key']] = [];
      }
      else {
        $this->values[$field['key']] = $field['default'] ?? null;
      }
    }
  }

  protected function rules(): array
  {
    $rules = [];

    foreach ($this->form->schema['fields'] as $field) {
      if (!isset($field['key'])) {
        continue;
      }

      $fieldRules = [];
      $options = collect($field['options'] ?? [])
        ->pluck('value')
        ->all();

      if ($field['required'] ?? false) {
        $fieldRules[] = 'required';
      }
      else {
        $fieldRules[] = 'nullable';
      }

      switch ($field['type']) {
        case 'text':
        case 'textarea':
          $fieldRules[] = 'string';
          if (!empty($field['validation']['min_length'])) {
            $fieldRules[] = 'min:' . $field['validation']['min_length'];
          }
          if (!empty($field['validation']['max_length'])) {
            $fieldRules[] = 'max:' . $field['validation']['max_length'];
          }
          break;
        case 'email':
          $fieldRules[] = 'email';
          break;
        case 'phone':
          $fieldRules[] = 'string';
          break;
        case 'number':
          $fieldRules[] = 'numeric';
          if (isset($field['validation']['min'])) {
            $fieldRules[] = 'min:' . $field['validation']['min'];
          }
          if (isset($field['validation']['max'])) {
            $fieldRules[] = 'max:' . $field['validation']['max'];
          }
          break;
        case 'date':
          $fieldRules[] = 'date';
          if (isset($field['validation']['min'])) {
            $fieldRules[] = 'after_or_equal:' . $field['validation']['min'];
          }
          if (isset($field['validation']['max'])) {
            $fieldRules[] = 'before_or_equal:' . $field['validation']['max'];
          }
          break;
        case 'dropdown':
        case 'radio':
          $fieldRules[] = Rule::in($options);
          break;
        case 'checkbox':
          $fieldRules[] = ['array', 'array.*' => Rule::in($options)];
          break;
        case 'file':
          $fieldRules[] = 'file';
          if (isset($field['max'])) {
            $fieldRules[] = 'max:' . $field['max'];
          }
          if (isset($field['accept'])) {
            $fieldRules[] = 'mimes:' . $field['accept'];
          }
          break;
        case 'rating':
          $fieldRules[] = 'integer';
          $fieldRules[] = 'min:1';
          if (!empty($field['max'])) {
            $fieldRules[] = 'max:' . $field['max'];
          }
          break;
      }

      $rules['values.' . $field['key']] = $fieldRules;
    }

    return $rules;
  }

  protected function validationAttributes(): array
  {
    $attributes = [];
    foreach ($this->form->schema['fields'] as $field) {
      if (!isset($field['key'])) {
        continue;
      }
      $attributes['values.' . $field['key']] = $field['label'];
    }
    return $attributes;
  }

  #[Computed]
  public function groupedFields(): array
  {
    $sections = [];
    $unsectioned = [];

    foreach ($this->form->schema['fields'] as $field) {
      if ($field['type'] === 'section') {
        $sections[$field['id']] = [
          'section' => $field,
          'fields' => [],
        ];
        continue;
      }

      if (empty($field['section_id'])) {
        $unsectioned[] = $field;
        continue;
      }

      if (isset($sections[$field['section_id']])) {
        $sections[$field['section_id']]['fields'][] = $field;
      }
    }

    return [
      'unsectioned' => $unsectioned,
      'sections' => array_values($sections),
    ];
  }

  public function submit(): void
  {
    $validated = $this->validate();

    Submission::create([
      'form_id' => $this->form->id,
      'answers' => $validated['values'],
      'ip_address' => request()->ip(),
      'user_agent' => request()->userAgent(),
    ]);

    session()->flash('success', 'Form submitted successfully.');
    $this->mount($this->form);
  }

  public function render()
  {
    return view('livewire.forms.show')->layout('layouts.app', ['hideHeader' => true]);
  }
}