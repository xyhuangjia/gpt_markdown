# Tasks: Layered Theme System

## 1. Theme Style Classes

- [x] 1.1 Create `MarkdownRootTheme` class with padding, fontFamily, wordBreak properties
- [x] 1.2 Create `ParagraphStyle` class with margin, lineHeight, wordSpacing, letterSpacing, textIndent properties
- [x] 1.3 Create `HeadingStyle` class with textStyle, borderBottom, contentDecoration properties
- [x] 1.4 Create `HeadingSuffixStyle` class for CSS :after pseudo-element rendering
- [x] 1.5 Create `InlineCodeStyle` class for inline code styling
- [x] 1.6 Create `MarkdownTextStyleTheme` aggregating all text style classes

## 2. Block Theme Classes

- [x] 2.1 Create `CodeBlockTheme` class with backgroundColor, textStyle, borderRadius properties
- [x] 2.2 Create `TableTheme` class with cellBorder, headerBackground, cellPadding properties
- [x] 2.3 Create `BlockQuoteTheme` class with barColor, barWidth, backgroundColor properties
- [x] 2.4 Create `HrTheme` class with color, thickness properties
- [x] 2.5 Create `MarkdownBlockTheme` aggregating all block style classes

## 3. Element Theme Classes

- [x] 3.1 Create `LinkUnderlineStyle` class for CSS border-bottom mapping
- [x] 3.2 Create `MarkdownLinkTheme` with color, hoverColor, underline properties
- [x] 3.3 Create `UnorderedListTheme` with bulletType, bulletColor properties
- [x] 3.4 Create `OrderedListTheme` with numberType, numberColor properties
- [x] 3.5 Create `CheckboxTheme` with activeColor, checkColor properties
- [x] 3.6 Create `RadioTheme` with activeColor, inactiveColor properties
- [x] 3.7 Create `MarkdownListTheme` aggregating all list style classes
- [x] 3.8 Create `MarkdownImageTheme` with widthPercentage, alignment properties
- [x] 3.9 Create `MarkdownLatexTheme` with inlineStyle, blockStyle, maxWidth properties
- [x] 3.10 Create `MarkdownSourceTagTheme` for reference tag styling
- [x] 3.11 Create `MarkdownFootnoteTheme` for footnote styling

## 4. GptMarkdownThemeData Refactor

- [x] 4.1 Refactor `GptMarkdownThemeData` to use layered theme classes
- [x] 4.2 Implement `lerp` method for all theme classes
- [x] 4.3 Implement `copyWith` method for all theme classes
- [x] 4.4 Add legacy getters (h1-h6, linkColor, hrLineColor, etc.) for backward compatibility
- [x] 4.5 Update `GptMarkdownTheme.of()` to support both GptMarkdownTheme and Theme.extension

## 5. Preset Theme Factories

- [x] 5.1 Implement `NiceThemeFactory` with complete CSS mapping (Nice 主题)
- [x] 5.2 Implement `MaterialThemeFactory` based on Flutter ThemeData
- [x] 5.3 Implement `GitHubThemeFactory` with GitHub markdown style
- [x] 5.4 Implement `MediumThemeFactory` with Medium article style

## 6. Themed Widgets

- [x] 6.1 Create `ThemedHeading` widget with h2 .content and :after support
- [x] 6.2 Create `ThemedLink` widget with border-bottom underline support
- [x] 6.3 Create `ThemedCodeField` widget replacing `CodeField`
- [x] 6.4 Create `ThemedTable` widget with theme-based styling
- [x] 6.5 Create `ThemedBlockQuote` widget with bar and background
- [x] 6.6 Create `ThemedCheckbox` widget with theme colors
- [x] 6.7 Create `ThemedRadio` widget with theme colors

## 7. Component Updates

- [x] 7.1 Update `HTag` to use `ThemedHeading` and new heading styles
- [x] 7.2 Update `ATagMd` to use `ThemedLink` and new link theme
- [x] 7.3 Update `BlockQuote` to use `ThemedBlockQuote`
- [x] 7.4 Update `CodeBlockMd` to use `ThemedCodeField`
- [x] 7.5 Update `TableMd` to use `ThemedTable`
- [x] 7.6 Update `HrLine` to use `HrTheme`
- [x] 7.7 Update `BoldMd`, `ItalicMd`, `StrikeMd` to use textStyle theme
- [x] 7.8 Update `HighlightedText` to use `InlineCodeStyle`
- [x] 7.9 Update `CheckBoxMd` to use `ThemedCheckbox`
- [x] 7.10 Update `RadioButtonMd` to use `ThemedRadio`
- [x] 7.11 Update `UnOrderedList` to use `UnorderedListTheme`
- [x] 7.12 Update `OrderedList` to use `OrderedListTheme`
- [x] 7.13 Update `ImageMd` to use `MarkdownImageTheme`
- [x] 7.14 Update `LatexMath` to use `MarkdownLatexTheme`

## 8. Testing

- [ ] 8.1 Add unit tests for all theme classes (lerp, copyWith)
- [x] 8.2 Add backward compatibility tests (21 tests already created)
- [ ] 8.3 Add preset theme verification tests
- [ ] 8.4 Add golden tests for Nice theme rendering
- [x] 8.5 Run full test suite and ensure all 190+ tests pass

## 9. Documentation

- [ ] 9.1 Update README.md with theme usage examples
- [ ] 9.2 Add theme gallery to example app
- [ ] 9.3 Document CSS-to-Flutter mapping for custom themes