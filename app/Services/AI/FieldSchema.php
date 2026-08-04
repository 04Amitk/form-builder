<?php

namespace App\Services\AI;

class FieldSchema
{
  public static function defaults(): array
  {
    return [
      'text' => [
        'id' => '<generate-uuid>',
        'type' => 'text',
        'label' => '',
        'key' => '<generate-unique-key>',
        'placeholder' => '',
        'required' => false,
        'help_text' => '',
        'default' => '',
        'section_id' => null,
        'validation' => [
          'min_length' => null,
          'max_length' => null,
        ],
      ],
      'textarea' => [
        'id' => '<generate-uuid>',
        'type' => 'textarea',
        'label' => '',
        'key' => '<generate-unique-key>',
        'placeholder' => '',
        'required' => false,
        'help_text' => '',
        'default' => '',
        'section_id' => null,
        'validation' => [
          'min_length' => null,
          'max_length' => null,
        ],
      ],
      'email' => [
        'id' => '<generate-uuid>',
        'type' => 'email',
        'label' => '',
        'key' => '<generate-unique-key>',
        'placeholder' => '',
        'required' => false,
        'help_text' => '',
        'default' => '',
        'section_id' => null,
      ],
      'phone' => [
        'id' => '<generate-uuid>',
        'type' => 'phone',
        'label' => '',
        'key' => '<generate-unique-key>',
        'placeholder' => '',
        'required' => false,
        'help_text' => '',
        'default' => '',
        'section_id' => null,
      ],
      'number' => [
        'id' => '<generate-uuid>',
        'type' => 'number',
        'label' => '',
        'key' => '<generate-unique-key>',
        'placeholder' => '',
        'required' => false,
        'help_text' => '',
        'default' => null,
        'section_id' => null,
        'validation' => [
          'min' => null,
          'max' => null,
        ],
      ],
      'date' => [
        'id' => '<generate-uuid>',
        'type' => 'date',
        'label' => '',
        'key' => '<generate-unique-key>',
        'required' => false,
        'help_text' => '',
        'default' => null,
        'section_id' => null,
        'validation' => [
          'min' => null,
          'max' => null,
        ],
      ],
      'dropdown' => [
        'id' => '<generate-uuid>',
        'type' => 'dropdown',
        'label' => '',
        'key' => '<generate-unique-key>',
        'required' => false,
        'help_text' => '',
        'default' => '',
        'section_id' => null,
        'options' => [
          [
            'label' => '',
            'value' => '',
          ],
        ],
      ],
      'radio' => [
        'id' => '<generate-uuid>',
        'type' => 'radio',
        'label' => '',
        'key' => '<generate-unique-key>',
        'required' => false,
        'help_text' => '',
        'default' => '',
        'section_id' => null,
        'options' => [
          [
            'label' => '',
            'value' => '',
          ],
        ],
      ],
      'checkbox' => [
        'id' => '<generate-uuid>',
        'type' => 'checkbox',
        'label' => '',
        'key' => '<generate-unique-key>',
        'required' => false,
        'help_text' => '',
        'section_id' => null,
        'options' => [
          [
            'label' => '',
            'value' => '',
          ],
        ],
      ],
      'file' => [
        'id' => '<generate-uuid>',
        'type' => 'file',
        'label' => '',
        'key' => '<generate-unique-key>',
        'required' => false,
        'help_text' => '',
        'accept' => '',
        'max_size' => 2048,
        'section_id' => null,
      ],
      'rating' => [
        'id' => '<generate-uuid>',
        'type' => 'rating',
        'label' => '',
        'key' => '<generate-unique-key>',
        'help_text' => '',
        'max' => 5,
        'required' => false,
        'section_id' => null,
      ],
      // 'heading' => [
      //   'id' => '<generate-uuid>',
      //   'type' => 'heading',
      //   'text' => '',
      //   'level' => 2,
      // ],
      'section' => [
        'id' => '<generate-uuid>',
        'type' => 'section',
        'label' => '',
        'description' => '',
      ],
    ];
  }

  public static function sampleSchema(): array
  {
    return [
      'version' => 1,
      'title' => 'Sample Form',
      'description' => 'Sample description',
      'fields' => array_values(self::defaults()),
    ];
  }
}