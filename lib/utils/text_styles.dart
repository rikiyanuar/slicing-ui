import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyles {
  static const w100 = TextStyle(fontVariations: [FontVariation(_axis, 100)]);
  static const w200 = TextStyle(fontVariations: [FontVariation(_axis, 200)]);
  static const w300 = TextStyle(fontVariations: [FontVariation(_axis, 300)]);
  static const w400 = TextStyle(fontVariations: [FontVariation(_axis, 400)]);
  static const w500 = TextStyle(fontVariations: [FontVariation(_axis, 500)]);
  static const w600 = TextStyle(fontVariations: [FontVariation(_axis, 600)]);
  static const w700 = TextStyle(fontVariations: [FontVariation(_axis, 700)]);
  static const w800 = TextStyle(fontVariations: [FontVariation(_axis, 800)]);
  static const w900 = TextStyle(fontVariations: [FontVariation(_axis, 900)]);

  static const String _axis = "wght";
}
