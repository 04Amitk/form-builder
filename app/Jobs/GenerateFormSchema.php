<?php

namespace App\Jobs;

use App\Enums\AIGenerationStatus;
use App\Models\AIRequest;
use App\Services\AI\FormGenerator;
use App\Services\AI\SchemaRepairer;
use App\Services\AI\SchemaValidator;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Throwable;

class GenerateFormSchema implements ShouldQueue
{
  use Queueable;

  public int $tries = 3;
  public array $backoff = [5, 10];

  public function __construct(
    public AIRequest $request,
  ) {
  }

  public function handle(FormGenerator $generator): void
  {
    $this->request->update([
      'status' => AIGenerationStatus::Processing,
    ]);

    $start = microtime(true);
    try {
      $result = $this->generate($generator);
      $schema = SchemaRepairer::repair($result['schema']);
      if (!SchemaValidator::validate($schema)) {
        throw new \RuntimeException('Generated schema is invalid.');
      }

      $this->request->update([
        'status' => AIGenerationStatus::Completed,
        'response' => $schema,
        'input_tokens' => $result['usage']['input_tokens'],
        'output_tokens' => $result['usage']['output_tokens'],
        'total_tokens' => $result['usage']['total_tokens'],
        'latency_ms' => (int) ((microtime(true) - $start) * 1000),
      ]);

    } catch (Throwable $e) {
      $this->request->update([
        'status' => AIGenerationStatus::Failed,
        'error' => $e->getMessage(),
        'latency_ms' => (int) ((microtime(true) - $start) * 1000),
      ]);
      logger()->error('AI generation failed', [
        'request_id' => $this->request->id,
        'error' => $e->getMessage(),
        'trace' => $e->getTraceAsString(),
      ]);
      throw $e;
    }
  }

  protected function generate(FormGenerator $generator): array
  {
    if ($this->request->operation === 'edit' && $this->request->form) {
      return $generator->edit($this->request->form->schema, $this->request->prompt);
    }

    return $generator->generate($this->request->prompt);
  }
}