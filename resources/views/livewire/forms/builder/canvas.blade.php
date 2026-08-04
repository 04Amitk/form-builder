<div class="rounded-xl border border-zinc-200 bg-zinc-50 p-6" x-on:dragover.prevent
  x-on:drop.prevent="
        $wire.addField(
            event.dataTransfer.getData('field-type')
        )
    ">
  @if (empty($schema['fields']))
    <div class="flex h-96 items-center justify-center rounded-lg border-2 border-dashed border-zinc-300 bg-white">
      <div class="text-center">
        <div class="text-lg font-medium text-zinc-600">Your form is empty</div>

        <div class="mt-2 text-sm text-zinc-500">
          Add a field from the left panel to start building your form.
        </div>
      </div>
    </div>
  @else
    <div class="space-y-3" id="builder-canvas">
      @foreach ($schema['fields'] as $field)
        @include('livewire.forms.builder.field', ['field' => $field])
      @endforeach
    </div>

  @endif
</div>
