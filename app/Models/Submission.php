<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Submission extends Model
{
  protected $fillable = [
    'form_id',
    'answers',
    'ip_address',
    'user_agent',
    'submitted_at',
  ];

  protected $casts = [
    'answers' => 'array',
    'submitted_at' => 'datetime',
  ];

  public function form()
  {
    return $this->belongsTo(Form::class);
  }
}