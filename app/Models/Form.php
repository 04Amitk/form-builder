<?php

namespace App\Models;

use App\Enums\FormStatus;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Form extends Model
{
  use SoftDeletes;

  protected $fillable = [
    'uuid',
    'name',
    'slug',
    'description',
    'schema',
    'status',
    'created_by',
    'published_at',
  ];

  protected $casts = [
    'schema_definition' => 'array',
    'published_at' => 'datetime',
    'status' => FormStatus::class,
  ];

  public function getRouteKeyName(): string
  {
    return 'uuid';
  }

  protected static function booted(): void
  {
    static::creating(function (Form $form) {
      $form->uuid ??= (string) str()->uuid();
    });
  }

  public function scopeDraft($query)
  {
    return $query->where('status', FormStatus::Draft);
  }

  public function scopePublished($query)
  {
    return $query->where('status', FormStatus::Published);
  }

  public function scopeArchived($query)
  {
    return $query->where('status', FormStatus::Archived);
  }

  public function versions()
  {
    return $this->hasMany(FormVersion::class)->orderByDesc('version');
  }

  public function submissions()
  {
    return $this->hasMany(Submission::class);
  }

  public function creator()
  {
    return $this->belongsTo(User::class, 'created_by');
  }

  public function aiRequests()
  {
    return $this->hasMany(AIRequest::class);
  }
}