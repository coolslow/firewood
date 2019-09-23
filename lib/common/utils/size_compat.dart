import 'package:firewood/common/utils/utils.dart';
import 'package:flutter/material.dart';

class SizeCompat {
  static double _devicePixelRatio = 1;
  static double _width;
  static double _height;
  static double top;
  static double bottom;
  static double _ratio;

  static void init(BuildContext context, double uiWidth) {

    MediaQueryData mediaQuery = MediaQuery.of(context);
    _devicePixelRatio = mediaQuery.devicePixelRatio;
    _width = mediaQuery.size.width;
    _height = mediaQuery.size.height;
    top = mediaQuery.padding.top;
    bottom = mediaQuery.padding.bottom;

    if (uiWidth == null) {
      uiWidth = 750;
    }
    _ratio = _width / uiWidth;

//    Utils.printReleaseLog(" SizeCompat  _width=$_width _height=$_height  uiWidth=$uiWidth   _ratio=$_ratio  top=$top   bottom=$bottom");

//    print(
//        "mediaQuery   devicePixelRatio=${mediaQuery.devicePixelRatio}    _ratio=$_ratio");
//    print(
//        "mediaQuery   width=${mediaQuery.size.width}    height=${mediaQuery.size.height}");
  }

  ///
  ///  px to dp
  ///
  static double pxToDp(double number) {
    return number * _ratio;
  }


  static double pxToDeviceDp(double number) {
    return number / _devicePixelRatio;
  }

  ///
  ///  dp to px
  ///
//  static double dpToPx(double number) {
//    return number / _ratio;
//  }

//  ///
//  ///  1px to dp
//  ///
//  static double onePx() {
//    return 1 / _devicePixelRatio;
//  }

  ///
  ///  width
  ///
  static double widthPx() {
    return _width * _devicePixelRatio;
  }

  static double width() {
    return _width;
  }

  ///
  ///  height
  ///
//  static double heightPx() {
//    return _height * _devicePixelRatio;
//  }

  static double height() {
    return _height;
  }


}
