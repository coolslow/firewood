import 'package:flutter/foundation.dart';

class Utils {

  static StringBuffer _stringBuffer = StringBuffer();

  static printIdentity(Object thizz) {
    print(describeIdentity(thizz));
  }

  static String getIdentity(Object thizz) {
    return describeIdentity(thizz);
  }

  static printReleaseLog(String log) {
    bool manualOpen = true;
//    bool manualOpen = false;
    if(manualOpen){
      _stringBuffer.writeln(log);
    }else{
      const bool inProduction = const bool.fromEnvironment("dart.vm.product");
      if(!inProduction){
        _stringBuffer.writeln(log);
      }
    }

  }

  static String getReleaseLog() {
    return _stringBuffer.toString();
  }

}
