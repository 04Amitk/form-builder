<?php

namespace App\Services\AI;

use Illuminate\Support\Str;

class SchemaRepairer
{
  public static function repair(array $schema): array
  {
    $schema['version'] ??= 1;
    $schema['title'] ??= 'Untitled Form';
    $schema['description'] ??= '';
    $schema['fields'] ??= [];

    $templates = FieldSchema::defaults();

    foreach ($schema['fields'] as &$field) {
      $type = $field['type'] ?? 'text';

      if (!isset($templates[$type])) {
        $type = 'text';
      }

      $field = array_replace($templates[$type], $field);
      if (empty($field['id']) || $field['id'] === '<generate-uuid>') {
        $field['id'] = (string) Str::uuid();
      }

      if (isset($field['label']) && (empty($field['key']) || $field['key'] === '<generate-unique-key>')) {
        $field['key'] = Str::snake($field['label']);
      }
    }

    return $schema;
  }

  protected static function isValidType(string $type): bool
  {
    foreach (config('form-builder.field_types') as $fieldType) {
      if ($fieldType['type'] === $type) {
        return true;
      }
    }
    return false;
  }
}