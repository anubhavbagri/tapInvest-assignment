import 'dart:ui';

import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    var changedHexColor = 'FFFFFF';
    // ignore: parameter_assignments
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      // ignore: parameter_assignments
      changedHexColor = 'FF$hexColor';
    } else if (hexColor.length == 3) {
      // ignore: parameter_assignments
      hexColor = hexColor + hexColor;
      changedHexColor = 'FF$hexColor';
    }
    return int.parse(changedHexColor, radix: 16);
  }
}
