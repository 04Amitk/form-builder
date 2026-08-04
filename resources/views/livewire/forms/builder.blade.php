<div class="flex h-full gap-6">
  <div class="w-64 shrink-0">
    @include('livewire.forms.builder.palette')
  </div>

  <div class="min-w-0 flex-1">
    <flux:card class="mb-4">
      <div class="space-y-4">
        <flux:heading> AI Form Generator </flux:heading>
        <flux:textarea wire:model="prompt" rows="3" placeholder="Describe the form you want to generate..." />

        <div class="flex justify-end">
          <flux:button variant="primary" wire:click="generate" wire:loading.attr="disabled" :disabled="$aiRequestId">
            <span wire:loading.remove wire:target="generate">
              Generate
            </span>

            <span wire:loading wire:target="generate">
              Starting...
            </span>
          </flux:button>
        </div>
      </div>
    </flux:card>

    @if ($generatedSchema)
      <flux:card class="mb-4">
        <div class="flex items-center justify-between">
          <div>
            <flux:heading> AI Generated Form </flux:heading>
            <flux:text> Review the generated schema before applying it. </flux:text>
          </div>

          <div class="flex gap-2">
            <flux:button variant="primary" wire:click="applyGeneratedSchema">Apply</flux:button>
            <flux:button wire:click="discardGeneratedSchema"> Discard </flux:button>
          </div>
        </div>

        <flux:textarea class="mt-4" rows="12" readonly>
          {{ json_encode($generatedSchema, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES) }}
        </flux:textarea>
      </flux:card>
    @endif

    @if ($aiRequestId && $this->aiRequest)
      @php
        $color = match ($this->aiRequest->status) {
            \App\Enums\AIGenerationStatus::Pending => 'zinc',
            \App\Enums\AIGenerationStatus::Processing => 'blue',
            \App\Enums\AIGenerationStatus::Completed => 'green',
            \App\Enums\AIGenerationStatus::Failed => 'red',
        };
      @endphp

      <div wire:poll.2s="refreshAIRequest">
        <flux:card class="mb-4">
          <div class="flex items-center justify-between">
            <div>
              <flux:heading>AI Generation</flux:heading>
              <flux:text>
                {{ $this->aiRequest->status->name }}
              </flux:text>
            </div>

            <flux:badge :color="$color">
              {{ $this->aiRequest->status->name }}
            </flux:badge>
          </div>
        </flux:card>
      </div>
    @endif

    <flux:card class="mb-4">
      <div class="mb-4 flex items-center gap-4">
        <div class="flex-1">
          <flux:input wire:model.live.debounce.500="name" placeholder="Form Name" />
        </div>
        <flux:button variant="primary" wire:click="save" :disabled="$aiRequestId">Save</flux:button>
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
