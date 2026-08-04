<flux:input type="number" wire:model="values.{{ $field['key'] }}" :label="$field['label']" :placeholder="$field['placeholder'] ?? ''"
  :required="$field['required'] ?? false" :description="$field['help_text'] ?? ''" :min="$field['validation']['min'] ?? null"
  :max="$field['validation']['max'] ?? null" :step="$field['validation']['step'] ?? null" />
