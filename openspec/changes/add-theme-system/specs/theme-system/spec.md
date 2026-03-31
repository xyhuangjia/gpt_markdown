# Theme System Specification

## ADDED Requirements

### Requirement: Theme data provides layered style configuration

The system SHALL provide a layered theme architecture with dedicated style classes for each Markdown element category.

#### Scenario: Access root theme properties
- **WHEN** user accesses `theme.root.padding`
- **THEN** system returns an `EdgeInsets` value for page margins

#### Scenario: Access text style theme
- **WHEN** user accesses `theme.textStyle.h2`
- **THEN** system returns a `HeadingStyle` object with `textStyle`, `borderBottom`, and `contentDecoration` properties

#### Scenario: Access block theme
- **WHEN** user accesses `theme.block.codeBlock`
- **THEN** system returns a `CodeBlockTheme` object with `backgroundColor`, `textStyle`, and `borderRadius` properties

#### Scenario: Access link theme
- **WHEN** user accesses `theme.link.underline`
- **THEN** system returns a `LinkUnderlineStyle` object with `color`, `thickness`, and `style` properties

### Requirement: Theme supports preset factories

The system SHALL provide factory constructors for preset themes.

#### Scenario: Create Nice theme
- **WHEN** user calls `GptMarkdownThemeData.nice()`
- **THEN** system returns a theme with:
  - Primary color rgb(239, 112, 96)
  - h2 with border-bottom and content decoration
  - Link with border-bottom underline
  - BlockQuote with red left bar and pink background

#### Scenario: Create Material theme
- **WHEN** user calls `GptMarkdownThemeData.material(brightness: Brightness.dark)`
- **THEN** system returns a theme based on Flutter's dark ThemeData

#### Scenario: Override preset colors
- **WHEN** user calls `GptMarkdownThemeData.nice(primaryColor: Colors.blue)`
- **THEN** system returns a Nice theme with blue as primary color

### Requirement: Heading supports CSS-like decoration

The system SHALL support heading styles that mimic CSS pseudo-elements.

#### Scenario: h2 with content decoration
- **WHEN** `HeadingStyle.contentDecoration` is defined
- **THEN** system renders heading text inside a styled container with background, borderRadius, and padding

#### Scenario: h2 with suffix decoration (:after)
- **WHEN** `HeadingSuffixStyle.show` is true
- **THEN** system renders a suffix widget after the heading content (e.g., triangle shape)

### Requirement: Link supports border-bottom underline

The system SHALL support links with CSS `border-bottom` style underlines.

#### Scenario: Link with solid underline
- **WHEN** `LinkUnderlineStyle.style` is `solid`
- **THEN** system renders link with `TextDecoration.underline` in the specified color and thickness

#### Scenario: Link without underline
- **WHEN** `LinkUnderlineStyle.show` is false
- **THEN** system renders link without any underline decoration

### Requirement: Theme integrates with Flutter Theme system

The system SHALL integrate with Flutter's `ThemeExtension` mechanism.

#### Scenario: Get theme from GptMarkdownTheme provider
- **WHEN** `GptMarkdownTheme.of(context)` is called inside a `GptMarkdownTheme` widget
- **THEN** system returns the provided `GptMarkdownThemeData`

#### Scenario: Get theme from Theme.extension
- **WHEN** `GptMarkdownTheme.of(context)` is called without `GptMarkdownTheme` widget
- **AND** `ThemeData.extensions` contains `GptMarkdownThemeData`
- **THEN** system returns the theme from `Theme.extension<GptMarkdownThemeData>()`

#### Scenario: Get default theme
- **WHEN** `GptMarkdownTheme.of(context)` is called without any provider
- **THEN** system returns a default theme based on `Theme.of(context).brightness`

### Requirement: Theme lerp supports animation

The system SHALL support `lerp` for theme animation.

#### Scenario: Lerp between two themes
- **WHEN** `theme1.lerp(theme2, 0.5)` is called
- **THEN** system returns a new theme with interpolated colors and numeric values

### Requirement: Backward compatibility maintained

The system SHALL maintain backward compatibility with v1.1.5 API.

#### Scenario: Access h1-h6 via legacy getters
- **WHEN** user accesses `theme.h1`, `theme.h2`, etc.
- **THEN** system returns the same value as `theme.textStyle.h1?.textStyle`

#### Scenario: Access linkColor via legacy getter
- **WHEN** user accesses `theme.linkColor`
- **THEN** system returns the same value as `theme.link.color`

#### Scenario: Access hrLineColor via legacy getter
- **WHEN** user accesses `theme.hrLineColor`
- **THEN** system returns the same value as `theme.block.horizontalRule.color`

#### Scenario: Access highlightColor via legacy getter
- **WHEN** user accesses `theme.highlightColor`
- **THEN** system returns a color suitable for highlighting

### Requirement: Builder callbacks override theme styles

The system SHALL allow builder callbacks to override theme styles.

#### Scenario: codeBuilder overrides theme
- **WHEN** `codeBuilder` is provided in `GptMarkdown` widget
- **THEN** system uses the builder's output instead of `theme.block.codeBlock` style

#### Scenario: linkBuilder overrides theme
- **WHEN** `linkBuilder` is provided in `GptMarkdown` widget
- **THEN** system uses the builder's output instead of `theme.link` style

### Requirement: Theme supports copyWith for partial customization

The system SHALL support `copyWith` for partial theme customization.

#### Scenario: Override only link color
- **WHEN** user calls `theme.copyWith(link: MarkdownLinkTheme(color: Colors.blue))`
- **THEN** system returns a new theme with blue links and all other properties unchanged