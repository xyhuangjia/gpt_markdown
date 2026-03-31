import 'package:flutter/material.dart';

/// Content decoration for heading elements
///
/// Corresponds to CSS .content selector styling:
/// ```css
/// #nice h2 .content {
///   display: inline-block;
///   font-weight: bold;
///   background: rgb(239, 112, 96);
///   color: #ffffff;
///   padding: 3px 10px 1px;
///   border-top-right-radius: 3px;
///   border-top-left-radius: 3px;
///   margin-right: 3px;
/// }
/// ```
class ContentDecoration {
  const ContentDecoration({
    this.background,
    this.borderRadius,
    this.padding,
    this.textColor,
    this.fontWeight,
    this.marginRight = 0,
    this.shadow,
    this.border,
  });

  /// Background color (CSS: background)
  final Color? background;

  /// Border radius (CSS: border-radius)
  final BorderRadius? borderRadius;

  /// Padding (CSS: padding)
  final EdgeInsets? padding;

  /// Text color (CSS: color)
  final Color? textColor;

  /// Font weight (CSS: font-weight)
  final FontWeight? fontWeight;

  /// Right margin (CSS: margin-right)
  final double marginRight;

  /// Shadow
  final BoxShadow? shadow;

  /// Border
  final BoxBorder? border;

  /// Lerp between two content decorations
  static ContentDecoration? lerp(
    ContentDecoration? a,
    ContentDecoration? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return ContentDecoration(
      background: Color.lerp(a.background, b.background, t),
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      textColor: Color.lerp(a.textColor, b.textColor, t),
      fontWeight: FontWeight.lerp(a.fontWeight, b.fontWeight, t),
      marginRight: _lerpDouble(a.marginRight, b.marginRight, t),
    );
  }

  ContentDecoration copyWith({
    Color? background,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    Color? textColor,
    FontWeight? fontWeight,
    double? marginRight,
    BoxShadow? shadow,
    BoxBorder? border,
  }) {
    return ContentDecoration(
      background: background ?? this.background,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      textColor: textColor ?? this.textColor,
      fontWeight: fontWeight ?? this.fontWeight,
      marginRight: marginRight ?? this.marginRight,
      shadow: shadow ?? this.shadow,
      border: border ?? this.border,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Heading style for h1-h6 elements
///
/// Supports CSS-like styling including border-bottom and .content decoration
class HeadingStyle {
  const HeadingStyle({
    this.textStyle,
    this.borderBottom,
    this.contentDecoration,
    this.marginTop = 16.0,
    this.marginBottom = 8.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
  });

  /// Text style for heading text
  final TextStyle? textStyle;

  /// Bottom border (CSS: border-bottom)
  final BorderSide? borderBottom;

  /// Content decoration for .content styling
  final ContentDecoration? contentDecoration;

  /// Top margin
  final double marginTop;

  /// Bottom margin
  final double marginBottom;

  /// Top padding
  final double paddingTop;

  /// Bottom padding
  final double paddingBottom;

  /// Lerp between two heading styles
  static HeadingStyle? lerp(HeadingStyle? a, HeadingStyle? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return HeadingStyle(
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t) ?? a.textStyle,
      borderBottom:
          a.borderBottom != null && b.borderBottom != null
              ? BorderSide.lerp(a.borderBottom!, b.borderBottom!, t)
              : (a.borderBottom ?? b.borderBottom),
      contentDecoration: ContentDecoration.lerp(
        a.contentDecoration,
        b.contentDecoration,
        t,
      ),
      marginTop: _lerpDouble(a.marginTop, b.marginTop, t),
      marginBottom: _lerpDouble(a.marginBottom, b.marginBottom, t),
      paddingTop: _lerpDouble(a.paddingTop, b.paddingTop, t),
      paddingBottom: _lerpDouble(a.paddingBottom, b.paddingBottom, t),
    );
  }

  HeadingStyle copyWith({
    TextStyle? textStyle,
    BorderSide? borderBottom,
    ContentDecoration? contentDecoration,
    double? marginTop,
    double? marginBottom,
    double? paddingTop,
    double? paddingBottom,
  }) {
    return HeadingStyle(
      textStyle: textStyle ?? this.textStyle,
      borderBottom: borderBottom ?? this.borderBottom,
      contentDecoration: contentDecoration ?? this.contentDecoration,
      marginTop: marginTop ?? this.marginTop,
      marginBottom: marginBottom ?? this.marginBottom,
      paddingTop: paddingTop ?? this.paddingTop,
      paddingBottom: paddingBottom ?? this.paddingBottom,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Display mode enum for CSS display property
enum Display { block, inline, inlineBlock, flex, none }

/// Vertical alignment enum
enum VerticalAlign { top, middle, bottom, baseline }

/// Heading suffix style for CSS :after pseudo-element
///
/// Corresponds to CSS:
/// ```css
/// #nice h2:after {
///   display: inline-block;
///   content: " ";
///   vertical-align: bottom;
///   border-bottom: 36px solid #efebe9;
///   border-right: 20px solid transparent;
/// }
/// ```
class HeadingSuffixStyle {
  const HeadingSuffixStyle({
    this.show = false,
    this.content = " ",
    this.display = Display.inlineBlock,
    this.verticalAlign = VerticalAlign.bottom,
    this.borderBottom,
    this.borderRight,
    this.width,
    this.height,
    this.customWidgetBuilder,
  });

  /// Whether to show the suffix decoration
  final bool show;

  /// Content text (CSS: content)
  final String content;

  /// Display mode (CSS: display)
  final Display display;

  /// Vertical alignment (CSS: vertical-align)
  final VerticalAlign verticalAlign;

  /// Bottom border for triangle effect (CSS: border-bottom)
  final BorderSide? borderBottom;

  /// Right border for triangle effect (CSS: border-right)
  final BorderSide? borderRight;

  /// Explicit width
  final double? width;

  /// Explicit height
  final double? height;

  /// Custom widget builder to replace CSS border hack
  final Widget Function(BuildContext)? customWidgetBuilder;

  /// Build the suffix widget
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    if (customWidgetBuilder != null) {
      return customWidgetBuilder!(context);
    }

    // Default: use Container to simulate CSS border triangle
    return CustomPaint(
      painter: _TrianglePainter(
        bottomColor: borderBottom?.color ?? Colors.transparent,
        bottomWidth: borderBottom?.width ?? 0,
        rightColor: borderRight?.color ?? Colors.transparent,
        rightWidth: borderRight?.width ?? 0,
      ),
      size: Size(
        (borderRight?.width ?? 0) + (width ?? 0),
        (borderBottom?.width ?? 0) + (height ?? 0),
      ),
    );
  }

  /// Lerp between two suffix styles
  static HeadingSuffixStyle? lerp(
    HeadingSuffixStyle? a,
    HeadingSuffixStyle? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return HeadingSuffixStyle(
      show: t < 0.5 ? a.show : b.show,
      content: t < 0.5 ? a.content : b.content,
      display: t < 0.5 ? a.display : b.display,
      verticalAlign: t < 0.5 ? a.verticalAlign : b.verticalAlign,
      borderBottom:
          a.borderBottom != null && b.borderBottom != null
              ? BorderSide.lerp(a.borderBottom!, b.borderBottom!, t)
              : (a.borderBottom ?? b.borderBottom ?? const BorderSide()),
      borderRight:
          a.borderRight != null && b.borderRight != null
              ? BorderSide.lerp(a.borderRight!, b.borderRight!, t)
              : (a.borderRight ??
                  b.borderRight ??
                  const BorderSide(color: Colors.transparent)),
      width: _lerpDouble(a.width ?? 0, b.width ?? 0, t),
      height: _lerpDouble(a.height ?? 0, b.height ?? 0, t),
    );
  }

  HeadingSuffixStyle copyWith({
    bool? show,
    String? content,
    Display? display,
    VerticalAlign? verticalAlign,
    BorderSide? borderBottom,
    BorderSide? borderRight,
    double? width,
    double? height,
    Widget Function(BuildContext)? customWidgetBuilder,
  }) {
    return HeadingSuffixStyle(
      show: show ?? this.show,
      content: content ?? this.content,
      display: display ?? this.display,
      verticalAlign: verticalAlign ?? this.verticalAlign,
      borderBottom: borderBottom ?? this.borderBottom,
      borderRight: borderRight ?? this.borderRight,
      width: width ?? this.width,
      height: height ?? this.height,
      customWidgetBuilder: customWidgetBuilder ?? this.customWidgetBuilder,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Triangle painter for CSS border triangle hack
class _TrianglePainter extends CustomPainter {
  _TrianglePainter({
    required this.bottomColor,
    required this.bottomWidth,
    required this.rightColor,
    required this.rightWidth,
  });

  final Color bottomColor;
  final double bottomWidth;
  final Color rightColor;
  final double rightWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    if (bottomWidth > 0 && bottomColor != Colors.transparent) {
      paint.color = bottomColor;
      // Draw a trapezoid/triangle shape
      final path =
          Path()
            ..moveTo(0, bottomWidth)
            ..lineTo(size.width - rightWidth, bottomWidth)
            ..lineTo(size.width - rightWidth, 0)
            ..lineTo(0, 0)
            ..close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) {
    return bottomColor != oldDelegate.bottomColor ||
        bottomWidth != oldDelegate.bottomWidth ||
        rightColor != oldDelegate.rightColor ||
        rightWidth != oldDelegate.rightWidth;
  }
}
