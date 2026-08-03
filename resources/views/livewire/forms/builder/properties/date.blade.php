<div class="grid grid-cols-2 gap-4">
  <flux:input type="date" wire:model.live.debounce.500ms="editingField.validation.min" label="Min Date" />
  <flux:input type="date" wire:model.live.debounce.500ms="editingField.validation.max" label="Max Date" />
</div>
