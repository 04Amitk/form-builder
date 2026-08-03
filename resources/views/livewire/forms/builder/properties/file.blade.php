<div class="space-y-4">
  <flux:input wire:model.live.debounce.500ms="editingField.accept" label="Accepted Types" placeholder=".pdf,.doc,.jpg" />
  <flux:input type="number" wire:model.live.debounce.500ms="editingField.max_size" label="Maximum Size (KB)" />
  <flux:checkbox wire:model.live="editingField.multiple" label="Allow Multiple Files" />
</div>
