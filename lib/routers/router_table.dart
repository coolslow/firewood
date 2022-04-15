import 'package:firewood/routers/router.dart';
import 'package:firewood/routers/router_animate.dart';
import 'package:firewood/screens/compose/douban_compose_page.dart';
import 'package:firewood/screens/subject/douban_subject_move_page.dart';
import 'package:firewood/screens/subject/douban_subject_teleplay_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouterTable {

  static const String PREFIX = "flutter://www.firewood.org";
  static const String PH = "(:)";
  static const String COMPOSE = "$PREFIX/compose/$PH";

  static Future<dynamic>? handle(
    BuildContext context,
    String url, {
    Object? arguments,
    RouterAnimate animateType: RouterAnimate.SlideRightIn,
  }) {
    return RouterUtils.handle(context, url,
        arguments: arguments, animateType: animateType);
  }

  /// 路由在此注册
  /// 两种方式
  /// 1 通用的可以写在RouterTable中。
  /// 2 分模块的可以写在自定义的类中，并在此注册。
  static Map<String, Widget> routers = <String, Widget>{
    COMPOSE: ComposePage(),
    RouterTableSubject.MOVE: MovePage(),
    RouterTableSubject.TELEPLAY: TeleplayPage(),
  };

}

/// 书影音模块路由
class RouterTableSubject {
  static const String MOVE = "${RouterTable.PREFIX}/move";
  static const String TELEPLAY = "${RouterTable.PREFIX}/teleplay";
}
