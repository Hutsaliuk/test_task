import 'dart:math';
import 'package:flutter/material.dart';

/// Color generator
class ColorGenerator {
  ColorGenerator._();

  /// Generates random color.
  static Color generateColor() {

    const _maxGeneratedValue = 0x100;

    final _random = Random();

    final _alphaColor = _random.nextInt(_maxGeneratedValue);
    final _redColor = _random.nextInt(_maxGeneratedValue);
    final _greenColor = _random.nextInt(_maxGeneratedValue);
    final _blueColor = _random.nextInt(_maxGeneratedValue);
    final randomColor =
        Color.fromARGB(_alphaColor, _redColor, _greenColor, _blueColor);

    return randomColor;
  }
}
