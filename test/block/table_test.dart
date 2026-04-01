import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../utils/test_helpers.dart';

void main() {
  group('Tables', () {
    testWidgets('simple table', (tester) async {
      await pumpMarkdown(tester, '''
| A | B |
|---|---|
| 1 | 2 |
''');
      final output = getSerializedOutput(tester);
      expect(output, contains('TABLE'));
    });

    testWidgets('table with header', (tester) async {
      await pumpMarkdown(tester, '''
| Name | Value |
|------|-------|
| foo  | bar   |
''');
      final output = getSerializedOutput(tester);
      expect(output, contains('TABLE'));
      expect(output, contains('HEADER'));
    });

    testWidgets('table with multiple rows', (tester) async {
      await pumpMarkdown(tester, '''
| Col1 | Col2 |
|------|------|
| A    | B    |
| C    | D    |
| E    | F    |
''');
      final output = getSerializedOutput(tester);
      expect(output, contains('TABLE'));
      expect(output, contains('ROW'));
    });

    testWidgets('table with styled content', (tester) async {
      await pumpMarkdown(tester, '''
| Header |
|--------|
| **bold** |
''');
      final output = getSerializedOutput(tester);
      expect(output, contains('TABLE'));
    });

    testWidgets('table with left alignment', (tester) async {
      await pumpMarkdown(tester, '''
| Left |
|:-----|
| text |
''');
      final output = getSerializedOutput(tester);
      expect(output, contains('TABLE'));
    });

    testWidgets('table with right alignment', (tester) async {
      await pumpMarkdown(tester, '''
| Right |
|------:|
| text  |
''');
      final output = getSerializedOutput(tester);
      expect(output, contains('TABLE'));
    });

    testWidgets('table with center alignment', (tester) async {
      await pumpMarkdown(tester, '''
| Center |
|:------:|
| text   |
''');
      final output = getSerializedOutput(tester);
      expect(output, contains('TABLE'));
    });

    testWidgets('table with bold content in cell', (tester) async {
      await pumpMarkdown(tester, '''
| Header |
|--------|
| **bold** |
''');
      expect(find.byType(Table), findsOneWidget);
    });

    testWidgets('table with italic content in cell', (tester) async {
      await pumpMarkdown(tester, '''
| Header |
|--------|
| *italic* |
''');
      expect(find.byType(Table), findsOneWidget);
    });

    testWidgets('table with link content in cell', (tester) async {
      await pumpMarkdown(tester, '''
| Header |
|--------|
| [link](https://example.com) |
''');
      expect(find.byType(Table), findsOneWidget);
    });

    testWidgets('table with inline code in cell', (tester) async {
      await pumpMarkdown(tester, '''
| Header |
|--------|
| `code` |
''');
      expect(find.byType(Table), findsOneWidget);
    });

    testWidgets('table with mixed markdown in cell', (tester) async {
      await pumpMarkdown(tester, '''
| Header |
|--------|
| **bold** and *italic* |
''');
      expect(find.byType(Table), findsOneWidget);
    });
  });
}
