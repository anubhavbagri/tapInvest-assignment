import 'package:flutter/material.dart';

class SizeConfig {
  static double? safeHorizontal;
  static double? safeVertical;
  static Orientation? orientation;
  static Brightness? brightness;

  void init(BuildContext context) {
    safeHorizontal = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left +
        MediaQuery.of(context).padding.right;
    safeVertical = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    orientation = MediaQuery.of(context).orientation;
    brightness = MediaQuery.of(context).platformBrightness;
  }
}
