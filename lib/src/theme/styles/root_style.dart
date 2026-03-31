import 'package:flutter/material.dart';

/// Word break mode for text rendering
enum WordBreak {
  /// Normal word break
  normal,

  /// Allow breaking at any character (CSS: break-all)
  breakAll,

  /// Keep words intact (CSS: keep-all)
  keepAll,
}

/// Global root theme for Markdown rendering
///
/// Corresponds to CSS:
/// ```css
/// #nice {
///   padding: 30px;
///   font-family: ptima-Regular;
///   word-break: break-all;
/// }
/// ```
class MarkdownRootTheme {
  const MarkdownRootTheme({
    this.padding = EdgeInsets.zero,
    this.fontFamily,
    this.wordBreak = WordBreak.normal,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 14.0,
    this.lineHeight = 1.5,
    this.textAlign = TextAlign.start,
    this.textDirection = TextDirection.ltr,
  });

  /// Page margin (CSS: padding)
  final EdgeInsets padding;

  /// Global font family (CSS: font-family)
  final String? fontFamily;

  /// Word break mode (CSS: word-break)
  final WordBreak wordBreak;

  /// Background color
  final Color? backgroundColor;

  /// Default text color
  final Color? textColor;

  /// Default font size
  final double fontSize;

  /// Default line height (relative value)
  final double lineHeight;

  /// Default text alignment
  final TextAlign textAlign;

  /// Text direction
  final TextDirection textDirection;

  /// No styling
  static const MarkdownRootTheme none = MarkdownRootTheme();

  /// Lerp between two root themes
  static MarkdownRootTheme lerp(
    MarkdownRootTheme a,
    MarkdownRootTheme b,
    double t,
  ) {
    return MarkdownRootTheme(
      padding: EdgeInsets.lerp(a.padding, b.padding, t) ?? a.padding,
      fontFamily: t < 0.5 ? a.fontFamily : b.fontFamily,
      wordBreak: t < 0.5 ? a.wordBreak : b.wordBreak,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      textColor: Color.lerp(a.textColor, b.textColor, t),
      fontSize: _lerpDouble(a.fontSize, b.fontSize, t),
      lineHeight: _lerpDouble(a.lineHeight, b.lineHeight, t),
      textAlign: t < 0.5 ? a.textAlign : b.textAlign,
      textDirection: t < 0.5 ? a.textDirection : b.textDirection,
    );
  }

  /// Create a copy with overridden values
  MarkdownRootTheme copyWith({
    EdgeInsets? padding,
    String? fontFamily,
    WordBreak? wordBreak,
    Color? backgroundColor,
    Color? textColor,
    double? fontSize,
    double? lineHeight,
    TextAlign? textAlign,
    TextDirection? textDirection,
  }) {
    return MarkdownRootTheme(
      padding: padding ?? this.padding,
      fontFamily: fontFamily ?? this.fontFamily,
      wordBreak: wordBreak ?? this.wordBreak,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
