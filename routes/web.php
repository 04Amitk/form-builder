<?php

use Illuminate\Support\Facades\Route;
use App\Livewire\Forms\Builder;
use App\Livewire\Forms\Index;

Route::view('/', 'welcome');

Route::view('dashboard', 'dashboard')
  ->middleware(['auth', 'verified'])
  ->name('dashboard');

Route::view('profile', 'profile')
  ->middleware(['auth'])
  ->name('profile');


Route::middleware(['auth'])->group(function () {
  Route::get('forms', Index::class)->name('forms.index');
  Route::get('forms/create', Builder::class)->name('forms.create');
  Route::get('forms/{form:uuid}', Builder::class)->name('forms.edit');
});

require __DIR__ . '/auth.php';
