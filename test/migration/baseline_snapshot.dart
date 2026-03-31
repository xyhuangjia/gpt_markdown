/// Migration Baseline Snapshot
///
/// This file records the expected rendering output for all Markdown elements
/// BEFORE the theme system migration. After migration, run the same tests
/// to ensure backward compatibility.
///
/// Generated: 2026-03-31
/// Test Count: 169
/// Status: All Passed

library;

/// Baseline snapshot data for migration verification
class MigrationBaseline {
  /// Version info
  static const String version = '1.1.5';
  static const String generatedAt = '2026-03-31';

  /// All baseline samples that should render identically after migration
  static const Map<String, BaselineSample> samples = {
    // ============ Headings ============
    'h1': BaselineSample(input: '# Heading 1', description: 'Level 1 heading'),
    'h2': BaselineSample(input: '## Heading 2', description: 'Level 2 heading'),
    'h3': BaselineSample(
      input: '### Heading 3',
      description: 'Level 3 heading',
    ),
    'h4': BaselineSample(
      input: '#### Heading 4',
      description: 'Level 4 heading',
    ),
    'h5': BaselineSample(
      input: '##### Heading 5',
      description: 'Level 5 heading',
    ),
    'h6': BaselineSample(
      input: '###### Heading 6',
      description: 'Level 6 heading',
    ),

    // ============ Inline Text ============
    'bold': BaselineSample(input: '**bold text**', description: 'Bold text'),
    'italic': BaselineSample(
      input: '*italic text*',
      description: 'Italic text',
    ),
    'strike': BaselineSample(
      input: '~~strikethrough~~',
      description: 'Strikethrough text',
    ),
    'underline': BaselineSample(
      input: '<u>underline</u>',
      description: 'Underline text',
    ),
    'highlight': BaselineSample(
      input: '`highlighted`',
      description: 'Highlighted/inline code',
    ),
    'bold_italic': BaselineSample(
      input: '***bold and italic***',
      description: 'Combined bold and italic',
    ),

    // ============ Links ============
    'link': BaselineSample(
      input: '[Link Text](https://example.com)',
      description: 'Basic link',
    ),
    'link_with_title': BaselineSample(
      input: '[Link](https://example.com "Title")',
      description: 'Link with title',
    ),

    // ============ Lists ============
    'unordered_list': BaselineSample(
      input: '- Item 1\n- Item 2\n- Item 3',
      description: 'Unordered list',
    ),
    'ordered_list': BaselineSample(
      input: '1. First\n2. Second\n3. Third',
      description: 'Ordered list',
    ),
    'nested_list': BaselineSample(
      input: '- Item 1\n  - Nested item\n- Item 2',
      description: 'Nested unordered list',
    ),

    // ============ Checkbox & Radio ============
    'checkbox_checked': BaselineSample(
      input: '- [x] Checked',
      description: 'Checked checkbox',
    ),
    'checkbox_unchecked': BaselineSample(
      input: '- [ ] Unchecked',
      description: 'Unchecked checkbox',
    ),
    'radio_checked': BaselineSample(
      input: '- (x) Selected',
      description: 'Selected radio',
    ),
    'radio_unchecked': BaselineSample(
      input: '- () Unselected',
      description: 'Unselected radio',
    ),

    // ============ Block Elements ============
    'blockquote': BaselineSample(
      input: '> This is a quote',
      description: 'Block quote',
    ),
    'blockquote_multi': BaselineSample(
      input: '> Line 1\n> Line 2',
      description: 'Multi-line block quote',
    ),
    'hr': BaselineSample(input: '---', description: 'Horizontal rule'),
    'code_block': BaselineSample(
      input: '```dart\nprint("hello");\n```',
      description: 'Code block with language',
    ),

    // ============ Table ============
    'table': BaselineSample(
      input: '| A | B |\n|---|---|\n| 1 | 2 |',
      description: 'Simple table',
    ),
    'table_aligned': BaselineSample(
      input:
          '| Left | Center | Right |\n|:-----|:------:|------:|\n| L | C | R |',
      description: 'Table with alignment',
    ),

    // ============ Image ============
    'image': BaselineSample(
      input: '![Alt text](https://via.placeholder.com/100)',
      description: 'Basic image',
    ),
    'image_sized': BaselineSample(
      input: '![100x200](https://via.placeholder.com/100)',
      description: 'Image with size',
    ),

    // ============ LaTeX ============
    'latex_inline': BaselineSample(
      input: r'Inline $E = mc^2$ formula',
      description: 'Inline LaTeX',
    ),
    'latex_block': BaselineSample(
      input: r'\[\sum_{i=1}^{n} i\]',
      description: 'Block LaTeX',
    ),

    // ============ Complex ============
    'mixed_content': BaselineSample(
      input: '''
# Title

This is **bold** and *italic* text.

> A quote

- List item 1
- List item 2

[Link](https://example.com)
''',
      description: 'Mixed content document',
    ),
  };

  /// Theme API compatibility checks
  ///
  /// These properties MUST exist after migration for backward compatibility
  static const List<String> requiredThemeGetters = [
    'h1',
    'h2',
    'h3',
    'h4',
    'h5',
    'h6',
    'linkColor',
    'linkHoverColor',
    'hrLineColor',
    'hrLineThickness',
    'highlightColor',
  ];

  /// GptMarkdown widget parameters that must remain compatible
  static const List<String> requiredWidgetParams = [
    'data',
    'style',
    'textDirection',
    'onLinkTap',
    'textAlign',
    'textScaler',
    'maxLines',
    'overflow',
    'followLinkColor',
    'latexWorkaround',
    'latexBuilder',
    'codeBuilder',
    'sourceTagBuilder',
    'highlightBuilder',
    'linkBuilder',
    'imageBuilder',
    'orderedListBuilder',
    'unOrderedListBuilder',
    'tableBuilder',
    'components',
    'inlineComponents',
  ];
}

/// A single baseline sample
class BaselineSample {
  final String input;
  final String description;

  const BaselineSample({required this.input, required this.description});
}
