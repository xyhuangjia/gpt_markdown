import 'package:flutter/material.dart';
import 'styles/root_style.dart';
import 'styles/text_style.dart';
import 'styles/heading_style.dart';
import 'styles/inline_code_style.dart';
import 'styles/paragraph_style.dart';
import 'styles/block_style.dart';
import 'styles/list_style.dart';
import 'styles/link_style.dart';
import 'styles/element_style.dart';
import 'presets/preset_themes.dart';

/// Main theme data for GptMarkdown widget
///
/// Provides layered theme architecture with dedicated theme classes
/// for each Markdown element category.
///
/// ## Usage
///
/// ```dart
/// // Using preset theme
/// GptMarkdownThemeData.nice()
///
/// // Custom theme
/// GptMarkdownThemeData(
///   textStyle: MarkdownTextStyleTheme(
///     h1: HeadingStyle(textStyle: TextStyle(fontSize: 28)),
///   ),
///   link: MarkdownLinkTheme(color: Colors.blue),
/// )
/// ```
class GptMarkdownThemeData extends ThemeExtension<GptMarkdownThemeData> {
  const GptMarkdownThemeData({
    required this.root,
    required this.textStyle,
    required this.block,
    required this.list,
    required this.link,
    required this.image,
    required this.latex,
    required this.sourceTag,
    required this.footnote,
  });

  /// Global root style
  final MarkdownRootTheme root;

  /// Text style theme (headings, inline styles)
  final MarkdownTextStyleTheme textStyle;

  /// Block element theme (code, table, blockquote, hr)
  final MarkdownBlockTheme block;

  /// List element theme (ordered, unordered, checkbox, radio)
  final MarkdownListTheme list;

  /// Link theme
  final MarkdownLinkTheme link;

  /// Image theme
  final MarkdownImageTheme image;

  /// LaTeX theme
  final MarkdownLatexTheme latex;

  /// Source tag theme (reference [1] tags)
  final MarkdownSourceTagTheme sourceTag;

  /// Footnote theme
  final MarkdownFootnoteTheme footnote;

  // ========== Preset Theme Factories ==========

  /// Nice theme preset (WeChat article style)
  factory GptMarkdownThemeData.nice({
    Brightness brightness = Brightness.light,
    String? fontFamily,
    Color? primaryColor,
    Color? textColor,
    Color? backgroundColor,
  }) {
    return _NiceThemeFactory.create(
      brightness: brightness,
      fontFamily: fontFamily,
      primaryColor: primaryColor,
      textColor: textColor,
      backgroundColor: backgroundColor,
    );
  }

  /// Material theme preset (based on Flutter ThemeData)
  factory GptMarkdownThemeData.material({
    Brightness brightness = Brightness.light,
  }) {
    return _MaterialThemeFactory.create(brightness: brightness);
  }

  /// GitHub theme preset
  factory GptMarkdownThemeData.github({
    Brightness brightness = Brightness.light,
  }) {
    return GitHubThemeFactory.create(brightness: brightness);
  }

  /// Medium theme preset
  factory GptMarkdownThemeData.medium({
    Brightness brightness = Brightness.light,
  }) {
    return MediumThemeFactory.create(brightness: brightness);
  }

  /// Default theme
  factory GptMarkdownThemeData.defaults({
    Brightness brightness = Brightness.light,
  }) {
    return GptMarkdownThemeData.material(brightness: brightness);
  }

  // ========== Legacy Getters (Backward Compatibility) ==========

  /// h1 style (maps to textStyle.h1.textStyle)
  TextStyle? get h1 => textStyle.h1?.textStyle;

  /// h2 style
  TextStyle? get h2 => textStyle.h2?.textStyle;

  /// h3 style
  TextStyle? get h3 => textStyle.h3?.textStyle;

  /// h4 style
  TextStyle? get h4 => textStyle.h4?.textStyle;

  /// h5 style
  TextStyle? get h5 => textStyle.h5?.textStyle;

  /// h6 style
  TextStyle? get h6 => textStyle.h6?.textStyle;

  /// Link color (maps to link.color)
  Color get linkColor => link.color ?? Colors.blue;

  /// Link hover color
  Color get linkHoverColor => link.hoverColor ?? Colors.red;

  /// HR line color (maps to block.horizontalRule.color)
  Color get hrLineColor => block.horizontalRule?.color ?? Colors.grey;

  /// HR line thickness
  double get hrLineThickness => block.horizontalRule?.thickness ?? 1;

  /// Highlight color
  Color get highlightColor =>
      textStyle.inlineCode?.background ?? const Color(0xFFFFF9F9);

  // ========== ThemeExtension Implementation ==========

  @override
  GptMarkdownThemeData copyWith({
    MarkdownRootTheme? root,
    MarkdownTextStyleTheme? textStyle,
    MarkdownBlockTheme? block,
    MarkdownListTheme? list,
    MarkdownLinkTheme? link,
    MarkdownImageTheme? image,
    MarkdownLatexTheme? latex,
    MarkdownSourceTagTheme? sourceTag,
    MarkdownFootnoteTheme? footnote,
  }) {
    return GptMarkdownThemeData(
      root: root ?? this.root,
      textStyle: textStyle ?? this.textStyle,
      block: block ?? this.block,
      list: list ?? this.list,
      link: link ?? this.link,
      image: image ?? this.image,
      latex: latex ?? this.latex,
      sourceTag: sourceTag ?? this.sourceTag,
      footnote: footnote ?? this.footnote,
    );
  }

  @override
  GptMarkdownThemeData lerp(GptMarkdownThemeData? other, double t) {
    if (other == null) return this;

    return GptMarkdownThemeData(
      root: MarkdownRootTheme.lerp(root, other.root, t),
      textStyle: MarkdownTextStyleTheme.lerp(textStyle, other.textStyle, t),
      block: MarkdownBlockTheme.lerp(block, other.block, t),
      list: MarkdownListTheme.lerp(list, other.list, t),
      link: MarkdownLinkTheme.lerp(link, other.link, t),
      image: MarkdownImageTheme.lerp(image, other.image, t),
      latex: MarkdownLatexTheme.lerp(latex, other.latex, t),
      sourceTag:
          MarkdownSourceTagTheme.lerp(sourceTag, other.sourceTag, t) ??
          const MarkdownSourceTagTheme(),
      footnote:
          MarkdownFootnoteTheme.lerp(footnote, other.footnote, t) ??
          const MarkdownFootnoteTheme(),
    );
  }
}

// ========== Theme Providers ==========

/// InheritedWidget for providing GptMarkdownThemeData to descendants
class GptMarkdownTheme extends InheritedWidget {
  const GptMarkdownTheme({super.key, required this.data, required super.child});

  /// Theme data
  final GptMarkdownThemeData data;

  /// Get theme from context
  ///
  /// Priority:
  /// 1. GptMarkdownTheme widget in ancestors
  /// 2. Theme.extension<GptMarkdownThemeData>()
  /// 3. Default theme based on Theme.of(context).brightness
  static GptMarkdownThemeData of(BuildContext context) {
    // Check for GptMarkdownTheme widget
    final provider =
        context.dependOnInheritedWidgetOfExactType<GptMarkdownTheme>();
    if (provider != null) {
      return provider.data;
    }

    // Check for Theme.extension
    final themeData = Theme.of(context).extension<GptMarkdownThemeData>();
    if (themeData != null) {
      return themeData;
    }

    // Return default theme
    return GptMarkdownThemeData.defaults(
      brightness: Theme.of(context).brightness,
    );
  }

  @override
  bool updateShouldNotify(GptMarkdownTheme oldWidget) {
    return data != oldWidget.data;
  }
}

// ========== Preset Theme Factories ==========

/// Nice theme factory (WeChat article style)
class _NiceThemeFactory {
  static const Color primaryColor = Color(0xFFEF7060);
  static const Color textColor = Color(0xFF3E3E3E);
  static const Color blockQuoteBg = Color(0xFFFFF9F9);
  static const Color suffixBg = Color(0xFFEFEBE9);
  static const Color footnoteWordColor = Color(0xFFFF3502);

  static GptMarkdownThemeData create({
    Brightness brightness = Brightness.light,
    String? fontFamily,
    Color? primaryColor,
    Color? textColor,
    Color? backgroundColor,
  }) {
    final niceRed = primaryColor ?? _NiceThemeFactory.primaryColor;
    final niceText = textColor ?? _NiceThemeFactory.textColor;

    return GptMarkdownThemeData(
      root: MarkdownRootTheme(
        padding: const EdgeInsets.all(30),
        fontFamily: fontFamily ?? 'ptima-Regular',
        wordBreak: WordBreak.breakAll,
        backgroundColor: backgroundColor,
        textColor: niceText,
        fontSize: 16,
        lineHeight: 26 / 16,
      ),
      textStyle: MarkdownTextStyleTheme(
        paragraph: ParagraphStyle(
          marginTop: 5,
          marginBottom: 5,
          lineHeight: 26 / 16,
          wordSpacing: 3,
          letterSpacing: 3,
          textIndent: 32,
          textAlign: TextAlign.left,
          textStyle: TextStyle(color: niceText, fontSize: 16),
        ),
        h1: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: niceText,
          ),
          borderBottom: BorderSide(color: niceText, width: 1),
          marginTop: 24,
          marginBottom: 15,
        ),
        h2: HeadingStyle(
          textStyle: TextStyle(fontSize: 20.8),
          borderBottom: BorderSide(color: niceRed, width: 2),
          contentDecoration: ContentDecoration(
            background: niceRed,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
            ),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 3,
              bottom: 1,
            ),
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            marginRight: 3,
          ),
          marginTop: 20,
          marginBottom: 15,
        ),
        h2Suffix: HeadingSuffixStyle(
          show: true,
          content: " ",
          verticalAlign: VerticalAlign.bottom,
          borderBottom: BorderSide(color: suffixBg, width: 36),
          borderRight: BorderSide(color: Colors.transparent, width: 20),
        ),
        h3: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: niceText,
          ),
          marginTop: 18,
          marginBottom: 15,
        ),
        h4: HeadingStyle(
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          marginBottom: 15,
        ),
        h5: HeadingStyle(
          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          marginBottom: 15,
        ),
        h6: HeadingStyle(
          textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          marginBottom: 15,
        ),
        bold: const TextStyle(fontWeight: FontWeight.bold),
        italic: const TextStyle(fontStyle: FontStyle.italic),
        boldItalic: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        strike: TextStyle(
          decoration: TextDecoration.lineThrough,
          decorationColor: niceText,
        ),
        inlineCode: InlineCodeStyle(color: niceRed),
      ),
      block: MarkdownBlockTheme(
        blockQuote: BlockQuoteTheme(
          barColor: niceRed,
          barWidth: 3,
          backgroundColor: blockQuoteBg,
          paddingTop: 2,
          paddingBottom: 2,
          paddingLeft: 8,
        ),
        horizontalRule: HrTheme(
          color: niceText,
          thickness: 1,
          marginTop: 16,
          marginBottom: 16,
        ),
        codeBlock: CodeBlockTheme(
          backgroundColor:
              brightness == Brightness.light
                  ? Colors.grey.shade100
                  : Colors.grey.shade900,
          textStyle: const TextStyle(fontFamily: 'JetBrainsMono', fontSize: 14),
          borderRadius: BorderRadius.circular(8),
          headerPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        table: TableTheme(
          cellBorder: const BorderSide(color: Color(0xFFCCCCCC), width: 1),
          headerBackgroundColor:
              brightness == Brightness.light
                  ? Colors.grey.shade200
                  : Colors.grey.shade800,
          cellPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
      ),
      list: MarkdownListTheme(
        unordered: UnorderedListTheme(
          bulletType: BulletType.disc,
          bulletColor: niceText,
        ),
        ordered: OrderedListTheme(
          numberType: NumberType.decimal,
          numberColor: niceText,
        ),
      ),
      link: MarkdownLinkTheme(
        color: niceRed,
        underline: LinkUnderlineStyle(color: niceRed, thickness: 1),
      ),
      image: MarkdownImageTheme(
        widthPercentage: 0.8,
        alignment: Alignment.center,
      ),
      latex: MarkdownLatexTheme(color: niceText, maxWidth: 3.0),
      sourceTag: MarkdownSourceTagTheme(
        backgroundColor:
            brightness == Brightness.light
                ? Colors.grey.shade100
                : Colors.grey.shade800,
        textStyle: const TextStyle(fontSize: 12),
        shape: const OvalBorder(),
        size: 20,
      ),
      footnote: MarkdownFootnoteTheme(
        wordColor: footnoteWordColor,
        refColor: niceRed,
        separatorContent: "参考资料",
      ),
    );
  }
}

/// Material theme factory (based on Flutter ThemeData)
class _MaterialThemeFactory {
  static GptMarkdownThemeData create({
    Brightness brightness = Brightness.light,
  }) {
    final isDark = brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;

    return GptMarkdownThemeData(
      root: MarkdownRootTheme(
        textColor: textColor,
        fontSize: 14,
        lineHeight: 1.5,
      ),
      textStyle: MarkdownTextStyleTheme(
        h1: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        h2: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        h3: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        h4: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        h5: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        h6: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        bold: const TextStyle(fontWeight: FontWeight.bold),
        italic: const TextStyle(fontStyle: FontStyle.italic),
        inlineCode: InlineCodeStyle(
          color: isDark ? Colors.lightBlue : Colors.blue,
          background: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
        ),
      ),
      block: MarkdownBlockTheme(
        blockQuote: BlockQuoteTheme(
          barColor: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
          barWidth: 4,
          backgroundColor: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
          paddingLeft: 16,
        ),
        horizontalRule: HrTheme(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          thickness: 1,
        ),
        codeBlock: CodeBlockTheme(
          backgroundColor: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
          textStyle: const TextStyle(fontFamily: 'JetBrainsMono', fontSize: 14),
          borderRadius: BorderRadius.circular(8),
        ),
        table: TableTheme(
          cellBorder: BorderSide(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
            width: 1,
          ),
          headerBackgroundColor:
              isDark ? Colors.grey.shade800 : Colors.grey.shade200,
          cellPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      list: MarkdownListTheme(
        unordered: UnorderedListTheme(bulletColor: textColor),
        ordered: OrderedListTheme(numberColor: textColor),
      ),
      link: MarkdownLinkTheme(
        color: Colors.blue,
        underline: const LinkUnderlineStyle(color: Colors.blue, thickness: 1),
      ),
      image: const MarkdownImageTheme(),
      latex: MarkdownLatexTheme(color: textColor),
      sourceTag: MarkdownSourceTagTheme(
        backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        textStyle: const TextStyle(fontSize: 12),
        shape: const OvalBorder(),
        size: 20,
      ),
      footnote: const MarkdownFootnoteTheme(),
    );
  }
}
