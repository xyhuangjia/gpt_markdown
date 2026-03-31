import 'package:flutter/material.dart';

/// Image theme for ![images](url)
///
/// Corresponds to CSS:
/// ```css
/// #nice img {
///   width: 80%;
///   margin: 0 auto;
/// }
/// ```
class MarkdownImageTheme {
  const MarkdownImageTheme({
    this.width,
    this.widthPercentage,
    this.alignment,
    this.loadingWidget,
    this.errorWidget,
    this.loadingBackgroundColor,
    this.loadingProgressColor,
    this.borderRadius,
    this.fit,
    this.captionStyle,
  });

  /// Fixed width
  final double? width;

  /// Width as percentage of parent (CSS: width: 80%)
  final double? widthPercentage;

  /// Image alignment (CSS: margin: 0 auto → center)
  final Alignment? alignment;

  /// Loading placeholder widget
  final Widget? loadingWidget;

  /// Error placeholder widget
  final Widget? errorWidget;

  /// Loading background color
  final Color? loadingBackgroundColor;

  /// Loading progress color
  final Color? loadingProgressColor;

  /// Border radius
  final BorderRadius? borderRadius;

  /// Image fit
  final BoxFit? fit;

  /// Caption text style
  final TextStyle? captionStyle;

  static MarkdownImageTheme lerp(
    MarkdownImageTheme a,
    MarkdownImageTheme b,
    double t,
  ) {
    return MarkdownImageTheme(
      width: _lerpDouble(a.width ?? 0, b.width ?? 0, t),
      widthPercentage: _lerpDouble(
        a.widthPercentage ?? 1,
        b.widthPercentage ?? 1,
        t,
      ),
      alignment: Alignment.lerp(a.alignment, b.alignment, t),
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
    );
  }

  MarkdownImageTheme copyWith({
    double? width,
    double? widthPercentage,
    Alignment? alignment,
    Widget? loadingWidget,
    Widget? errorWidget,
    Color? loadingBackgroundColor,
    Color? loadingProgressColor,
    BorderRadius? borderRadius,
    BoxFit? fit,
    TextStyle? captionStyle,
  }) {
    return MarkdownImageTheme(
      width: width ?? this.width,
      widthPercentage: widthPercentage ?? this.widthPercentage,
      alignment: alignment ?? this.alignment,
      loadingWidget: loadingWidget ?? this.loadingWidget,
      errorWidget: errorWidget ?? this.errorWidget,
      loadingBackgroundColor:
          loadingBackgroundColor ?? this.loadingBackgroundColor,
      loadingProgressColor: loadingProgressColor ?? this.loadingProgressColor,
      borderRadius: borderRadius ?? this.borderRadius,
      fit: fit ?? this.fit,
      captionStyle: captionStyle ?? this.captionStyle,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// LaTeX theme for math formulas
///
/// Corresponds to CSS:
/// ```css
/// #nice .block-equation svg { max-width: 300%; }
/// #nice .inline-equation svg { }
/// ```
class MarkdownLatexTheme {
  const MarkdownLatexTheme({
    this.inlineStyle,
    this.blockStyle,
    this.maxWidth,
    this.color,
    this.textScaleFactor,
  });

  /// Inline LaTeX style
  final TextStyle? inlineStyle;

  /// Block LaTeX style
  final TextStyle? blockStyle;

  /// Block max width multiplier (CSS: max-width: 300%)
  final double? maxWidth;

  /// Default color
  final Color? color;

  /// Text scale factor
  final double? textScaleFactor;

  static MarkdownLatexTheme lerp(
    MarkdownLatexTheme a,
    MarkdownLatexTheme b,
    double t,
  ) {
    return MarkdownLatexTheme(
      inlineStyle: TextStyle.lerp(a.inlineStyle, b.inlineStyle, t),
      blockStyle: TextStyle.lerp(a.blockStyle, b.blockStyle, t),
      maxWidth: _lerpDouble(a.maxWidth ?? 1, b.maxWidth ?? 1, t),
      color: Color.lerp(a.color, b.color, t),
      textScaleFactor: _lerpDouble(
        a.textScaleFactor ?? 1,
        b.textScaleFactor ?? 1,
        t,
      ),
    );
  }

  MarkdownLatexTheme copyWith({
    TextStyle? inlineStyle,
    TextStyle? blockStyle,
    double? maxWidth,
    Color? color,
    double? textScaleFactor,
  }) {
    return MarkdownLatexTheme(
      inlineStyle: inlineStyle ?? this.inlineStyle,
      blockStyle: blockStyle ?? this.blockStyle,
      maxWidth: maxWidth ?? this.maxWidth,
      color: color ?? this.color,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Source tag theme for reference tags like [1]
///
/// Corresponds to CSS:
/// ```css
/// #nice .footnote-ref { color: rgb(239, 112, 96); }
/// ```
class MarkdownSourceTagTheme {
  const MarkdownSourceTagTheme({
    this.backgroundColor,
    this.textStyle,
    this.shape,
    this.size,
    this.padding,
  });

  /// Background color
  final Color? backgroundColor;

  /// Text style
  final TextStyle? textStyle;

  /// Shape (e.g., OvalBorder, RoundedRectangleBorder)
  final ShapeBorder? shape;

  /// Size
  final double? size;

  /// Padding
  final EdgeInsets? padding;

  static MarkdownSourceTagTheme? lerp(
    MarkdownSourceTagTheme? a,
    MarkdownSourceTagTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return MarkdownSourceTagTheme(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      size: _lerpDouble(a.size ?? 20, b.size ?? 20, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
    );
  }

  MarkdownSourceTagTheme copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
    ShapeBorder? shape,
    double? size,
    EdgeInsets? padding,
  }) {
    return MarkdownSourceTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      shape: shape ?? this.shape,
      size: size ?? this.size,
      padding: padding ?? this.padding,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Footnote theme for footnote elements
///
/// Corresponds to CSS:
/// ```css
/// #nice .footnote-word { color: #ff3502; }
/// #nice .footnote-ref { color: rgb(239, 112, 96); }
/// #nice .footnotes-sep:before { content: "参考资料"; }
/// ```
class MarkdownFootnoteTheme {
  const MarkdownFootnoteTheme({
    this.wordColor,
    this.refColor,
    this.separatorContent,
    this.separatorStyle,
    this.numStyle,
    this.itemTextStyle,
    this.itemEmStyle,
  });

  /// Footnote word color (CSS: .footnote-word color)
  final Color? wordColor;

  /// Footnote ref color (CSS: .footnote-ref color)
  final Color? refColor;

  /// Separator content (CSS: .footnotes-sep:before content)
  final String? separatorContent;

  /// Separator text style
  final TextStyle? separatorStyle;

  /// Footnote number style
  final TextStyle? numStyle;

  /// Footnote item text style
  final TextStyle? itemTextStyle;

  /// Footnote item em style
  final TextStyle? itemEmStyle;

  static MarkdownFootnoteTheme? lerp(
    MarkdownFootnoteTheme? a,
    MarkdownFootnoteTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return MarkdownFootnoteTheme(
      wordColor: Color.lerp(a.wordColor, b.wordColor, t),
      refColor: Color.lerp(a.refColor, b.refColor, t),
      separatorContent: t < 0.5 ? a.separatorContent : b.separatorContent,
      separatorStyle: TextStyle.lerp(a.separatorStyle, b.separatorStyle, t),
      numStyle: TextStyle.lerp(a.numStyle, b.numStyle, t),
      itemTextStyle: TextStyle.lerp(a.itemTextStyle, b.itemTextStyle, t),
      itemEmStyle: TextStyle.lerp(a.itemEmStyle, b.itemEmStyle, t),
    );
  }

  MarkdownFootnoteTheme copyWith({
    Color? wordColor,
    Color? refColor,
    String? separatorContent,
    TextStyle? separatorStyle,
    TextStyle? numStyle,
    TextStyle? itemTextStyle,
    TextStyle? itemEmStyle,
  }) {
    return MarkdownFootnoteTheme(
      wordColor: wordColor ?? this.wordColor,
      refColor: refColor ?? this.refColor,
      separatorContent: separatorContent ?? this.separatorContent,
      separatorStyle: separatorStyle ?? this.separatorStyle,
      numStyle: numStyle ?? this.numStyle,
      itemTextStyle: itemTextStyle ?? this.itemTextStyle,
      itemEmStyle: itemEmStyle ?? this.itemEmStyle,
    );
  }
}
