import 'dart:math';

import 'package:flutter/foundation.dart';

class Utils {
  static StringBuffer _stringBuffer = StringBuffer();

  static printIdentity(Object thiz) {
    print(describeIdentity(thiz));
  }

  static String getIdentity(Object thiz) {
    return describeIdentity(thiz);
  }

  static printReleaseLog(String log) {
    bool manualOpen = true;
//    bool manualOpen = false;
    if (manualOpen) {
      _stringBuffer.writeln(log);
    } else {
      const bool inProduction = const bool.fromEnvironment("dart.vm.product");
      if (!inProduction) {
        _stringBuffer.writeln(log);
      }
    }
  }

  static String getReleaseLog() {
    return _stringBuffer.toString();
  }

  static int _autoIncrement = 1;

  static int autoIncrement() {
    return (_autoIncrement++);
  }
  static void resetAutoIncrement() {
     _autoIncrement = 1;
  }

  static final  _random = Random();
  static int randomTime(int min, int max) => min + _random.nextInt(max - min);

}
