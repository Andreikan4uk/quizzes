import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors(
      {this.beginPrimaryGradient,
      this.endPrimaryGradient,
      this.diagramLine,
      this.diagramGradient,
      this.colorExtraLine,
      this.colorCliderIcon,
      this.buttonOnbColor});

  final Color? beginPrimaryGradient;
  final Color? endPrimaryGradient;
  final Color? diagramLine;
  final Color? diagramGradient;
  final Color? colorExtraLine;
  final Color? colorCliderIcon;
  final Color? buttonOnbColor;

  @override
  CustomColors copyWith({
    Color? beginGradientTitle,
    Color? endGradientTitle,
    Color? diagramLine,
    Color? diagramGradient,
    Color? colorExtraLine,
    Color? colorCliderIcon,
    Color? buttonOnbColor,
  }) {
    return CustomColors(
      beginPrimaryGradient: beginGradientTitle ?? this.beginPrimaryGradient,
      endPrimaryGradient: endGradientTitle ?? this.endPrimaryGradient,
      diagramLine: diagramLine ?? this.diagramLine,
      diagramGradient: diagramGradient ?? this.diagramGradient,
      colorExtraLine: colorExtraLine ?? this.colorExtraLine,
      colorCliderIcon: colorCliderIcon ?? this.colorCliderIcon,
      buttonOnbColor: buttonOnbColor ?? this.buttonOnbColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      beginPrimaryGradient:
          Color.lerp(beginPrimaryGradient, other.beginPrimaryGradient, t),
      endPrimaryGradient:
          Color.lerp(endPrimaryGradient, other.endPrimaryGradient, t),
      diagramLine: Color.lerp(diagramLine, other.diagramLine, t),
      diagramGradient: Color.lerp(diagramGradient, other.diagramGradient, t),
      colorExtraLine: Color.lerp(colorExtraLine, other.colorExtraLine, t),
      colorCliderIcon: Color.lerp(colorCliderIcon, other.colorCliderIcon, t),
      buttonOnbColor: Color.lerp(buttonOnbColor, other.buttonOnbColor, t),
    );
  }

  @override
  String toString() => 'CustomColors('
      'textPrimaryTitle: $beginPrimaryGradient,'
      'textSecondaryTitle: $endPrimaryGradient,'
      'diagramLine: $diagramLine,'
      'DiagramGradient: $diagramGradient,'
      'endDiagramGradient: $colorExtraLine,'
      'colorCliderIcon: $colorCliderIcon,'
      'buttonOnbColor: $buttonOnbColor,'
      ')';

  // the light theme
  static const light = CustomColors(
    beginPrimaryGradient: Color(0xFF7641E8),
    endPrimaryGradient: Color(0xFFAD00FF),
    diagramLine: Color(0xFF8863E4),
    diagramGradient: Color(0xFFAE93F6),
    colorExtraLine: Color(0xFF606060),
    colorCliderIcon: Color(0xFFF3F4F5),
    buttonOnbColor: Color(0xFF3A3A3A),
  );
}
