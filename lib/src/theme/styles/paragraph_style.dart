import 'package:flutter/material.dart';

/// Paragraph style for Markdown text
///
/// Corresponds to CSS:
/// ```css
/// #nice p {
///   margin-top: 5px;
///   margin-bottom: 5px;
///   line-height: 26px;
///   word-spacing: 3px;
///   letter-spacing: 3px;
///   text-align: left;
///   color: #3e3e3e;
///   font-size: 16px;
///   text-indent: 2em;
/// }
/// ```
class ParagraphStyle {
  const ParagraphStyle({
    this.marginTop = 0,
    this.marginBottom = 0,
    this.lineHeight = 1.5,
    this.wordSpacing = 0,
    this.letterSpacing = 0,
    this.textIndent = 0,
    this.textAlign = TextAlign.left,
    this.textStyle,
  });

  /// Top margin (CSS: margin-top)
  final double marginTop;

  /// Bottom margin (CSS: margin-bottom)
  final double marginBottom;

  /// Line height as relative value, e.g., 26/16 = 1.625 (CSS: line-height)
  final double lineHeight;

  /// Word spacing (CSS: word-spacing)
  final double wordSpacing;

  /// Letter spacing (CSS: letter-spacing)
  final double letterSpacing;

  /// First line indent in pixels (CSS: text-indent, convert em to px)
  final double textIndent;

  /// Text alignment (CSS: text-align)
  final TextAlign textAlign;

  /// Text style for color, fontSize, etc.
  final TextStyle? textStyle;

  /// Get effective TextStyle with lineHeight applied
  TextStyle get effectiveTextStyle {
    return textStyle?.copyWith(
          height: lineHeight,
          wordSpacing: wordSpacing,
          letterSpacing: letterSpacing,
        ) ??
        TextStyle(
          height: lineHeight,
          wordSpacing: wordSpacing,
          letterSpacing: letterSpacing,
        );
  }

  /// Lerp between two paragraph styles
  static ParagraphStyle lerp(ParagraphStyle a, ParagraphStyle b, double t) {
    return ParagraphStyle(
      marginTop: _lerpDouble(a.marginTop, b.marginTop, t),
      marginBottom: _lerpDouble(a.marginBottom, b.marginBottom, t),
      lineHeight: _lerpDouble(a.lineHeight, b.lineHeight, t),
      wordSpacing: _lerpDouble(a.wordSpacing, b.wordSpacing, t),
      letterSpacing: _lerpDouble(a.letterSpacing, b.letterSpacing, t),
      textIndent: _lerpDouble(a.textIndent, b.textIndent, t),
      textAlign: t < 0.5 ? a.textAlign : b.textAlign,
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
    );
  }

  /// Create a copy with overridden values
  ParagraphStyle copyWith({
    double? marginTop,
    double? marginBottom,
    double? lineHeight,
    double? wordSpacing,
    double? letterSpacing,
    double? textIndent,
    TextAlign? textAlign,
    TextStyle? textStyle,
  }) {
    return ParagraphStyle(
      marginTop: marginTop ?? this.marginTop,
      marginBottom: marginBottom ?? this.marginBottom,
      lineHeight: lineHeight ?? this.lineHeight,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      textIndent: textIndent ?? this.textIndent,
      textAlign: textAlign ?? this.textAlign,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
