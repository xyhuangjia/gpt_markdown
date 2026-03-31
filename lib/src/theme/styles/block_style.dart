import 'package:flutter/material.dart';

/// Code block theme for ```code``` elements
///
/// Corresponds to CSS:
/// ```css
/// #nice pre code { }
/// ```
class CodeBlockTheme {
  const CodeBlockTheme({
    this.backgroundColor,
    this.textStyle,
    this.labelTextStyle,
    this.borderRadius,
    this.border,
    this.copyButtonColor,
    this.copyButtonSuccessColor,
    this.headerPadding,
    this.contentPadding,
  });

  /// Background color
  final Color? backgroundColor;

  /// Code text style
  final TextStyle? textStyle;

  /// Language label text style
  final TextStyle? labelTextStyle;

  /// Border radius
  final BorderRadius? borderRadius;

  /// Border
  final BoxBorder? border;

  /// Copy button color
  final Color? copyButtonColor;

  /// Copy button success color
  final Color? copyButtonSuccessColor;

  /// Header padding (language label + copy button area)
  final EdgeInsets? headerPadding;

  /// Content padding
  final EdgeInsets? contentPadding;

  static CodeBlockTheme? lerp(CodeBlockTheme? a, CodeBlockTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return CodeBlockTheme(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      labelTextStyle: TextStyle.lerp(a.labelTextStyle, b.labelTextStyle, t),
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      copyButtonColor: Color.lerp(a.copyButtonColor, b.copyButtonColor, t),
      copyButtonSuccessColor: Color.lerp(
        a.copyButtonSuccessColor,
        b.copyButtonSuccessColor,
        t,
      ),
      headerPadding: EdgeInsets.lerp(a.headerPadding, b.headerPadding, t),
      contentPadding: EdgeInsets.lerp(a.contentPadding, b.contentPadding, t),
    );
  }

  CodeBlockTheme copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
    TextStyle? labelTextStyle,
    BorderRadius? borderRadius,
    BoxBorder? border,
    Color? copyButtonColor,
    Color? copyButtonSuccessColor,
    EdgeInsets? headerPadding,
    EdgeInsets? contentPadding,
  }) {
    return CodeBlockTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      border: border ?? this.border,
      copyButtonColor: copyButtonColor ?? this.copyButtonColor,
      copyButtonSuccessColor:
          copyButtonSuccessColor ?? this.copyButtonSuccessColor,
      headerPadding: headerPadding ?? this.headerPadding,
      contentPadding: contentPadding ?? this.contentPadding,
    );
  }
}

/// Table theme for | tables |
class TableTheme {
  const TableTheme({
    this.cellBorder,
    this.headerBackgroundColor,
    this.headerTextStyle,
    this.bodyTextStyle,
    this.cellPadding,
  });

  /// Cell border
  final BorderSide? cellBorder;

  /// Header row background color
  final Color? headerBackgroundColor;

  /// Header text style
  final TextStyle? headerTextStyle;

  /// Body text style
  final TextStyle? bodyTextStyle;

  /// Cell padding
  final EdgeInsets? cellPadding;

  static TableTheme? lerp(TableTheme? a, TableTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return TableTheme(
      cellBorder:
          a.cellBorder != null && b.cellBorder != null
              ? BorderSide.lerp(a.cellBorder!, b.cellBorder!, t)
              : (a.cellBorder ?? b.cellBorder),
      headerBackgroundColor: Color.lerp(
        a.headerBackgroundColor,
        b.headerBackgroundColor,
        t,
      ),
      headerTextStyle: TextStyle.lerp(a.headerTextStyle, b.headerTextStyle, t),
      bodyTextStyle:
          TextStyle.lerp(a.bodyTextStyle, b.bodyTextStyle, t) ??
          a.bodyTextStyle,
      cellPadding: EdgeInsets.lerp(a.cellPadding, b.cellPadding, t),
    );
  }

  TableTheme copyWith({
    BorderSide? cellBorder,
    Color? headerBackgroundColor,
    TextStyle? headerTextStyle,
    TextStyle? bodyTextStyle,
    EdgeInsets? cellPadding,
  }) {
    return TableTheme(
      cellBorder: cellBorder ?? this.cellBorder,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      bodyTextStyle: bodyTextStyle ?? this.bodyTextStyle,
      cellPadding: cellPadding ?? this.cellPadding,
    );
  }
}

/// Block quote theme for > quotes
///
/// Corresponds to CSS:
/// ```css
/// #nice blockquote {
///   border-left-color: rgb(239, 112, 96);
///   background: #fff9f9;
/// }
/// ```
class BlockQuoteTheme {
  const BlockQuoteTheme({
    this.barColor,
    this.barWidth = 3,
    this.backgroundColor,
    this.paddingTop = 2,
    this.paddingBottom = 2,
    this.paddingLeft = 8,
    this.textStyle,
  });

  /// Left bar color (CSS: border-left-color)
  final Color? barColor;

  /// Left bar width
  final double barWidth;

  /// Background color (CSS: background)
  final Color? backgroundColor;

  /// Top padding
  final double paddingTop;

  /// Bottom padding
  final double paddingBottom;

  /// Left padding (content distance from bar)
  final double paddingLeft;

  /// Quote text style
  final TextStyle? textStyle;

  static BlockQuoteTheme? lerp(
    BlockQuoteTheme? a,
    BlockQuoteTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return BlockQuoteTheme(
      barColor: Color.lerp(a.barColor, b.barColor, t),
      barWidth: _lerpDouble(a.barWidth, b.barWidth, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      paddingTop: _lerpDouble(a.paddingTop, b.paddingTop, t),
      paddingBottom: _lerpDouble(a.paddingBottom, b.paddingBottom, t),
      paddingLeft: _lerpDouble(a.paddingLeft, b.paddingLeft, t),
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
    );
  }

  BlockQuoteTheme copyWith({
    Color? barColor,
    double? barWidth,
    Color? backgroundColor,
    double? paddingTop,
    double? paddingBottom,
    double? paddingLeft,
    TextStyle? textStyle,
  }) {
    return BlockQuoteTheme(
      barColor: barColor ?? this.barColor,
      barWidth: barWidth ?? this.barWidth,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      paddingTop: paddingTop ?? this.paddingTop,
      paddingBottom: paddingBottom ?? this.paddingBottom,
      paddingLeft: paddingLeft ?? this.paddingLeft,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Horizontal rule theme for --- separators
///
/// Corresponds to CSS:
/// ```css
/// #nice hr {
///   border-top: 1px solid #3e3e3e;
/// }
/// ```
class HrTheme {
  const HrTheme({
    this.color,
    this.thickness = 1,
    this.style = BorderStyle.solid,
    this.marginTop = 16,
    this.marginBottom = 16,
  });

  /// Line color (CSS: border-top color)
  final Color? color;

  /// Line thickness (CSS: border-top width)
  final double thickness;

  /// Line style
  final BorderStyle style;

  /// Top margin
  final double marginTop;

  /// Bottom margin
  final double marginBottom;

  /// Get BorderSide representation
  BorderSide get borderSide =>
      BorderSide(color: color ?? Colors.grey, width: thickness, style: style);

  static HrTheme? lerp(HrTheme? a, HrTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return HrTheme(
      color: Color.lerp(a.color, b.color, t),
      thickness: _lerpDouble(a.thickness, b.thickness, t),
      style: t < 0.5 ? a.style : b.style,
      marginTop: _lerpDouble(a.marginTop, b.marginTop, t),
      marginBottom: _lerpDouble(a.marginBottom, b.marginBottom, t),
    );
  }

  HrTheme copyWith({
    Color? color,
    double? thickness,
    BorderStyle? style,
    double? marginTop,
    double? marginBottom,
  }) {
    return HrTheme(
      color: color ?? this.color,
      thickness: thickness ?? this.thickness,
      style: style ?? this.style,
      marginTop: marginTop ?? this.marginTop,
      marginBottom: marginBottom ?? this.marginBottom,
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Indent theme for nested content
class IndentTheme {
  const IndentTheme({this.spacingPerLevel = 10});

  /// Spacing per indentation level
  final double spacingPerLevel;

  static IndentTheme? lerp(IndentTheme? a, IndentTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return IndentTheme(
      spacingPerLevel: _lerpDouble(a.spacingPerLevel, b.spacingPerLevel, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Block-level elements theme container
class MarkdownBlockTheme {
  const MarkdownBlockTheme({
    this.codeBlock,
    this.table,
    this.blockQuote,
    this.horizontalRule,
    this.indent,
  });

  /// Code block theme
  final CodeBlockTheme? codeBlock;

  /// Table theme
  final TableTheme? table;

  /// Block quote theme
  final BlockQuoteTheme? blockQuote;

  /// Horizontal rule theme
  final HrTheme? horizontalRule;

  /// Indent theme
  final IndentTheme? indent;

  static MarkdownBlockTheme lerp(
    MarkdownBlockTheme a,
    MarkdownBlockTheme b,
    double t,
  ) {
    return MarkdownBlockTheme(
      codeBlock: CodeBlockTheme.lerp(a.codeBlock, b.codeBlock, t),
      table: TableTheme.lerp(a.table, b.table, t),
      blockQuote: BlockQuoteTheme.lerp(a.blockQuote, b.blockQuote, t),
      horizontalRule: HrTheme.lerp(a.horizontalRule, b.horizontalRule, t),
      indent: IndentTheme.lerp(a.indent, b.indent, t),
    );
  }

  MarkdownBlockTheme copyWith({
    CodeBlockTheme? codeBlock,
    TableTheme? table,
    BlockQuoteTheme? blockQuote,
    HrTheme? horizontalRule,
    IndentTheme? indent,
  }) {
    return MarkdownBlockTheme(
      codeBlock: codeBlock ?? this.codeBlock,
      table: table ?? this.table,
      blockQuote: blockQuote ?? this.blockQuote,
      horizontalRule: horizontalRule ?? this.horizontalRule,
      indent: indent ?? this.indent,
    );
  }
}
