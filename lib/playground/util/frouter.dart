import 'package:flutter/widgets.dart';

class FRouter {
  static void to(BuildContext context, Widget? w) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation secondaryAnimation) =>
                SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                  child: w,
                )));
  }
}
