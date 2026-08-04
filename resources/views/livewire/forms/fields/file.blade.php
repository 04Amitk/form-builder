<flux:input type="file" wire:model="values.{{ $field['key'] }}" :label="$field['label']" :description="$field['help_text'] ?? ''"
  :required="$field['required'] ?? false" :accept="$field['accept'] ?? ''" />
