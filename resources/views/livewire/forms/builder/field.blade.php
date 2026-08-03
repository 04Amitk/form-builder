@php
  $isSelected = $selectedField === $field['id'];

  $displayLabel = match ($field['type']) {
      'heading' => $field['text'] ?? 'Heading',
      'section' => $field['label'] ?? 'Section',
      default => $field['label'] ?? ucfirst($field['type']),
  };
@endphp

<div
  class="{{ $isSelected ? 'border-primary-500 ring-2 ring-primary-100' : 'border-zinc-200 hover:border-zinc-300' }} group rounded-lg border bg-white transition"
  wire:key="field-{{ $field['id'] }}">
  <div class="flex cursor-pointer items-center justify-between px-4 py-3" wire:click="selectField('{{ $field['id'] }}')">
    <div class="flex items-center gap-3">
      <button class="drag-handle cursor-move text-zinc-400 hover:text-zinc-600" type="button" title="Drag">
        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M8 6h.01M8 12h.01M8 18h.01M16 6h.01M16 12h.01M16 18h.01" />
        </svg>
      </button>

      <div>

        <div class="flex items-center gap-2">
          <span class="font-medium text-zinc-900">
            {{ $displayLabel }}
          </span>

          @if ($field['required'] ?? false)
            <span class="rounded bg-red-100 px-2 py-0.5 text-xs font-medium text-red-700">
              Required
            </span>
          @endif
        </div>

        <div class="text-sm text-zinc-500">
          {{ ucfirst($field['type']) }}
          @isset($field['key'])
            • {{ $field['key'] }}
          @endisset
        </div>

        {{-- @isset($field['section_id'])
          <div class="text-sm text-zinc-500">
            Section
            • {{ $field['section_id'] }}
          </div>
        @endisset --}}
      </div>
    </div>

    <div class="flex items-center gap-2 opacity-0 transition group-hover:opacity-100">

      <button class="rounded p-2 text-zinc-500 hover:bg-zinc-100 hover:text-zinc-700" type="button" title="Duplicate"
        wire:click.stop="duplicateField('{{ $field['id'] }}')">
        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2M10 10h8a2 2 0 012 2v6a2 2 0 01-2 2h-8a2 2 0 01-2-2v-6a2 2 0 012-2z" />
        </svg>
      </button>

      <button class="rounded p-2 text-red-500 hover:bg-red-50" type="button" title="Delete"
        wire:click.stop="deleteField('{{ $field['id'] }}')" wire:confirm="Delete this field?">
        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round"
            d="M19 7L5 7M10 11v6M14 11v6M6 7l1-2h10l1 2M8 7V5a1 1 0 011-1h6a1 1 0 011 1v2m-9 0h10v12a2 2 0 01-2 2H8a2 2 0 01-2-2V7z" />
        </svg>
      </button>

    </div>

  </div>

</div>
