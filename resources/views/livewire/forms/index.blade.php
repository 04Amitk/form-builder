<flux:card class="space-y-6">
  <div class="flex items-center justify-between">
    <div>
      <flux:heading size="xl"> Forms </flux:heading>
      <flux:text> Manage your forms </flux:text>
    </div>
    <flux:button :href="route('forms.create')" wire:navigate variant="primary">New Form</flux:button>
  </div>

  <flux:input wire:model.live.debounce.300ms="search" clearable icon="magnifying-glass" placeholder="Search forms..." />

  <flux:table>
    <flux:table.columns>
      <flux:table.column>Name</flux:table.column>
      <flux:table.column>Status</flux:table.column>
      <flux:table.column>Created</flux:table.column>
      <flux:table.column align="end"> Actions </flux:table.column>
    </flux:table.columns>

    <flux:table.rows :paginate="$forms">
      @forelse($forms as $form)
        <flux:table.row>
          <flux:table.cell> {{ $form->name }} </flux:table.cell>
          <flux:table.cell> {{ $form->status->value }} </flux:table.cell>
          <flux:table.cell>{{ $form->created_at->format('d M Y') }}</flux:table.cell>

          <flux:table.cell align="end">
            <div class="flex justify-end gap-2">
              <flux:button size="sm" :href="route('forms.edit', $form)" wire:navigate>Edit</flux:button>
              <flux:button size="sm" :href="route('forms.show', $form)" target="_blank">Open</flux:button>
              <flux:button size="sm" :href="route('forms.submissions.index', $form)" wire:navigate>Submissions</flux:button>
              <flux:button size="sm" variant="danger" wire:click="delete('{{ $form->uuid }}')" wire:confirm="Delete this form?">
                Delete
              </flux:button>
            </div>
          </flux:table.cell>
        </flux:table.row>
      @empty
        <flux:table.row>
          <flux:table.cell colspan="4">
            <div class="py-8 text-center">
              <flux:text> No forms found. </flux:text>
            </div>
          </flux:table.cell>
        </flux:table.row>
      @endforelse
    </flux:table.rows>
  </flux:table>
</flux:card>
