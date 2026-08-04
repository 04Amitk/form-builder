<flux:card class="space-y-6">
  <div class="flex items-center justify-between">
    <div>
      <flux:heading size="xl"> {{ $form->name }} </flux:heading>
      <flux:text> Form Submissions </flux:text>
    </div>
    <div class="flex gap-2">
      <flux:button wire:click="export" variant="primary">Export CSV</flux:button>
      <flux:button :href="route('forms.edit', $form)" wire:navigate>Builder</flux:button>
      <flux:button :href="route('forms.show', $form)" target="_blank">Open Form</flux:button>
    </div>
  </div>

  <flux:input wire:model.live.debounce.300ms="search" clearable icon="magnifying-glass" placeholder="Search by submission ID..." />

  <flux:table class="data-loading:opacity-50" :paginate="$submissions">
    <flux:table.columns>
      <flux:table.column>ID</flux:table.column>
      <flux:table.column> Submitted At </flux:table.column>
      <flux:table.column align="end"> Action </flux:table.column>
    </flux:table.columns>

    <flux:table.rows>
      @forelse($submissions as $submission)
        <flux:table.row>
          <flux:table.cell> #{{ $submission->id }} </flux:table.cell>
          <flux:table.cell>{{ $submission->submitted_at->format('d M Y H:i') }}</flux:table.cell>
          <flux:table.cell align="end">
            <flux:button size="sm" :href="route('forms.submissions.show', [$form, $submission])" wire:navigate>View</flux:button>
          </flux:table.cell>
        </flux:table.row>
      @empty
        <flux:table.row>
          <flux:table.cell colspan="3">
            <div class="py-10 text-center">
              <flux:text> No submissions found. </flux:text>
            </div>
          </flux:table.cell>
        </flux:table.row>
      @endforelse
    </flux:table.rows>
  </flux:table>
</flux:card>
