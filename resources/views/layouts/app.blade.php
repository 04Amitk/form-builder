<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>{{ config('app.name', 'Laravel') }}</title>

  <!-- Fonts -->
  <link href="https://fonts.bunny.net" rel="preconnect">
  <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

  <!-- Scripts -->
  @vite(['resources/css/app.css', 'resources/js/app.js'])

  @fluxAppearance()
</head>

<body class="font-sans antialiased">
  <div class="max-h-screen bg-gray-100 dark:bg-gray-900">
    <livewire:layout.navigation />

    <!-- Page Heading -->
    @if (isset($header))
      <header class="bg-white shadow dark:bg-gray-800">
        <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
          {{ $header }}
        </div>
      </header>
    @endif

    <!-- Page Content -->
    <main class="m-4 mb-0!">
      {{ $slot }}
    </main>

  </div>

  @persist('toast')
    <flux:toast.group>
      <flux:toast position="bottom right" />
    </flux:toast.group>
  @endpersist
  @fluxScripts()
</body>

</html>
