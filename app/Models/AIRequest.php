<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AIRequest extends Model
{
  protected $table = 'ai_requests';

  protected $fillable = [
    'form_id',
    'prompt',
    'operation',
    'provider',
    'model',
    'status',
    'input_tokens',
    'output_tokens',
    'total_tokens',
    'latency_ms',
    'response',
    'error',
  ];

  protected $casts = [
    'response' => 'array',
    'status' => AIGenerationStatus::class,
  ];

  public function form()
  {
    return $this->belongsTo(Form::class);
  }
}
