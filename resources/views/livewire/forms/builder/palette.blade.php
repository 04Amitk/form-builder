<div class="rounded-xl border border-zinc-200 bg-white">

  <div class="border-b border-zinc-200 px-6 py-4">
    <h2 class="text-lg font-semibold">
      Fields
    </h2>

    <p class="mt-1 text-sm text-zinc-500">
      Click a field to add it to the form.
    </p>
  </div>

  <div class="space-y-2 py-2">
    @foreach ($fieldTypes  as $field)
      <flux:button class="w-full justify-start" type="button" variant="ghost" wire:click="addField('{{ $field['type'] }}')">
        <div class="flex items-center gap-3">
          <flux:icon class="size-5 text-zinc-500" :name="$field['icon']" />

          <div class="flex flex-col items-start">
            <span class="font-medium"> {{ $field['label'] }} </span>

            <span class="text-xs text-zinc-500">
              {{ ucfirst(str_replace('_', ' ', $field['type'])) }}
            </span>
          </div>
        </div>
      </flux:button>
    @endforeach
  </div>
</div>
