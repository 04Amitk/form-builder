<flux:input wire:model.live.debounce.500ms="editingField.placeholder" label="Placeholder" />
<flux:input type="number" wire:model.live.debounce.500ms="editingField.rows" label="Rows" />
<flux:input wire:model.live.debounce.500ms="editingField.default" label="Default Value" />

<div class="grid grid-cols-2 gap-4">
  <flux:input type="number" wire:model.live.debounce.500ms="editingField.validation.min_length" label="Min Length" />
  <flux:input type="number" wire:model.live.debounce.500ms="editingField.validation.max_length" label="Max Length" />
</div>
