<flux:card class="mx-auto max-w-3xl space-y-6">
  <flux:heading size="xl">Import Form</flux:heading>
  <flux:text>Upload a Word (.docx) or Excel (.xlsx) file to generate an editable form.</flux:text>

  <flux:card>
    <div class="space-y-4">
      <flux:input type="file" wire:model="file" accept=".docx,.xlsx" />
      @error('file')
        <flux:text color="red">{{ $message }}</flux:text>
      @enderror

      <div class="flex justify-end">
        <flux:button variant="primary" wire:click="import" wire:loading.attr="disabled">Import</flux:button>
      </div>
    </div>
  </flux:card>

  @if ($importRequestId)
    <div wire:poll.2s="refreshImport">
      @if ($this->importRequest)
        @php
          $color = match ($this->importRequest->status) {
              \App\Enums\ImportStatus::Pending => 'zinc',
              \App\Enums\ImportStatus::Processing => 'blue',
              \App\Enums\ImportStatus::Completed => 'green',
              \App\Enums\ImportStatus::Failed => 'red',
          };
        @endphp

        <flux:badge :color="$color">
          {{ $this->importRequest->status->name }}
        </flux:badge>
      @endif
    </div>
  @endif

  @if ($parsedSchema)
    <flux:card>
      <flux:heading>Parsed Schema</flux:heading>
      <flux:textarea rows="15" readonly>
        {{ json_encode($parsedSchema, JSON_PRETTY_PRINT) }}
      </flux:textarea>
    </flux:card>
  @endif
</flux:card>
