<?php

use App\Livewire\Forms\Show;
use Illuminate\Support\Facades\Route;
use App\Livewire\Forms\Builder;
use App\Livewire\Forms\Index;
use App\Livewire\Forms\Import;
use App\Livewire\Imports\Preview;
use App\Livewire\Forms\Submissions\Index as SubmissionIndex;
use App\Livewire\Forms\Submissions\Show as SubmissionShow;

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
  Route::get('/forms/import', Import::class)->name('forms.import');

  Route::get('/imports/{importRequest}/preview', Preview::class)->name('imports.preview');

  Route::prefix('forms/{form:uuid}')->group(function () {
    Route::get('/edit', Builder::class)->name('forms.edit');
    Route::get('/submissions', SubmissionIndex::class)->name('forms.submissions.index');
    Route::get('/submissions/{submission}', SubmissionShow::class)->name('forms.submissions.show');
  });
});

Route::get('/forms/{form:slug}', Show::class)->name('forms.show');

require __DIR__ . '/auth.php';
