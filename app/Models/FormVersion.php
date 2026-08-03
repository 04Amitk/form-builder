<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FormVersion extends Model
{
  protected $fillable = [
    'form_id',
    'version',
    'schema',
    'created_by',
  ];

  protected $casts = [
    'schema' => 'array',
  ];

  public function form()
  {
    return $this->belongsTo(Form::class);
  }

  public function creator()
  {
    return $this->belongsTo(User::class, 'created_by');
  }
}