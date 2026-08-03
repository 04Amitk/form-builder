<div class="rounded-xl border border-zinc-200 bg-white">

  <div class="border-b border-zinc-200 px-6 py-4">
    <h2 class="text-lg font-semibold">
      Properties
    </h2>
  </div>

  @if (!$selectedField)
    <div class="p-6 text-center text-sm text-zinc-500">
      Select a field to edit its properties.
    </div>
  @else
    <div class="space-y-6 p-6">
      @include('livewire.forms.builder.properties.common')
      @includeIf('livewire.forms.builder.properties.' . $editingField['type'])
    </div>
  @endif

</div>
