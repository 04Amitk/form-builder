<?php

namespace App\Models;

use App\Enums\ImportStatus;
use Illuminate\Database\Eloquent\Model;

class ImportRequest extends Model
{
  protected $fillable = [
    'form_id',
    'file_name',
    'file_type',
    'status',
    'parsed_schema',
    'provider',
    'model',
    'input_tokens',
    'output_tokens',
    'total_tokens',
    'latency_ms',
    'error',
  ];

  protected $casts = [
    'parsed_schema' => 'array',
    'status' => ImportStatus::class,
  ];
}