<flux:card class="space-y-6">
  <div class="flex items-center justify-between">
    <div>
      <flux:heading size="xl"> Submission #{{ $submission->id }} </flux:heading>
      <flux:text>{{ $submission->submitted_at->format('d M Y H:i') }}</flux:text>
    </div>
    <flux:button :href="route('forms.submissions.index', $form)" wire:navigate>Back</flux:button>
  </div>

  <flux:card>
    <div class="space-y-6">
      @foreach ($form->schema['fields'] as $field)
        @continue(in_array($field['type'], ['heading', 'section']))
        <div class="grid grid-cols-3 gap-4">
          <div>
            <flux:label> {{ $field['label'] }} </flux:label>
          </div>

          <div class="col-span-2">
            @if ($field['type'] == 'file')
              {{ \Storage::disk('public')->url($this->displayValue($field)) }}
            @else
              {{ $this->displayValue($field) }}
            @endif
          </div>
        </div>
      @endforeach
    </div>
  </flux:card>
</flux:card>
