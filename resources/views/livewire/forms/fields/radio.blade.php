<div class="space-y-2">
  <flux:label :required="$field['required'] ?? false">
    {{ $field['label'] }}
  </flux:label>

  @if (!empty($field['help_text']))
    <flux:description>
      {{ $field['help_text'] }}
    </flux:description>
  @endif

  <flux:radio.group wire:model="values.{{ $field['key'] }}">
    @foreach ($field['options'] ?? [] as $option)
      <flux:radio :value="$option['value']" :label="$option['label']" />
    @endforeach
  </flux:radio.group>
</div>
