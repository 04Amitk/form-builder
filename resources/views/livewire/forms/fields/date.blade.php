<flux:input type="date" wire:model="values.{{ $field['key'] }}" :label="$field['label']" :required="$field['required'] ?? false"
  :description="$field['help_text'] ?? ''" :min="$field['validation']['min'] ?? null" :max="$field['validation']['max'] ?? null" />
