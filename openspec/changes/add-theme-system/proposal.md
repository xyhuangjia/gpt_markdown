# Proposal: Add Layered Theme System

## Why

The current theme system (`GptMarkdownThemeData`) only supports a limited set of elements (h1-h6, link, hr, highlight). Users cannot customize styles for code blocks, tables, blockquotes, lists, checkboxes, and other Markdown elements without using builder callbacks. This limits the package's flexibility for AI output rendering (ChatGPT, Gemini) where visual customization is critical.

## What Changes

- Add a **layered theme architecture** with dedicated theme classes for each element type:
  - `MarkdownRootTheme` - global styles (padding, font, word-break)
  - `MarkdownTextStyleTheme` - text styles (heading, bold, italic, strike, inline code)
  - `MarkdownBlockTheme` - block elements (code block, table, blockquote, hr)
  - `MarkdownListTheme` - list elements (ordered, unordered, checkbox, radio)
  - `MarkdownLinkTheme` - link styles (color, underline, hover)
  - `MarkdownImageTheme` - image styles (width, alignment)
  - `MarkdownLatexTheme` - LaTeX styles
  - `MarkdownFootnoteTheme` - footnote styles

- Add **preset themes** with factory constructors:
  - `GptMarkdownThemeData.nice()` - WeChat article style (based on provided CSS)
  - `GptMarkdownThemeData.material()` - Flutter Material style
  - `GptMarkdownThemeData.github()` - GitHub style
  - `GptMarkdownThemeData.medium()` - Medium style

- Add **ThemedXxx widgets** for complex rendering:
  - `ThemedHeading` - handles h2 .content decoration + :after pseudo-element
  - `ThemedLink` - handles CSS border-bottom underline
  - `ThemedCodeField` - themed code blocks
  - `ThemedTable` - themed tables
  - `ThemedBlockQuote` - themed blockquotes

- Maintain **backward compatibility** via legacy getters:
  - `theme.h1` → `theme.textStyle.h1?.textStyle`
  - `theme.linkColor` → `theme.link.color`
  - `theme.hrLineColor` → `theme.block.horizontalRule.color`

## Capabilities

### New Capabilities

- `theme-system`: Layered theme architecture with preset themes (Nice, Material, GitHub, Medium) and fine-grained control over all Markdown element styles

### Modified Capabilities

- None (all existing APIs remain compatible via legacy getters)

## Impact

### Code Changes

- `lib/theme.dart` - major refactor to layered architecture
- `lib/markdown_component.dart` - update components to use new theme
- `lib/custom_widgets/` - add themed widgets
- New directory: `lib/src/theme/` with style classes and presets

### API Compatibility

- **Fully backward compatible**: Existing `GptMarkdownThemeData` API continues to work
- Legacy getters map to new layered properties
- Existing `codeBuilder`, `linkBuilder` callbacks take precedence over theme styles

### Test Changes

- Add backward compatibility tests in `test/migration/`
- Add unit tests for new theme classes
- Add golden tests for preset themes