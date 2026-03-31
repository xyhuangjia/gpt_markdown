import 'package:flutter/material.dart';

/// Bullet type for unordered lists
enum BulletType { disc, circle, square }

/// Number type for ordered lists
enum NumberType { decimal, upperRoman, lowerGreek, lowerAlpha, upperAlpha }

/// Unordered list theme
class UnorderedListTheme {
  const UnorderedListTheme({
    this.bulletType = BulletType.disc,
    this.bulletColor,
    this.bulletSize,
    this.bulletSpacing,
    this.customBulletWidget,
    this.marginLeft,
    this.paddingLeft,
  });

  /// Bullet type (CSS: list-style-type)
  final BulletType bulletType;

  /// Bullet color
  final Color? bulletColor;

  /// Bullet size (relative to font size, e.g., 0.3)
  final double? bulletSize;

  /// Spacing between bullet and content
  final double? bulletSpacing;

  /// Custom bullet widget
  final Widget? customBulletWidget;

  /// Left margin
  final double? marginLeft;

  /// Left padding
  final double? paddingLeft;

  static UnorderedListTheme? lerp(
    UnorderedListTheme? a,
    UnorderedListTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return UnorderedListTheme(
      bulletType: t < 0.5 ? a.bulletType : b.bulletType,
      bulletColor: Color.lerp(a.bulletColor, b.bulletColor, t),
      bulletSize: _lerpDouble(a.bulletSize ?? 0.3, b.bulletSize ?? 0.3, t),
      bulletSpacing: _lerpDouble(a.bulletSpacing ?? 5, b.bulletSpacing ?? 5, t),
      marginLeft: _lerpDouble(a.marginLeft ?? 0, b.marginLeft ?? 0, t),
      paddingLeft: _lerpDouble(a.paddingLeft ?? 0, b.paddingLeft ?? 0, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Ordered list theme
class OrderedListTheme {
  const OrderedListTheme({
    this.numberType = NumberType.decimal,
    this.numberColor,
    this.numberFontSize,
    this.numberSpacing,
    this.numberAlignment,
    this.marginLeft,
    this.paddingLeft,
  });

  /// Number type (CSS: list-style-type)
  final NumberType numberType;

  /// Number color
  final Color? numberColor;

  /// Number font size
  final double? numberFontSize;

  /// Spacing between number and content
  final double? numberSpacing;

  /// Number alignment
  final Alignment? numberAlignment;

  /// Left margin
  final double? marginLeft;

  /// Left padding
  final double? paddingLeft;

  static OrderedListTheme? lerp(
    OrderedListTheme? a,
    OrderedListTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return OrderedListTheme(
      numberType: t < 0.5 ? a.numberType : b.numberType,
      numberColor: Color.lerp(a.numberColor, b.numberColor, t),
      numberFontSize: _lerpDouble(
        a.numberFontSize ?? 14,
        b.numberFontSize ?? 14,
        t,
      ),
      numberSpacing: _lerpDouble(a.numberSpacing ?? 5, b.numberSpacing ?? 5, t),
      marginLeft: _lerpDouble(a.marginLeft ?? 0, b.marginLeft ?? 0, t),
      paddingLeft: _lerpDouble(a.paddingLeft ?? 0, b.paddingLeft ?? 0, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Checkbox theme
class CheckboxTheme {
  const CheckboxTheme({
    this.activeColor,
    this.checkColor,
    this.inactiveColor,
    this.size,
    this.spacing,
  });

  /// Active checkbox color
  final Color? activeColor;

  /// Check mark color
  final Color? checkColor;

  /// Inactive checkbox color
  final Color? inactiveColor;

  /// Checkbox size
  final double? size;

  /// Spacing between checkbox and text
  final double? spacing;

  static CheckboxTheme? lerp(CheckboxTheme? a, CheckboxTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return CheckboxTheme(
      activeColor: Color.lerp(a.activeColor, b.activeColor, t),
      checkColor: Color.lerp(a.checkColor, b.checkColor, t),
      inactiveColor: Color.lerp(a.inactiveColor, b.inactiveColor, t),
      size: _lerpDouble(a.size ?? 18, b.size ?? 18, t),
      spacing: _lerpDouble(a.spacing ?? 5, b.spacing ?? 5, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// Radio button theme
class RadioTheme {
  const RadioTheme({
    this.activeColor,
    this.inactiveColor,
    this.size,
    this.spacing,
  });

  /// Active radio color
  final Color? activeColor;

  /// Inactive radio color
  final Color? inactiveColor;

  /// Radio size
  final double? size;

  /// Spacing between radio and text
  final double? spacing;

  static RadioTheme? lerp(RadioTheme? a, RadioTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return RadioTheme(
      activeColor: Color.lerp(a.activeColor, b.activeColor, t),
      inactiveColor: Color.lerp(a.inactiveColor, b.inactiveColor, t),
      size: _lerpDouble(a.size ?? 18, b.size ?? 18, t),
      spacing: _lerpDouble(a.spacing ?? 5, b.spacing ?? 5, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// List item theme
class ListItemTheme {
  const ListItemTheme({this.textStyle, this.spacing});

  /// List item text style
  final TextStyle? textStyle;

  /// Spacing between items
  final double? spacing;

  static ListItemTheme? lerp(ListItemTheme? a, ListItemTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return ListItemTheme(
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      spacing: _lerpDouble(a.spacing ?? 0, b.spacing ?? 0, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}

/// List elements theme container
class MarkdownListTheme {
  const MarkdownListTheme({
    this.unordered,
    this.ordered,
    this.checkbox,
    this.radio,
    this.listItem,
  });

  /// Unordered list theme
  final UnorderedListTheme? unordered;

  /// Ordered list theme
  final OrderedListTheme? ordered;

  /// Checkbox theme
  final CheckboxTheme? checkbox;

  /// Radio button theme
  final RadioTheme? radio;

  /// List item theme
  final ListItemTheme? listItem;

  static MarkdownListTheme lerp(
    MarkdownListTheme a,
    MarkdownListTheme b,
    double t,
  ) {
    return MarkdownListTheme(
      unordered: UnorderedListTheme.lerp(a.unordered, b.unordered, t),
      ordered: OrderedListTheme.lerp(a.ordered, b.ordered, t),
      checkbox: CheckboxTheme.lerp(a.checkbox, b.checkbox, t),
      radio: RadioTheme.lerp(a.radio, b.radio, t),
      listItem: ListItemTheme.lerp(a.listItem, b.listItem, t),
    );
  }

  MarkdownListTheme copyWith({
    UnorderedListTheme? unordered,
    OrderedListTheme? ordered,
    CheckboxTheme? checkbox,
    RadioTheme? radio,
    ListItemTheme? listItem,
  }) {
    return MarkdownListTheme(
      unordered: unordered ?? this.unordered,
      ordered: ordered ?? this.ordered,
      checkbox: checkbox ?? this.checkbox,
      radio: radio ?? this.radio,
      listItem: listItem ?? this.listItem,
    );
  }
}
