<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
  public function up(): void
  {
    Schema::create('import_requests', function (Blueprint $table) {
      $table->id();
      $table->timestamps();
      $table->foreignId('form_id')->nullable()->constrained()->nullOnDelete();
      $table->string('file_name');
      $table->string('file_type');
      $table->string('status')->default('pending');
      $table->json('parsed_schema')->nullable();
      $table->string('provider')->nullable();
      $table->string('model')->nullable();
      $table->unsignedInteger('input_tokens')->default(0);
      $table->unsignedInteger('output_tokens')->default(0);
      $table->unsignedInteger('total_tokens')->default(0);
      $table->unsignedInteger('latency_ms')->default(0);
      $table->text('error')->nullable();

      $table->index('status');
    });
  }

  public function down(): void
  {
    Schema::dropIfExists('import_requests');
  }
};
