<flux:select wire:model="values.{{ $field['key'] }}" :label="$field['label']" :description="$field['help_text'] ?? ''"
  :required="$field['required'] ?? false">
  <option value="">Select an option</option>
  @foreach ($field['options'] ?? [] as $option)
    <option value="{{ $option['value'] }}">
      {{ $option['label'] }}
    </option>
  @endforeach
</flux:select>
