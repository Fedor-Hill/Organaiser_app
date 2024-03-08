import 'package:flutter/material.dart';

class MarkColor extends ThemeExtension<MarkColor> {
  const MarkColor({
    required this.textMarkColor,
    required this.satisfactorilyMark,
    required this.badMark,
    required this.goodMark
    });

  final Color goodMark, badMark, satisfactorilyMark, textMarkColor; 

  @override
  MarkColor copyWith({
    Color? goodMark, badMark, satisfactorilyMark, textMarkColor
    }) => MarkColor(
      goodMark: goodMark ?? this.goodMark,
      badMark: badMark ?? this.badMark,
      satisfactorilyMark: satisfactorilyMark ?? this.satisfactorilyMark,
      textMarkColor: textMarkColor ?? this.textMarkColor
    );

  @override
  MarkColor lerp(ThemeExtension<MarkColor>? other, double t) {
    if (other is! MarkColor) {
      return this; 
    }

    return MarkColor(
      goodMark: Color.lerp(goodMark, other.goodMark, t) ?? Colors.white,
      badMark: Color.lerp(badMark, other.badMark, t) ?? Colors.white,
      satisfactorilyMark: Color.lerp(satisfactorilyMark, other.badMark, t) ?? Colors.white,
      textMarkColor: Color.lerp(textMarkColor, other.textMarkColor, t) ?? Colors.white
    );
  }
}
