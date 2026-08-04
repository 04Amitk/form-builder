<flux:select wire:model="values.{{ $field['key'] }}" :label="$field['label']" :description="$field['help_text'] ?? ''"
  :required="$field['required'] ?? false">
  <option value="">Select rating</option>
  @for ($i = 1; $i <= ($field['max'] ?? 5); $i++)
    <option value="{{ $i }}">
      {{ $i }}
    </option>
  @endfor
</flux:select>
