<?php

use App\Enums\FormStatus;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
  /**
   * Run the migrations.
   */
  public function up(): void
  {
    Schema::create('forms', function (Blueprint $table) {
      $table->id();
      $table->uuid('uuid')->unique();
      $table->timestamps();
      $table->softDeletes();
      $table->string('name');
      $table->string('slug')->unique();
      $table->text('description')->nullable();
      $table->json('schema');
      $table->string('status')->default(FormStatus::Draft->value);
      $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();
      $table->timestamp('published_at')->nullable();

      // Indexes
      $table->index('status');
      $table->index('created_by');
      $table->index('published_at');
    });
  }

  /**
   * Reverse the migrations.
   */
  public function down(): void
  {
    Schema::dropIfExists('forms');
  }
};