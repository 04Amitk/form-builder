<div class="border-b border-zinc-200 pb-2">
  <h2 class="text-xl font-semibold">
    {{ $field['label'] }}
  </h2>

  @if (!empty($field['description']))
    <p class="mt-1 text-sm text-zinc-600">
      {{ $field['description'] }}
    </p>
  @endif
</div>
