<flux:card class="mx-auto max-w-3xl space-y-6 pt-4">
  <div>
    <h1 class="text-2xl font-semibold">{{ $form->name }}</h1>
    @if ($form->description)
      <p class="mt-2 text-zinc-600">{{ $form->description }}</p>
    @endif
  </div>

  @if (session('success'))
    <flux:callout variant="success">{{ session('success') }}</flux:callout>
  @endif

  <form class="space-y-8" wire:submit="submit">
    @foreach ($this->groupedFields['unsectioned'] as $field)
      @include('livewire.forms.fields.' . $field['type'], ['field' => $field])
    @endforeach

    @foreach ($this->groupedFields['sections'] as $group)
      @include('livewire.forms.fields.section', ['field' => $group['section']])
      <div class="mt-4 space-y-6">
        @foreach ($group['fields'] as $field)
          @include('livewire.forms.fields.' . $field['type'], ['field' => $field])
        @endforeach
      </div>
    @endforeach

    <flux:button type="submit">Submit</flux:button>
  </form>
</flux:card>
