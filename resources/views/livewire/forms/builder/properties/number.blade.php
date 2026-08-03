<flux:input wire:model.live.debounce.500ms="editingField.placeholder" label="Placeholder" />
<flux:input wire:model.live.debounce.500ms="editingField.default" label="Default Value" />

<div class="grid grid-cols-3 gap-4">
  <flux:input type="number" wire:model.live.debounce.500ms="editingField.validation.min" label="Min" />
  <flux:input type="number" wire:model.live.debounce.500ms="editingField.validation.max" label="Max" />
  <flux:input type="number" wire:model.live.debounce.500ms="editingField.validation.step" label="Step" />
</div>
