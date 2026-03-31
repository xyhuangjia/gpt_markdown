# Design: Layered Theme System

## Context

The `gpt_markdown` package renders Markdown with LaTeX support for Flutter apps. Currently, `GptMarkdownThemeData` provides limited customization (h1-h6, link, hr, highlight). Users must use builder callbacks for deeper customization, which requires more code and breaks declarative theming.

### Current Architecture

```
GptMarkdownThemeData (ThemeExtension)
├── h1, h2, h3, h4, h5, h6 (TextStyle)
├── linkColor, linkHoverColor (Color)
├── hrLineColor, hrLineThickness
└── highlightColor

MarkdownComponent
├── HTag → uses theme.h1-h6
├── ATagMd → uses theme.linkColor
├── HrLine → uses theme.hrLineColor
├── HighlightedText → uses theme.highlightColor
└── Others → hardcoded Theme.of(context) or constants
```

### Constraints

1. **Backward Compatibility**: Existing API must continue to work
2. **Flutter Theme Integration**: Use `ThemeExtension` for lerp/copyWith support
3. **CSS Mapping**: Support CSS-like styling for preset themes (Nice theme based on WeChat CSS)

## Goals / Non-Goals

**Goals:**
- Provide fine-grained style control for ALL Markdown elements
- Support preset themes (Nice, Material, GitHub, Medium)
- Implement CSS `:after` pseudo-element pattern (e.g., h2 triangle decoration)
- Maintain 100% backward compatibility with v1.1.5 API
- Keep builder callbacks as override mechanism

**Non-Goals:**
- CSS parser (users define themes in Dart)
- Runtime theme switching animation (lerp is implemented but not required)
- Custom Markdown syntax extensions

## Decisions

### Decision 1: Layered Theme Classes

**Choice:** Separate theme class per element category

**Rationale:**
- Single monolithic `GptMarkdownThemeData` would have 50+ properties
- Layered approach allows partial customization (e.g., only customize `block.codeBlock`)
- Follows Flutter's `ThemeData` pattern with `TextTheme`, `AppBarTheme`, etc.

**Structure:**
```dart
GptMarkdownThemeData
├── root: MarkdownRootTheme           // padding, fontFamily, wordBreak
├── textStyle: MarkdownTextStyleTheme // h1-h6, bold, italic, strike, inlineCode
├── block: MarkdownBlockTheme         // codeBlock, table, blockQuote, hr
├── list: MarkdownListTheme           // ordered, unordered, checkbox, radio
├── link: MarkdownLinkTheme           // color, hoverColor, underline
├── image: MarkdownImageTheme         // widthPercentage, alignment
├── latex: MarkdownLatexTheme         // inline, block, maxWidth
├── sourceTag: MarkdownSourceTagTheme // reference tags [1]
└── footnote: MarkdownFootnoteTheme   // footnote styles
```

**Alternatives Considered:**
- Flat properties (rejected: too many top-level properties)
- Builder-only (rejected: no declarative theming)

### Decision 2: CSS-to-Flutter Mapping Strategy

**Choice:** Map CSS concepts to Flutter equivalents

| CSS Concept | Flutter Equivalent |
|-------------|-------------------|
| `border-bottom: 1px solid red` | `TextDecoration.underline` + `decorationColor` |
| `:after` pseudo-element | `Widget` (CustomPaint or composition) |
| `text-indent: 2em` | `double` (converted: fontSize × 2) |
| `line-height: 26px` | `double` (relative: 26/16 = 1.625) |
| `max-width: 300%` | `double` (multiplier: 3.0) |

**Rationale:**
- Preserves CSS mental model for web developers
- Allows direct translation of CSS themes (like Nice)

### Decision 3: Preset Theme Architecture

**Choice:** Factory constructors on `GptMarkdownThemeData`

```dart
factory GptMarkdownThemeData.nice({Brightness brightness, Color? primaryColor});
factory GptMarkdownThemeData.material({Brightness brightness});
factory GptMarkdownThemeData.github({Brightness brightness});
factory GptMarkdownThemeData.medium({Brightness brightness});
```

**Rationale:**
- One-line theme application
- Consistent API across presets
- Easy to add new presets

**Alternatives Considered:**
- Separate `MarkdownPreset` enum (rejected: less flexible)
- `GptMarkdownThemeData.fromPreset(Preset.nice)` (rejected: more verbose)

### Decision 4: ThemedWidget Pattern

**Choice:** Create `ThemedXxx` widgets for complex rendering

```dart
// Complex h2 with .content background + :after triangle
ThemedHeading(
  level: 2,
  headingStyle: theme.textStyle.h2,
  suffixStyle: theme.textStyle.h2Suffix,
  ...
)

// Link with border-bottom underline
ThemedLink(
  url: '...',
  style: theme.link,
  ...
)
```

**Rationale:**
- Encapsulates complex rendering logic
- Keeps `MarkdownComponent` classes clean
- Reusable across different contexts

**Alternatives Considered:**
- Inline rendering in component (rejected: hard to test/maintain)
- Builder pattern (rejected: overly complex for simple cases)

### Decision 5: Backward Compatibility via Getters

**Choice:** Add legacy getters to `GptMarkdownThemeData`

```dart
// New layered API
TextStyle? get h1 => textStyle.h1?.textStyle;
Color get linkColor => link.color ?? Colors.blue;
Color get hrLineColor => block.horizontalRule.color ?? Colors.grey;
```

**Rationale:**
- Zero breaking changes for existing users
- Gradual migration path
- Deprecation warnings in future versions

## Risks / Trade-offs

### Risk: API Complexity
- **Risk:** Users may find layered API confusing
- **Mitigation:** Provide preset themes + clear documentation + examples

### Risk: Performance Impact
- **Risk:** More theme lookups per render
- **Mitigation:** Cache theme lookup at widget build time; no measurable impact expected

### Risk: Breaking Changes
- **Risk:** Subtle behavior changes in edge cases
- **Mitigation:** Comprehensive backward compatibility tests (21 tests already created)

### Trade-off: Builder vs Theme Priority
- **Choice:** Builder callbacks override theme styles
- **Rationale:** Allows full customization when theme is insufficient
- **Trade-off:** Users may not realize builder takes precedence

## Migration Plan

### Phase 1: Add New Theme System (Non-Breaking)
1. Create layered theme classes in `lib/src/theme/styles/`
2. Add preset factories
3. Add legacy getters to `GptMarkdownThemeData`
4. Add backward compatibility tests

### Phase 2: Update Components
1. Create `ThemedXxx` widgets
2. Update `MarkdownComponent` to use new theme
3. Run all tests

### Phase 3: Documentation & Examples
1. Update README with theme examples
2. Add theme gallery to example app
3. Document Nice theme CSS mapping

### Rollback Strategy
- All changes are additive (no breaking changes)
- If issues found, revert Phase 2 changes; Phase 1 remains functional