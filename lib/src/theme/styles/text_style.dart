import 'package:flutter/material.dart';
import 'heading_style.dart';
import 'inline_code_style.dart';
import 'paragraph_style.dart';

/// Text style theme for all text-related Markdown elements
///
/// Covers paragraphs, headings (h1-h6), bold, italic, strike, underline, and inline code
class MarkdownTextStyleTheme {
  const MarkdownTextStyleTheme({
    this.paragraph,
    this.h1,
    this.h1Suffix,
    this.h2,
    this.h2Suffix,
    this.h3,
    this.h3Suffix,
    this.h4,
    this.h5,
    this.h6,
    this.bold,
    this.italic,
    this.boldItalic,
    this.strike,
    this.underline,
    this.inlineCode,
    this.newLine,
  });

  // ========== Paragraph ==========
  /// Paragraph style (#nice p)
  final ParagraphStyle? paragraph;

  // ========== Headings ==========
  /// Level 1 heading (#nice h1)
  final HeadingStyle? h1;

  /// h1 suffix decoration (#nice h1:after)
  final HeadingSuffixStyle? h1Suffix;

  /// Level 2 heading (#nice h2)
  final HeadingStyle? h2;

  /// h2 suffix decoration (#nice h2:after)
  final HeadingSuffixStyle? h2Suffix;

  /// Level 3 heading (#nice h3)
  final HeadingStyle? h3;

  /// h3 suffix decoration (#nice h3:after)
  final HeadingSuffixStyle? h3Suffix;

  /// Level 4 heading
  final HeadingStyle? h4;

  /// Level 5 heading
  final HeadingStyle? h5;

  /// Level 6 heading
  final HeadingStyle? h6;

  // ========== Inline text styles ==========
  /// Bold text (#nice strong)
  final TextStyle? bold;

  /// Italic text (#nice em)
  final TextStyle? italic;

  /// Bold + italic (#nice em strong)
  final TextStyle? boldItalic;

  /// Strikethrough (#nice del)
  final TextStyle? strike;

  /// Underline text
  final TextStyle? underline;

  /// Inline code (#nice p code, #nice li code)
  final InlineCodeStyle? inlineCode;

  /// New line / paragraph break style
  final NewLineStyle? newLine;

  /// Lerp between two text style themes
  static MarkdownTextStyleTheme lerp(
    MarkdownTextStyleTheme a,
    MarkdownTextStyleTheme b,
    double t,
  ) {
    return MarkdownTextStyleTheme(
      paragraph: ParagraphStyle.lerp(
        a.paragraph ?? const ParagraphStyle(),
        b.paragraph ?? const ParagraphStyle(),
        t,
      ),
      h1: HeadingStyle.lerp(a.h1, b.h1, t),
      h1Suffix: HeadingSuffixStyle.lerp(a.h1Suffix, b.h1Suffix, t),
      h2: HeadingStyle.lerp(a.h2, b.h2, t),
      h2Suffix: HeadingSuffixStyle.lerp(a.h2Suffix, b.h2Suffix, t),
      h3: HeadingStyle.lerp(a.h3, b.h3, t),
      h3Suffix: HeadingSuffixStyle.lerp(a.h3Suffix, b.h3Suffix, t),
      h4: HeadingStyle.lerp(a.h4, b.h4, t),
      h5: HeadingStyle.lerp(a.h5, b.h5, t),
      h6: HeadingStyle.lerp(a.h6, b.h6, t),
      bold: TextStyle.lerp(a.bold, b.bold, t),
      italic: TextStyle.lerp(a.italic, b.italic, t),
      boldItalic: TextStyle.lerp(a.boldItalic, b.boldItalic, t),
      strike: TextStyle.lerp(a.strike, b.strike, t),
      underline: TextStyle.lerp(a.underline, b.underline, t),
      inlineCode: InlineCodeStyle.lerp(a.inlineCode, b.inlineCode, t),
      newLine: NewLineStyle.lerp(a.newLine, b.newLine, t),
    );
  }

  MarkdownTextStyleTheme copyWith({
    ParagraphStyle? paragraph,
    HeadingStyle? h1,
    HeadingSuffixStyle? h1Suffix,
    HeadingStyle? h2,
    HeadingSuffixStyle? h2Suffix,
    HeadingStyle? h3,
    HeadingSuffixStyle? h3Suffix,
    HeadingStyle? h4,
    HeadingStyle? h5,
    HeadingStyle? h6,
    TextStyle? bold,
    TextStyle? italic,
    TextStyle? boldItalic,
    TextStyle? strike,
    TextStyle? underline,
    InlineCodeStyle? inlineCode,
    NewLineStyle? newLine,
  }) {
    return MarkdownTextStyleTheme(
      paragraph: paragraph ?? this.paragraph,
      h1: h1 ?? this.h1,
      h1Suffix: h1Suffix ?? this.h1Suffix,
      h2: h2 ?? this.h2,
      h2Suffix: h2Suffix ?? this.h2Suffix,
      h3: h3 ?? this.h3,
      h3Suffix: h3Suffix ?? this.h3Suffix,
      h4: h4 ?? this.h4,
      h5: h5 ?? this.h5,
      h6: h6 ?? this.h6,
      bold: bold ?? this.bold,
      italic: italic ?? this.italic,
      boldItalic: boldItalic ?? this.boldItalic,
      strike: strike ?? this.strike,
      underline: underline ?? this.underline,
      inlineCode: inlineCode ?? this.inlineCode,
      newLine: newLine ?? this.newLine,
    );
  }
}
