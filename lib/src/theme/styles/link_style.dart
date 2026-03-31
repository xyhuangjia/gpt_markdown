import 'package:flutter/material.dart';

/// Underline border style for CSS border-bottom mapping
enum UnderlineBorderStyle { solid, dotted, dashed, double, wavy }

/// Link underline style for CSS border-bottom mapping
///
/// Corresponds to CSS:
/// ```css
/// #nice a {
///   border-bottom: 1px solid rgb(239, 112, 96);
/// }
/// ```
class LinkUnderlineStyle {
  const LinkUnderlineStyle({
    this.show = true,
    this.color,
    this.thickness = 1,
    this.style = UnderlineBorderStyle.solid,
  });

  /// Whether to show underline
  final bool show;

  /// Underline color (CSS: border-bottom color)
  final Color? color;

  /// Underline thickness (CSS: border-bottom width)
  final double thickness;

  /// Underline style
  final UnderlineBorderStyle style;

  /// No underline
  static const LinkUnderlineStyle none = LinkUnderlineStyle(show: false);

  /// Solid underline
  static const LinkUnderlineStyle solid = LinkUnderlineStyle(
    style: UnderlineBorderStyle.solid,
  );

  /// Get TextDecoration
  TextDecoration get decoration =>
      show ? TextDecoration.underline : TextDecoration.none;

  /// Get TextDecorationStyle
  TextDecorationStyle get decorationStyle {
    switch (style) {
      case UnderlineBorderStyle.solid:
        return TextDecorationStyle.solid;
      case UnderlineBorderStyle.dotted:
        return TextDecorationStyle.dotted;
      case UnderlineBorderStyle.dashed:
        return TextDecorationStyle.dashed;
      case UnderlineBorderStyle.double:
        return TextDecorationStyle.double;
      case UnderlineBorderStyle.wavy:
        return TextDecorationStyle.wavy;
    }
  }

  static LinkUnderlineStyle? lerp(
    LinkUnderlineStyle? a,
    LinkUnderlineStyle? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return LinkUnderlineStyle(
      show: t < 0.5 ? a.show : b.show,
      color: Color.lerp(a.color, b.color, t),
      thickness: _lerpDouble(a.thickness, b.thickness, t),
      style: t < 0.5 ? a.style : b.style,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Link theme for [links](url)
///
/// Corresponds to CSS:
/// ```css
/// #nice a {
///   color: rgb(239, 112, 96);
///   border-bottom: 1px solid rgb(239, 112, 96);
/// }
/// ```
class MarkdownLinkTheme {
  const MarkdownLinkTheme({
    this.color,
    this.hoverColor,
    this.visitedColor,
    this.disabledColor,
    this.underline,
    this.textStyle,
    this.cursor = SystemMouseCursors.click,
  });

  /// Link color (CSS: color)
  final Color? color;

  /// Hover color
  final Color? hoverColor;

  /// Visited link color
  final Color? visitedColor;

  /// Disabled link color
  final Color? disabledColor;

  /// Underline style (CSS: border-bottom)
  final LinkUnderlineStyle? underline;

  /// Text style
  final TextStyle? textStyle;

  /// Mouse cursor
  final MouseCursor cursor;

  static MarkdownLinkTheme lerp(
    MarkdownLinkTheme a,
    MarkdownLinkTheme b,
    double t,
  ) {
    return MarkdownLinkTheme(
      color: Color.lerp(a.color, b.color, t),
      hoverColor: Color.lerp(a.hoverColor, b.hoverColor, t),
      visitedColor: Color.lerp(a.visitedColor, b.visitedColor, t),
      disabledColor: Color.lerp(a.disabledColor, b.disabledColor, t),
      underline: LinkUnderlineStyle.lerp(a.underline, b.underline, t),
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      cursor: t < 0.5 ? a.cursor : b.cursor,
    );
  }

  MarkdownLinkTheme copyWith({
    Color? color,
    Color? hoverColor,
    Color? visitedColor,
    Color? disabledColor,
    LinkUnderlineStyle? underline,
    TextStyle? textStyle,
    MouseCursor? cursor,
  }) {
    return MarkdownLinkTheme(
      color: color ?? this.color,
      hoverColor: hoverColor ?? this.hoverColor,
      visitedColor: visitedColor ?? this.visitedColor,
      disabledColor: disabledColor ?? this.disabledColor,
      underline: underline ?? this.underline,
      textStyle: textStyle ?? this.textStyle,
      cursor: cursor ?? this.cursor,
    );
  }
}
