import 'package:flutter/material.dart';

/// Inline code style for `code` elements
///
/// Corresponds to CSS:
/// ```css
/// #nice p code, #nice li code {
///   color: rgb(239, 112, 96);
/// }
/// ```
class InlineCodeStyle {
  const InlineCodeStyle({
    this.color,
    this.background,
    this.fontSize,
    this.fontFamily,
    this.padding,
    this.borderRadius,
  });

  /// Text color (CSS: color)
  final Color? color;

  /// Background color
  final Color? background;

  /// Font size
  final double? fontSize;

  /// Font family (usually monospace)
  final String? fontFamily;

  /// Padding around the code text
  final EdgeInsets? padding;

  /// Border radius
  final BorderRadius? borderRadius;

  /// Lerp between two inline code styles
  static InlineCodeStyle? lerp(
    InlineCodeStyle? a,
    InlineCodeStyle? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return InlineCodeStyle(
      color: Color.lerp(a.color, b.color, t),
      background: Color.lerp(a.background, b.background, t),
      fontSize: _lerpDouble(a.fontSize ?? 14, b.fontSize ?? 14, t),
      fontFamily: t < 0.5 ? a.fontFamily : b.fontFamily,
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
    );
  }

  InlineCodeStyle copyWith({
    Color? color,
    Color? background,
    double? fontSize,
    String? fontFamily,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
  }) {
    return InlineCodeStyle(
      color: color ?? this.color,
      background: background ?? this.background,
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// New line style for paragraph breaks
class NewLineStyle {
  const NewLineStyle({this.height = 1.15, this.fontSize = 14, this.color});

  /// Line height for newlines
  final double height;

  /// Font size for spacing
  final double fontSize;

  /// Text color
  final Color? color;

  static NewLineStyle? lerp(NewLineStyle? a, NewLineStyle? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return NewLineStyle(
      height: _lerpDouble(a.height, b.height, t),
      fontSize: _lerpDouble(a.fontSize, b.fontSize, t),
      color: Color.lerp(a.color, b.color, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
