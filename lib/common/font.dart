import 'package:flutter/widgets.dart';

/// 淘宝IconFont
class FFontFamilyTb {
  static const String family = "TaoBao-IconFont";

  static String arrowDownU = "\u{e60a}";
  static String arrowUpU = "\u{e60c}";
  static String arrowLeftU = "\u{e612}";
  static String arrowRightU = "\u{e60d}";

  static IconData arrowDown = const IconData(0xe60a, fontFamily: family);
  static IconData arrowUp = const IconData(0xe60c, fontFamily: family);
  static IconData arrowLeft = const IconData(0xe612, fontFamily: family);
  static IconData arrowRight = const IconData(0xe60d, fontFamily: family);
}

/// 淘票票IconFont
class FFontFamilyTpp {
  static const String family = "TaoPiaoPiao-IconFont";

  static String redPacketU = "\u{e657}";

  static IconData redPacket = const IconData(0xe657, fontFamily: family);
  static IconData setting = const IconData(0xe64b, fontFamily: family);
}

/// Modak-Regular Font
class FFontModakRegular {
  static String family = "Modak-Regular-Font";
}

/// ShadowsIntoLightRegular Font
class FFontShadowsIntoLightRegular {
  static String family = "ShadowsIntoLight-Regular-Font";
}
