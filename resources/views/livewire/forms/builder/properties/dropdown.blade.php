<div class="space-y-4">
  <div class="flex items-center justify-between">
    <h3 class="text-sm font-medium">Options</h3>
    <flux:button size="sm" wire:click="addOption">Add Option</flux:button>
  </div>

  @foreach ($editingField['options'] ?? [] as $index => $option)
    <div class="flex gap-2" wire:key="dropdown-option-{{ $index }}">
      <flux:input wire:model.live="editingField.options.{{ $index }}.label" placeholder="Label" />
      <flux:input wire:model.live="editingField.options.{{ $index }}.value" placeholder="Value" />
      <flux:button size="sm" variant="danger" wire:click="removeOption({{ $index }})">Delete</flux:button>
    </div>
  @endforeach
</div>
