<flux:card class="space-y-6">
  <flux:heading size="xl"> Import Preview </flux:heading>

  <flux:card>
    <table class="w-full">
      <thead>
        <tr>
          <th>Label</th>
          <th>Type</th>
          <th>Required</th>
          <th>Action</th>
        </tr>
      </thead>

      <tbody>
        @foreach ($schema['fields'] as $index => $field)
          @continue(in_array($field['type'], ['section', 'heading']))

          <tr>
            <td class="p-2">
              <flux:input wire:model.live="schema.fields.{{ $index }}.label" />
            </td>

            <td class="p-2">
              <flux:select wire:model.live="schema.fields.{{ $index }}.type">
                @foreach (config('form-builder.field_types') as $type)
                  @continue(in_array($type['type'], ['section', 'heading']))
                  <option value="{{ $type['type'] }}">{{ $type['label'] }}</option>
                @endforeach
              </flux:select>
            </td>

            <td>
              <flux:checkbox class="mx-auto!" wire:model.live="schema.fields.{{ $index }}.required" />
            </td>

            <td>
              <div class="flex justify-center gap-2">
                <flux:button size="sm" variant="danger" wire:click="removeField({{ $index }})"
                  wire:confirm="Remove this field?">Delete</flux:button>
              </div>
            </td>
          </tr>
        @endforeach
      </tbody>
    </table>
  </flux:card>

  <div class="flex justify-end">
    <flux:button variant="primary" wire:click="save"> Create Form </flux:button>
  </div>
</flux:card>
