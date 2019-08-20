import 'package:flutter/material.dart';

class SizeCompat {
  static double _devicePixelRatio = 1;
  static double width;
  static double height;
  static double top;
  static double bottom;
  static double _ratio;

  static void init(BuildContext context, double uiWidth) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _devicePixelRatio = mediaQuery.devicePixelRatio;
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;
    top = mediaQuery.padding.top;
    bottom = mediaQuery.padding.bottom;

    if (uiWidth == null) {
      uiWidth = 750;
    }
    _ratio = width / uiWidth;

//    print(
//        "mediaQuery   devicePixelRatio=${mediaQuery.devicePixelRatio}    _ratio=$_ratio");
//    print(
//        "mediaQuery   width=${mediaQuery.size.width}    height=${mediaQuery.size.height}");
  }

  ///
  ///  px to dp
  ///
  static double px(double number) {
    return number * _ratio;
  }

  ///
  ///  dp to px
  ///
  static double dpToPx(double number) {
    return number * _devicePixelRatio;
  }

  ///
  ///  1px to dp
  ///
  static double onepx() {
    return 1 / _devicePixelRatio;
  }
}
