<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;

Artisan::command('inspire', function () {
  $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Schedule::command('queue:listen --max-jobs=50 --max-time=57 --tries=1')->everyMinute()->withoutOverlapping(5);
Schedule::command('queue:prune-failed --hours=48')->daily();