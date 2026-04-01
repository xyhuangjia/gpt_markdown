import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../styles/root_style.dart';
import '../styles/text_style.dart';
import '../styles/block_style.dart';
import '../styles/list_style.dart';
import '../styles/link_style.dart';
import '../styles/element_style.dart';
import '../styles/heading_style.dart';
import '../styles/inline_code_style.dart';
import '../styles/paragraph_style.dart';

/// GitHub-style markdown theme
class GitHubThemeFactory {
  static GptMarkdownThemeData create({
    Brightness brightness = Brightness.light,
  }) {
    final isDark = brightness == Brightness.dark;
    final textColor =
        isDark ? const Color(0xFFC9D1D9) : const Color(0xFF24292F);
    final linkColor =
        isDark ? const Color(0xFF58A6FF) : const Color(0xFF0969DA);
    final codeBackground =
        isDark ? const Color(0xFF161B22) : const Color(0xFFF6F8FA);
    final borderColor =
        isDark ? const Color(0xFF30363D) : const Color(0xFFD0D7DE);

    return GptMarkdownThemeData(
      root: MarkdownRootTheme(
        textColor: textColor,
        fontSize: 16,
        lineHeight: 1.5,
      ),
      textStyle: MarkdownTextStyleTheme(
        h1: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          borderBottom: BorderSide(color: borderColor, width: 1),
          marginTop: 24,
          marginBottom: 15,
        ),
        h2: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          borderBottom: BorderSide(color: borderColor, width: 1),
          marginTop: 24,
          marginBottom: 15,
        ),
        h3: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          marginTop: 24,
          marginBottom: 15,
        ),
        h4: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          marginTop: 24,
          marginBottom: 15,
        ),
        h5: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          marginTop: 24,
          marginBottom: 15,
        ),
        h6: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 13.6,
            fontWeight: FontWeight.w600,
            color: isDark ? const Color(0xFF8B949E) : const Color(0xFF57606A),
          ),
          marginTop: 24,
          marginBottom: 15,
        ),
        bold: TextStyle(fontWeight: FontWeight.w600, color: textColor),
        italic: const TextStyle(fontStyle: FontStyle.italic),
        inlineCode: InlineCodeStyle(
          color: textColor,
          background: codeBackground,
          fontSize: 13.6,
          fontFamily:
              'ui-monospace,SFMono-Regular,SF Mono,Menlo,Consolas,Liberation Mono,monospace',
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      block: MarkdownBlockTheme(
        blockQuote: BlockQuoteTheme(
          barColor: borderColor,
          barWidth: 5,
          paddingLeft: 16,
          paddingTop: 0,
          paddingBottom: 0,
          textStyle: TextStyle(
            color: isDark ? const Color(0xFF8B949E) : const Color(0xFF57606A),
          ),
        ),
        horizontalRule: HrTheme(
          color: borderColor,
          thickness: 1,
          marginTop: 24,
          marginBottom: 24,
        ),
        codeBlock: CodeBlockTheme(
          backgroundColor: codeBackground,
          textStyle: TextStyle(
            fontFamily:
                'ui-monospace,SFMono-Regular,SF Mono,Menlo,Consolas,Liberation Mono,monospace',
            fontSize: 13.6,
            color: textColor,
          ),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: borderColor),
          headerPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        table: TableTheme(
          cellBorder: BorderSide(color: borderColor, width: 1),
          headerBackgroundColor:
              isDark ? const Color(0xFF21262D) : const Color(0xFFF6F8FA),
          cellPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      list: MarkdownListTheme(
        unordered: UnorderedListTheme(bulletColor: textColor),
        ordered: OrderedListTheme(numberColor: textColor),
      ),
      link: MarkdownLinkTheme(
        color: linkColor,
        underline: const LinkUnderlineStyle(show: false),
      ),
      image: const MarkdownImageTheme(),
      latex: MarkdownLatexTheme(color: textColor),
      sourceTag: MarkdownSourceTagTheme(
        backgroundColor: codeBackground,
        textStyle: TextStyle(fontSize: 12, color: textColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        size: 20,
      ),
      footnote: MarkdownFootnoteTheme(refColor: linkColor),
    );
  }
}

/// Medium-style markdown theme
class MediumThemeFactory {
  static GptMarkdownThemeData create({
    Brightness brightness = Brightness.light,
  }) {
    final isDark = brightness == Brightness.dark;
    final textColor =
        isDark ? const Color(0xFFFFFFFF) : const Color(0xFF292929);
    final secondaryText =
        isDark ? const Color(0xFFA0A0A0) : const Color(0xFF757575);
    final linkColor = const Color(0xFF1A8917);

    return GptMarkdownThemeData(
      root: MarkdownRootTheme(
        textColor: textColor,
        fontSize: 18,
        lineHeight: 1.58,
      ),
      textStyle: MarkdownTextStyleTheme(
        paragraph: ParagraphStyle(
          lineHeight: 1.58,
          textStyle: TextStyle(
            color: textColor,
            fontSize: 18,
            fontFamily:
                'medium-content-serif-font,Georgia,Cambria,Times New Roman,Times,serif',
          ),
        ),
        h1: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w400,
            color: textColor,
            fontFamily:
                'medium-content-sans-serif-font,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica,Arial,sans-serif',
          ),
          marginTop: 32,
          marginBottom: 15,
        ),
        h2: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: textColor,
            fontFamily:
                'medium-content-sans-serif-font,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica,Arial,sans-serif',
          ),
          marginTop: 30,
          marginBottom: 15,
        ),
        h3: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor,
            fontFamily:
                'medium-content-sans-serif-font,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica,Arial,sans-serif',
          ),
          marginTop: 28,
          marginBottom: 15,
        ),
        h4: HeadingStyle(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          marginTop: 24,
          marginBottom: 15,
        ),
        bold: TextStyle(fontWeight: FontWeight.w600, color: textColor),
        italic: const TextStyle(fontStyle: FontStyle.italic),
        inlineCode: InlineCodeStyle(
          color: textColor,
          background:
              isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF3F3F3),
          fontSize: 16,
        ),
      ),
      block: MarkdownBlockTheme(
        blockQuote: BlockQuoteTheme(
          barColor: linkColor,
          barWidth: 5,
          paddingLeft: 24,
          textStyle: TextStyle(
            color: secondaryText,
            fontStyle: FontStyle.italic,
          ),
        ),
        horizontalRule: HrTheme(
          color: isDark ? const Color(0xFF3D3D3D) : const Color(0xFFE5E5E5),
          thickness: 1,
          marginTop: 40,
          marginBottom: 40,
        ),
        codeBlock: CodeBlockTheme(
          backgroundColor:
              isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF7F7F7),
          textStyle: TextStyle(
            fontFamily:
                'medium-content-code-font,Menlo,Monaco,Courier New,Courier,monospace',
            fontSize: 16,
            color: textColor,
          ),
          borderRadius: BorderRadius.circular(4),
          contentPadding: const EdgeInsets.all(24),
        ),
        table: TableTheme(
          cellBorder: BorderSide(
            color: isDark ? const Color(0xFF3D3D3D) : const Color(0xFFE5E5E5),
            width: 1,
          ),
          cellPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      list: MarkdownListTheme(
        unordered: UnorderedListTheme(bulletColor: textColor),
        ordered: OrderedListTheme(numberColor: textColor),
      ),
      link: MarkdownLinkTheme(
        color: linkColor,
        underline: const LinkUnderlineStyle(
          color: Color(0xFF1A8917),
          thickness: 1,
        ),
      ),
      image: const MarkdownImageTheme(),
      latex: MarkdownLatexTheme(color: textColor),
      sourceTag: MarkdownSourceTagTheme(
        backgroundColor:
            isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF3F3F3),
        textStyle: TextStyle(fontSize: 12, color: secondaryText),
        shape: const OvalBorder(),
        size: 20,
      ),
      footnote: MarkdownFootnoteTheme(refColor: linkColor),
    );
  }
}
