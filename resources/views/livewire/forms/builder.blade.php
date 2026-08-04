<div class="flex h-full gap-6">
  <div class="w-64 shrink-0">
    @include('livewire.forms.builder.palette')
  </div>

  <div class="min-w-0 flex-1">
    <flux:card class="mb-4">
      <div class="mb-4 flex items-center gap-4">
        <div class="flex-1">
          <flux:input wire:model.live.debounce.500="name" placeholder="Form Name" />
        </div>
        <flux:button variant="primary" wire:click="save">Save</flux:button>
        <flux:button.group>
          <flux:button wire:click="showCanvas" :variant="$viewMode === 'canvas' ? 'primary' : 'filled'">
            Canvas
          </flux:button>
          <flux:button wire:click="showJson" :variant="$viewMode === 'json' ? 'primary' : 'filled'">
            JSON
          </flux:button>
        </flux:button.group>
      </div>

      @if ($form)
        <div class="flex flex-wrap items-end gap-4">
          <flux:field class="flex-1">
            <flux:input label="Public URL" :value="route('forms.show', $form)" readonly />
          </flux:field>
          <flux:button :href="route('forms.show', $form)" target="_blank">Open</flux:button>
        </div>
      @endif
    </flux:card>

    @if ($viewMode === 'canvas')
      @include('livewire.forms.builder.canvas')
    @else
      <flux:card>
        <div class="space-y-4">
          <h2 class="text-lg font-semibold">
            JSON Schema
          </h2>
          <flux:textarea wire:model.live.debounce.500ms="schemaJson" rows="20" />
        </div>
      </flux:card>
    @endif
  </div>

  <div class="w-96 shrink-0">
    @include('livewire.forms.builder.properties')
  </div>
</div>
