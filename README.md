# Project Documentation

# Form Builder

AI-powered dynamic form builder built with Laravel 11, Livewire 3 and Flux UI.

## Features

- Drag & Drop Form Builder
- Dynamic Form Rendering
- Form Submissions
- AI Form Generation (Gemini)
- AI Form Editing
- Word (.docx) Import
- Excel (.xlsx) Import
- Preview & Mapping Screen
- Queue-based AI Generation
- Queue-based Import
- Laravel Excel Integration
- Export (Excel)
- Responsive UI

---

# Live Demo

URL

```
https://your-domain.com
```

Credentials

```
Email: admin@test.com
Password: password
```

---

# Tech Stack

- Laravel 11
- PHP 8.3+
- Livewire 3
- Flux UI
- MySQL
- Laravel Excel
- PhpSpreadsheet
- PHPWord
- Gemini API

---

# Setup

Clone repository

```bash
git clone https://github.com/04Amitk/form-builder.git
```

Install

```bash
composer install
npm install
```

Copy environment

```bash
cp .env.example .env
```

Generate key

```bash
php artisan key:generate
```

Configure database.

Run migrations.

```bash
php artisan migrate
```

Create storage link.

```bash
php artisan storage:link
```

Run queues.

```bash
php artisan queue:work
```

Run application.

```bash
php artisan serve
```

---

# Environment Variables

```env
APP_NAME=

APP_URL=

DB_CONNECTION=
DB_HOST=
DB_PORT=
DB_DATABASE=
DB_USERNAME=
DB_PASSWORD=

QUEUE_CONNECTION=database

GEMINI_API_KEY=
GEMINI_MODEL=gemini-3.6-flash
```

---

# Architecture Overview

```
User
   │
   ▼
Livewire Components
   │
   ▼
Services
   │
   ├── AI
   ├── Import
   │
   ▼
Jobs
   │
   ├── GenerateFormSchema
   └── ImportDocument
   │
   ▼
MySQL
```

### Layers

- Livewire Components
- Service Layer
- Queue Jobs
- Models
- MySQL

---

# Database / ERD Summary

## forms

Stores form definitions.

Indexes

- slug (unique)
- status
- created_by

---

## form_submissions

Stores submitted responses.

Indexes

- form_id
- created_at

---

## ai_requests

Stores AI generation requests.

Indexes

- form_id
- status

Tracks

- provider
- model
- tokens
- latency
- response

---

## import_requests

Stores Word/Excel imports.

Indexes

- status
- form_id

Tracks

- uploaded file
- parsed schema
- import status

---

# Endpoints

## Public

```
GET /forms/{slug}
```

---

## Builder

```
GET /forms
GET /forms/create
GET /forms/{form}/edit
```

---

## Submissions

```
GET /submissions
GET /submissions/{submission}
```

## AI
Queues

```
GenerateFormSchema
```

---

## Import

```
GET /forms/import
GET /imports/{importRequest}/preview
```

Queues

```
ImportDocument
```

---

# Word Import

Uses a hybrid approach.

## Deterministic Parsing

- Headings → Sections
- Paragraphs → Fields
- Lists → Options

## AI Enhancement

Gemini improves

- Field types
- Validation
- Placeholders
- Required flags
- Help text

Preview is shown before creating the form.

---

# Excel Import

Supported layout

| Section | Label | Type | Required | Options |
|----------|-------|------|----------|----------|

AI enhances ambiguous fields after parsing.

---

# Known Limitations

- Word tables are not parsed.
- Complex nested lists are not supported.
- One documented Excel layout is supported.
- Scanned documents (OCR) are not supported.
- AI quality depends on prompt clarity.
- Queue worker must be running for AI generation and document imports.

---

# Sample Files

```
samples/

    SampleForm.docx
    SampleForm.xlsx
```

---

# AI Form Generation

## Prompt Strategy

### System Prompt

The AI model is instructed to behave as an expert form designer and return only a valid JSON form schema.

The prompt enforces the following rules:

- Return **only JSON**.
- Generate a complete editable form.
- Use only the supported field types configured in the application.
- Generate meaningful labels, keys, placeholders and validation rules.
- Generate options for dropdown, radio and checkbox fields.
- Use sections to organize long forms and assign section id to fields that belong to that section.
- Never invent new field types.
- When editing an existing form, preserve the existing schema and modify only what the user requested.

---

## Output Contract

The model must return a JSON object with the following structure:

```json
{
    "version": 1,
    "title": "",
    "description": "",
    "fields": []
}
```

Each field must match one of the supported field definitions.

Example:

```json
{
    "type": "text",
    "label": "First Name",
    "key": "first_name",
    "placeholder": "Enter your first name",
    "required": true
}
```

---

## Supported Field Types

The application only accepts the following field types:

- section
- text
- textarea
- email
- phone
- number
- date
- dropdown
- radio
- checkbox
- file
- rating

The list is loaded from the application configuration and included in every AI prompt.

---

## Hallucinated Field Types

Large language models may generate unsupported field types such as:

- address
- signature
- currency
- slider
- rich_text

These field types are not accepted.

The application validates every generated field against the supported field types. Invalid field types cause schema validation to fail and the request is rejected instead of persisting an invalid form.

---

## Schema Repair

AI responses may contain missing properties or incomplete fields.

Before validation, every generated schema is passed through `SchemaRepairer`, which:

- adds missing root properties
- fills missing field properties using predefined defaults
- generates missing UUIDs
- generates missing field keys from labels
- converts incomplete fields into valid editable fields

This ensures the builder always receives a consistent schema.

---

## Schema Validation

After repair, the schema is validated using `SchemaValidator`.

Validation checks include:

- required root properties exist
- supported field type
- required field properties
- valid array structures
- valid validation and option objects

Invalid schemas are rejected and are never persisted.

---

## Retries and Fallbacks

AI generation is executed as a queued job.

If generation fails:

1. the request is marked as **Failed**
2. the error is stored in the `ai_requests` table
3. no form changes are saved

The queue job is configured to retry automatically before finally marking the request as failed.

---

## AI Editing

The application supports editing an existing form using natural language.

Examples:

- Add an emergency contact section
- Make phone required
- Translate labels to Hindi

For edit operations, the current form schema is included in the prompt and the model is instructed to modify only the requested parts while preserving the rest of the schema.

---

## Monitoring

Every AI request is recorded in the `ai_requests` table.

The following information is stored:

- provider
- model
- prompt
- input_schema
- operation (generate/edit)
- status
- input tokens
- output tokens
- total tokens
- latency
- AI response
- error message (if any)

This provides visibility into AI usage and generation performance.

---

# Architecture

## Tech Stack

- PHP 8.3
- Laravel 11
- Livewire 3
- Flux UI
- MySQL
- Laravel Queues
- Gemini AI (Google Generative AI)

---

## High-Level Flow

### Form Builder

```
Builder
      │
      ▼
Canvas / JSON Editor
      │
      ▼
Schema
      │
      ▼
Save Form
      │
      ▼
forms.schema (JSON)
```

---

### Public Form

```
Published Form
        │
        ▼
Render Schema
        │
        ▼
User Submission
        │
        ▼
Validation
        │
        ▼
submissions table
```

---

### AI Generation

```
Prompt
    │
    ▼
GenerateFormSchema Job
    │
    ▼
Gemini API
    │
    ▼
SchemaRepairer
    │
    ▼
SchemaValidator
    │
    ▼
AI Request Completed
    │
    ▼
Review
    │
    ▼
Apply Schema
```

---

## Main Modules

- Form Builder
- Public Form Rendering
- Submission Management
- AI Form Generation
- AI Form Editing
- Form Export (Excel)

---

## Design Decisions

- Form definitions are stored as JSON schemas for flexibility.
- Form submissions are stored separately from form definitions.
- AI generation runs asynchronously using Laravel Queues to avoid blocking HTTP requests.
- Generated schemas are repaired and validated before being presented to the user.
- Users must explicitly review and apply AI-generated changes before saving.

---

# Database Schema & Indexing

The application uses MySQL with a normalized schema designed for scalability. Foreign keys enforce referential integrity, while indexes are added on columns frequently used for filtering, sorting and reporting.

## Tables

### forms

Stores form metadata and the JSON schema.

Indexes:

- `slug` (unique) — Used for public form URLs.
- `status` — Used when listing forms by status.
- `created_by` — Used to retrieve forms created by a user.

---

### submissions

Stores submitted form responses.

Indexes:

- `(form_id, submitted_at)` — Used for submission listing, reporting and exports.
- `form_id` (via foreign key) — Used when loading submissions for a form.

---

### ai_requests

Stores every AI generation/edit request.

Indexes:

- `(form_id, status)` — Used for polling AI generation status from the builder and viewing AI history for a form.

---

## Index Strategy

The following indexes were intentionally added because they support the application's most common queries:

| Table | Index | Purpose |
|-------|-------|---------|
| forms | `slug (UNIQUE)` | Resolve public form URLs efficiently. |
| forms | `status` | Filter forms by Draft, Published or Archived. |
| forms | `created_by` | Retrieve forms owned by a user. |
| submissions | `(form_id, submitted_at)` | List submissions in chronological order for a form and improve export performance. |
| ai_requests | `(form_id, status)` | Poll AI generation status and filter requests by form. |

## Scalability Considerations

The current indexes are sufficient for the expected workload of the application.

As the dataset grows, additional optimizations could include:

- Archiving old AI request logs.
- Exports using Laravel Queues.
- Caching frequently accessed published forms.
- Full-text search for forms if advanced searching is required.

---

