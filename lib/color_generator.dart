import 'dart:math';
import 'package:flutter/material.dart';

/// Color generator
class ColorGenerator {
  ColorGenerator._();

  /// Generates random color.
  static Color generateColor() {
    final randomColorIndex = Random().nextInt(Colors.primaries.length);
    final randomColor = Colors.primaries[randomColorIndex];

    // Another way to generate random color

    // const _maxGeneratedValue = 0x100000000;
    // final randomColor = Color(Random().nextInt(_maxGeneratedValue));

    return randomColor;
  }
}
