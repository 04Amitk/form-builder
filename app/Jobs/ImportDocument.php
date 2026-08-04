<?php

namespace App\Jobs;

use App\Enums\ImportStatus;
use App\Models\ImportRequest;
use App\Services\AI\FormGenerator;
use App\Services\AI\SchemaRepairer;
use App\Services\AI\SchemaValidator;
use App\Services\Import\ImportService;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Throwable;

class ImportDocument implements ShouldQueue
{
  use Queueable;

  public function __construct(
    public ImportRequest $request,
  ) {
  }

  public function handle(ImportService $service, FormGenerator $generator): void
  {
    $this->request->update(['status' => ImportStatus::Processing]);
    $start = microtime(true);
    try {
      $schema = $service->parse(storage_path('app/private/' . $this->request->file_name));
      $result = $generator->enhance($schema);
      $schema = SchemaRepairer::repair($result['schema']);
      if (!SchemaValidator::validate($schema)) {
        throw new \RuntimeException('Generated schema is invalid.');
      }

      $this->request->update([
        'status' => ImportStatus::Completed,
        'parsed_schema' => $schema,
        'provider' => 'gemini',
        'model' => config('services.gemini.model'),
        'input_tokens' => $result['usage']['input_tokens'] ?? 0,
        'output_tokens' => $result['usage']['output_tokens'] ?? 0,
        'total_tokens' => $result['usage']['total_tokens'] ?? 0,
        'latency_ms' => (int) ((microtime(true) - $start) * 1000),
      ]);
    } catch (Throwable $e) {
      $this->request->update([
        'status' => ImportStatus::Failed,
        'error' => $e->getMessage(),
      ]);

      logger()->error('Import failed for request ' . $this->request->id . ': ' . $e->getMessage(), [
        'request_id' => $this->request->id,
        'error' => $e->getMessage(),
        'stack_trace' => $e->getTraceAsString(),
      ]);
      throw $e;
    }
  }
}