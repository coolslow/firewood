

import 'dart:ui';

class ColorUtil{


  static Color parse(String hexColor){
    return Color(int.parse(hexColor, radix: 16));
  }

}