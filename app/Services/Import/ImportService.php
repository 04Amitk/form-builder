<?php

namespace App\Services\Import;

class ImportService
{
  public function parse(string $path): array
  {
    $extension = strtolower(pathinfo($path, PATHINFO_EXTENSION));
    return match ($extension) {
      'docx' => app(WordParser::class)->parse($path),
      'xlsx',
      'xls' => app(ExcelParser::class)->parse($path),
      default => throw new \RuntimeException('Unsupported file type.'),
    };
  }
}