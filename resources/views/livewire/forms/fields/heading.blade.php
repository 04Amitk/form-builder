@php
  $level = max(1, min(6, (int) ($field['level'] ?? 2)));
@endphp

<h{{ $level }} class="font-semibold text-zinc-900">
  {{ $field['text'] }}
  </h{{ $level }}>
