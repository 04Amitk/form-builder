<?php

namespace App\Services\AI;

class SchemaValidator
{
  public static function validate(array $schema): bool
  {
    if (!isset($schema['version'])) {
      return false;
    }

    if (!isset($schema['title'])) {
      return false;
    }

    if (!isset($schema['description'])) {
      return false;
    }

    if (!isset($schema['fields']) || !is_array($schema['fields'])) {
      return false;
    }

    $templates = FieldSchema::defaults();

    foreach ($schema['fields'] as $field) {
      if (!is_array($field)) {
        return false;
      }

      if (empty($field['type'])) {
        return false;
      }

      if (!isset($templates[$field['type']])) {
        return false;
      }

      foreach (array_keys($templates[$field['type']]) as $property) {
        if (!array_key_exists($property, $field)) {
          return false;
        }
      }

      if (isset($field['validation']) && !is_array($field['validation'])) {
        return false;
      }

      if (isset($field['options']) && !is_array($field['options'])) {
        return false;
      }

      if (isset($field['level']) && !is_numeric($field['level'])) {
        return false;
      }
    }

    return true;
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