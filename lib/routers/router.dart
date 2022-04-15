import 'package:firewood/routers/router_animate.dart';
import 'package:firewood/routers/router_table.dart';
import 'package:firewood/widgets/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouterUtils {

  static Future<dynamic>? handle(
    BuildContext context,
    String url, {
    Object? arguments,
    required RouterAnimate animateType,
  }) {
    if (url == null || url.isEmpty) {
      FToast.show("Routr is empty");
      return null;
    }
    Uri uri = Uri.parse(url);
    Widget? widget = _match(uri);
    if (widget == null) {
      FToast.showLong(
          "Router not matched by flutter router table, Maybe you can call native router table");
      return null;
    }

    if (uri.queryParameters != null && uri.queryParameters.isNotEmpty) {
      return _handle(context, widget,
          arguments: uri.queryParameters, animateType: animateType);
    } else if (arguments != null) {
      return _handle(context, widget,
          arguments: arguments, animateType: animateType);
    }

    return _handle(context, widget, animateType: animateType);
  }

  static Widget? _match(Uri uri) {
    if (!uri.toString().startsWith(RouterTable.PREFIX)) {
      return null;
    }

    Widget? result;
    result = RouterTable.routers[uri.path];
    if (result != null) {
      return result;
    }

    for (MapEntry<String, Widget> entry in RouterTable.routers.entries) {
      String template = entry.key;
      if (!template.contains(RouterTable.PH)) {
        continue;
      }
      List<String> templateList = template.split("/");
      List<String> originList =
          (uri.scheme + "://" + uri.authority + uri.path).split("/");

      if (templateList.length != originList.length) {
        continue;
      }

      bool isMatch = true;
      for (int i = 0; i < originList.length; i++) {
        String o = originList[i];
        String t = templateList[i];
        if (t == RouterTable.PH) {
          continue;
        }
        if (o == t) {
          continue;
        } else {
          isMatch = false;
          break;
        }
      }

      if (isMatch) {
        return entry.value;
      }
    }

    return null;
  }

  static AnimatedWidget _getAnimatedWidget(
      RouterAnimate animateType, Animation<double> animation, Widget w) {
    if (animateType == RouterAnimate.SlideLeftIn ||
        animateType == RouterAnimate.SlideRightIn ||
        animateType == RouterAnimate.SlideTopIn ||
        animateType == RouterAnimate.SlideBottomIn) {
      Offset begin;
      Offset end;
      if (animateType == RouterAnimate.SlideLeftIn) {
        begin = Offset(-1.0, 0.0);
        end = Offset(0.0, 0.0);
      } else if (animateType == RouterAnimate.SlideRightIn) {
        begin = Offset(1.0, 0.0);
        end = Offset(0.0, 0.0);
      } else if (animateType == RouterAnimate.SlideTopIn) {
        begin = Offset(0.0, -1.0);
        end = Offset(0.0, 0.0);
      } else {
        begin = Offset(0.0, 1.0);
        end = Offset(0.0, 0.0);
      }

      return SlideTransition(
        position: Tween<Offset>(begin: begin, end: end).animate(
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
        child: w,
      );
    }

    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: w,
    );
  }

  static Future _handle(
    BuildContext context,
    Widget w, {
    Object? arguments,
    required RouterAnimate animateType,
  }) {
    return Navigator.push(
        context,
        PageRouteBuilder(
            settings: RouteSettings(
              arguments: arguments,
            ),
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation secondaryAnimation) {
              return _getAnimatedWidget(animateType, animation, w);
            }));
  }
}
