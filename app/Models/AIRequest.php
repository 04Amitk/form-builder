<?php

namespace App\Models;

use App\Enums\AIGenerationStatus;
use Illuminate\Database\Eloquent\Model;

class AIRequest extends Model
{
  protected $table = 'ai_requests';

  protected $fillable = [
    'form_id',
    'operation',
    'prompt',
    'input_schema',
    'response',
    'provider',
    'model',
    'status',
    'attempt',
    'input_tokens',
    'output_tokens',
    'total_tokens',
    'latency_ms',
    'error',
  ];

  protected $casts = [
    'input_schema' => 'array',
    'response' => 'array',
    'status' => AIGenerationStatus::class,
  ];

  public function form()
  {
    return $this->belongsTo(Form::class);
  }
}
