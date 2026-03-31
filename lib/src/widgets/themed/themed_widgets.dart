import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../custom_widgets/markdown_config.dart';
import '../../theme/styles/list_style.dart' as md_theme;
import '../../theme/theme.dart';

/// Themed heading widget for h1-h6 with CSS-like decorations
class ThemedHeading extends StatelessWidget {

  const ThemedHeading({
    super.key,
    required this.level,
    this.headingStyle,
    this.suffixStyle,
    this.textStyle,
    required this.contentSpans,
  });

  final int level;
  final HeadingStyle? headingStyle;
  final HeadingSuffixStyle? suffixStyle;
  final TextStyle? textStyle;
  final List<InlineSpan> contentSpans;

  @override
  Widget build(BuildContext context) {
    if (level == 2 && headingStyle?.contentDecoration != null) {
      return _buildDecoratedH2(context);
    }
    if (level == 1) {
      return _buildH1WithDivider(context);
    }
    return Text.rich(TextSpan(children: contentSpans), style: textStyle);
  }

  Widget _buildDecoratedH2(BuildContext context) {
    final decoration = headingStyle!.contentDecoration!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: decoration.background,
                borderRadius: decoration.borderRadius,
              ),
              padding: decoration.padding,
              child: Text.rich(
                TextSpan(children: contentSpans, style: TextStyle(color: decoration.textColor)),
              ),
            ),
            if (decoration.marginRight > 0) SizedBox(width: decoration.marginRight),
            if (suffixStyle != null && suffixStyle!.show) suffixStyle!.build(context),
          ],
        ),
        if (headingStyle!.borderBottom != null)
          Container(
            height: headingStyle!.borderBottom!.width,
            color: headingStyle!.borderBottom!.color,
          ),
      ],
    );
  }

  Widget _buildH1WithDivider(BuildContext context) {
    final theme = GptMarkdownTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(children: contentSpans)),
        const SizedBox(height: 0),
        Divider(
          height: theme.block.horizontalRule?.thickness ?? 1,
          thickness: theme.block.horizontalRule?.thickness ?? 1,
          color: theme.block.horizontalRule?.color ?? Theme.of(context).colorScheme.outline,
        ),
      ],
    );
  }
}

/// Themed link widget
class ThemedLink extends StatefulWidget {
  const ThemedLink({
    super.key,
    required this.url,
    required this.text,
    this.style,
    this.theme,
    required this.onTap,
    required this.child,
  });

  final String url;
  final String text;
  final TextStyle? style;
  final MarkdownLinkTheme? theme;
  final VoidCallback onTap;
  final Widget child;

  @override
  State<ThemedLink> createState() => _ThemedLinkState();
}

class _ThemedLinkState extends State<ThemedLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme ?? const MarkdownLinkTheme();
    final effectiveColor = _hovering
        ? (theme.hoverColor ?? theme.color ?? Colors.blue)
        : (theme.color ?? Colors.blue);
    return MouseRegion(
      cursor: widget.theme?.cursor ?? SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(onTap: widget.onTap, child: widget.child),
    );
  }
}

/// Themed code block widget
class ThemedCodeField extends StatelessWidget {
  const ThemedCodeField({
    super.key,
    required this.name,
    required this.codes,
    this.theme,
  });

  final String name;
  final String codes;
  final CodeBlockTheme? theme;

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? CodeBlockTheme(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      textStyle: const TextStyle(fontFamily: 'JetBrainsMono', fontSize: 14),
      borderRadius: BorderRadius.circular(8),
    );
    return Material(
      color: effectiveTheme.backgroundColor,
      borderRadius: effectiveTheme.borderRadius ?? BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: effectiveTheme.headerPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(name, style: effectiveTheme.labelTextStyle),
                const Spacer(),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: effectiveTheme.copyButtonColor ?? Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: () => Clipboard.setData(ClipboardData(text: codes)),
                  icon: const Icon(Icons.content_paste, size: 15),
                  label: const Text("Copy code"),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: effectiveTheme.contentPadding ?? const EdgeInsets.all(16),
            child: Text(codes, style: effectiveTheme.textStyle),
          ),
        ],
      ),
    );
  }
}

/// Themed block quote widget
class ThemedBlockQuote extends StatelessWidget {
  const ThemedBlockQuote({
    super.key,
    this.theme,
    required this.direction,
    required this.child,
  });

  final BlockQuoteTheme? theme;
  final TextDirection direction;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? BlockQuoteTheme(
      barColor: Theme.of(context).colorScheme.onSurfaceVariant,
      barWidth: 3,
    );
    return DecoratedBox(
      decoration: BoxDecoration(color: effectiveTheme.backgroundColor),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: effectiveTheme.barWidth, color: effectiveTheme.barColor),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

/// Themed checkbox widget
class ThemedCheckbox extends StatelessWidget {
  const ThemedCheckbox({
    super.key,
    required this.value,
    this.theme,
    required this.textDirection,
    required this.child,
  });

  final bool value;
  final md_theme.CheckboxTheme? theme;
  final TextDirection textDirection;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? const md_theme.CheckboxTheme();
    return Directionality(
      textDirection: textDirection,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: null,
            activeColor: effectiveTheme.activeColor,
            checkColor: effectiveTheme.checkColor,
            side: BorderSide(color: effectiveTheme.inactiveColor ?? Colors.grey, width: 1),
          ),
          SizedBox(width: effectiveTheme.spacing ?? 5),
          Flexible(child: child),
        ],
      ),
    );
  }
}

/// Themed radio widget
class ThemedRadio extends StatelessWidget {
  const ThemedRadio({
    super.key,
    required this.value,
    this.theme,
    required this.textDirection,
    required this.child,
  });

  final bool value;
  final md_theme.RadioTheme? theme;
  final TextDirection textDirection;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? const md_theme.RadioTheme();
    return Directionality(
      textDirection: textDirection,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<bool>(
            value: true,
            groupValue: value,
            onChanged: null,
            activeColor: effectiveTheme.activeColor,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return effectiveTheme.activeColor;
              }
              return effectiveTheme.inactiveColor ?? Colors.grey;
            }),
          ),
          SizedBox(width: effectiveTheme.spacing ?? 5),
          Flexible(child: child),
        ],
      ),
    );
  }
}

/// Themed table widget
class ThemedTable extends StatelessWidget {
  const ThemedTable({
    super.key,
    required this.rows,
    required this.columnAlignments,
    required this.hasHeader,
    required this.maxCol,
    this.theme,
  });

  final List<Map<int, String>> rows;
  final List<TextAlign> columnAlignments;
  final bool hasHeader;
  final int maxCol;
  final TableTheme? theme;

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? TableTheme(
      cellBorder: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: 1),
      cellPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
    final controller = ScrollController();
    return Scrollbar(
      controller: controller,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        child: Table(
          textDirection: TextDirection.ltr,
          defaultColumnWidth: const IntrinsicColumnWidth(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.all(
            width: effectiveTheme.cellBorder?.width ?? 1,
            color: effectiveTheme.cellBorder?.color ?? Theme.of(context).colorScheme.onSurface,
          ),
          children: _buildRows(effectiveTheme),
        ),
      ),
    );
  }

  List<TableRow> _buildRows(TableTheme theme) {
    return rows.asMap().entries.where((entry) {
      if (hasHeader && entry.key == 1) return false;
      return true;
    }).map((entry) {
      final isHeader = hasHeader && entry.key == 0;
      return TableRow(
        decoration: isHeader ? BoxDecoration(color: theme.headerBackgroundColor) : null,
        children: List.generate(maxCol, (index) {
          final e = entry.value;
          final data = e[index] ?? "";
          if (RegExp(r"^:?--+:?$").hasMatch(data.trim())) return const SizedBox();
          return Padding(
            padding: theme.cellPadding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Align(
              alignment: _getAlignment(columnAlignments[index]),
              child: Text(data.trim()),
            ),
          );
        }),
      );
    }).toList();
  }

  Alignment _getAlignment(TextAlign align) {
    switch (align) {
      case TextAlign.center: return Alignment.center;
      case TextAlign.right: return Alignment.centerRight;
      default: return Alignment.centerLeft;
    }
  }
}