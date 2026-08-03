<?php

use App\Enums\AIGenerationStatus;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
  public function up(): void
  {
    Schema::create('ai_requests', function (Blueprint $table) {
      $table->id();
      $table->timestamps();
      $table->foreignId('form_id')->nullable()->constrained()->nullOnDelete();
      $table->longText('prompt');
      $table->string('operation');
      $table->string('provider');
      $table->string('model');
      $table->string('status')->default(AIGenerationStatus::Pending->value);
      $table->unsignedInteger('input_tokens')->default(0);
      $table->unsignedInteger('output_tokens')->default(0);
      $table->unsignedInteger('total_tokens')->default(0);
      $table->unsignedInteger('latency_ms')->default(0);
      $table->json('response')->nullable();
      $table->text('error')->nullable();

      $table->index(['form_id', 'status']);
    });
  }

  public function down(): void
  {
    Schema::dropIfExists('ai_requests');
  }
};