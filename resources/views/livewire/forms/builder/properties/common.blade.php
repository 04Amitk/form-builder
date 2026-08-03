@if (!in_array($editingField['type'], ['heading', 'section']))
  <flux:input wire:model.live.debounce.500ms="editingField.label" label="Label" />
  <flux:input wire:model.live.debounce.500ms="editingField.key" label="Field Key" />
  <flux:textarea wire:model.live.debounce.500ms="editingField.help_text" label="Help Text" rows="2" />
  <flux:checkbox wire:model.live.debounce.500ms="editingField.required" label="Required" />

  @if (!empty($this->sections))
    <flux:select wire:model.live="editingField.section_id" label="Section">
      <option value="">None</option>
      @foreach ($this->sections as $section)
        <option value="{{ $section['id'] }}">
          {{ $section['label'] }}
        </option>
      @endforeach
    </flux:select>
  @endif
@endif
