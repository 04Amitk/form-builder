<?php

use App\Livewire\Forms\Show;
use Illuminate\Support\Facades\Route;
use App\Livewire\Forms\Builder;
use App\Livewire\Forms\Index;

Route::permanentRedirect('/', '/dashboard');

Route::view('dashboard', 'dashboard')
  ->middleware(['auth', 'verified'])
  ->name('dashboard');

Route::view('profile', 'profile')
  ->middleware(['auth'])
  ->name('profile');


Route::middleware(['auth'])->group(function () {
  Route::get('forms', Index::class)->name('forms.index');
  Route::get('forms/create', Builder::class)->name('forms.create');

  Route::prefix('forms/{form:uuid}')->group(function () {
    Route::get('/edit', Builder::class)->name('forms.edit');
  });
});

Route::get('/forms/{form:slug}', Show::class)->name('forms.show');

require __DIR__ . '/auth.php';
