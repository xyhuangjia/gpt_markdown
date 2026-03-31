/// Backward Compatibility Tests
///
/// Ensures v1.1.5 API continues to work after theme system migration.
/// Run these tests BEFORE and AFTER migration to verify compatibility.
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:gpt_markdown/src/theme/theme.dart';

import '../utils/test_helpers.dart';

void main() {
  group('Backward Compatibility Tests', () {
    // ========================================
    // Phase 1: Widget API Compatibility
    // ========================================

    group('GptMarkdown Widget API', () {
      testWidgets('basic rendering works', (tester) async {
        await pumpMarkdown(tester, '# Hello World');
        expect(find.byType(RichText), findsWidgets);
      });

      testWidgets('style parameter works', (tester) async {
        await pumpMarkdown(
          tester,
          '**bold** text',
          style: const TextStyle(color: Colors.red),
        );
        expect(find.byType(RichText), findsWidgets);
      });

      testWidgets('textDirection parameter works', (tester) async {
        await pumpMarkdown(tester, 'Hello', textDirection: TextDirection.rtl);
        expect(find.byType(RichText), findsWidgets);
      });
    });

    // ========================================
    // Phase 2: Theme API Compatibility
    // ========================================

    group('GptMarkdownThemeData API', () {
      testWidgets('GptMarkdownTheme.of() returns theme', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const GptMarkdown('# Test');
              },
            ),
          ),
        );

        expect(theme, isNotNull);
        expect(theme, isA<GptMarkdownThemeData>());
      });

      testWidgets('h1-h6 getters return TextStyle', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const SizedBox();
              },
            ),
          ),
        );

        // These must exist for backward compatibility
        expect(theme.h1, isA<TextStyle?>());
        expect(theme.h2, isA<TextStyle?>());
        expect(theme.h3, isA<TextStyle?>());
        expect(theme.h4, isA<TextStyle?>());
        expect(theme.h5, isA<TextStyle?>());
        expect(theme.h6, isA<TextStyle?>());
      });

      testWidgets('linkColor getter returns Color', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(theme.linkColor, isA<Color>());
      });

      testWidgets('linkHoverColor getter returns Color', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(theme.linkHoverColor, isA<Color>());
      });

      testWidgets('hrLineColor getter returns Color', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(theme.hrLineColor, isA<Color>());
      });

      testWidgets('hrLineThickness getter returns double', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(theme.hrLineThickness, isA<double>());
      });

      testWidgets('highlightColor getter returns Color', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const SizedBox();
              },
            ),
          ),
        );

        expect(theme.highlightColor, isA<Color>());
      });
    });

    // ========================================
    // Phase 3: GptMarkdownTheme Provider
    // ========================================

    group('GptMarkdownTheme Provider', () {
      testWidgets('provides theme to descendants', (tester) async {
        final customTheme = GptMarkdownThemeData.nice(
          brightness: Brightness.light,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: GptMarkdownTheme(
              data: customTheme,
              child: Builder(
                builder: (context) {
                  final theme = GptMarkdownTheme.of(context);
                  return Text(
                    'Theme retrieved',
                    style: TextStyle(color: theme.link.color),
                  );
                },
              ),
            ),
          ),
        );

        expect(find.text('Theme retrieved'), findsOneWidget);
      });

      testWidgets('fallback to default when no provider', (tester) async {
        late GptMarkdownThemeData theme;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                theme = GptMarkdownTheme.of(context);
                return const Text('OK');
              },
            ),
          ),
        );

        // Should not throw, should return default theme
        expect(theme, isNotNull);
      });
    });

    // ========================================
    // Phase 4: Builder Callbacks
    // ========================================

    group('Builder Callbacks', () {
      testWidgets('codeBuilder callback works', (tester) async {
        const markdown = '```dart\ncode\n```';

        await tester.pumpWidget(
          MaterialApp(
            home: GptMarkdown(
              markdown,
              codeBuilder: (context, name, code, closed) {
                return Text('CUSTOM:$name');
              },
            ),
          ),
        );

        expect(find.text('CUSTOM:dart'), findsOneWidget);
      });

      testWidgets('linkBuilder callback works', (tester) async {
        const markdown = '[Click Me](https://example.com)';

        await tester.pumpWidget(
          MaterialApp(
            home: GptMarkdown(
              markdown,
              linkBuilder: (context, text, url, style) {
                return const Text('CUSTOM_LINK');
              },
            ),
          ),
        );

        expect(find.text('CUSTOM_LINK'), findsOneWidget);
      });

      testWidgets('highlightBuilder callback works', (tester) async {
        const markdown = '`code`';

        await tester.pumpWidget(
          MaterialApp(
            home: GptMarkdown(
              markdown,
              highlightBuilder: (context, text, style) {
                return Text('HIGHLIGHT:$text');
              },
            ),
          ),
        );

        expect(find.text('HIGHLIGHT:code'), findsOneWidget);
      });
    });

    // ========================================
    // Phase 5: Rendering Compatibility
    // ========================================

    group('Rendering Compatibility', () {
      testWidgets('headings render correctly', (tester) async {
        await pumpMarkdown(tester, '# H1\n## H2\n### H3');
        expect(find.byType(RichText), findsWidgets);
      });

      testWidgets('lists render correctly', (tester) async {
        await pumpMarkdown(tester, '- Item 1\n- Item 2\n\n1. First\n2. Second');
        expect(find.byType(RichText), findsWidgets);
      });

      testWidgets('blockquote renders correctly', (tester) async {
        await pumpMarkdown(tester, '> Quote text');
        expect(find.byType(RichText), findsWidgets);
      });

      testWidgets('table renders correctly', (tester) async {
        await pumpMarkdown(tester, '| A | B |\n|---|---|\n| 1 | 2 |');
        expect(find.byType(Table), findsWidgets);
      });

      testWidgets('code block renders correctly', (tester) async {
        await pumpMarkdown(tester, '```dart\nprint(1);\n```');
        expect(find.byType(RichText), findsWidgets);
      });

      testWidgets('link renders correctly', (tester) async {
        await pumpMarkdown(tester, '[Link](https://example.com)');
        expect(find.byType(RichText), findsWidgets);
      });
    });
  });
}
