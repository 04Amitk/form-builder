<flux:textarea wire:model="values.{{ $field['key'] }}" :label="$field['label']" :placeholder="$field['placeholder'] ?? ''"
  :rows="$field['rows'] ?? 3" :required="$field['required'] ?? false" :description="$field['help_text'] ?? ''" />
