import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/simple/circle_avatar_demo.dart';
import 'package:firewood/playground/simple/hero_demo.dart';
import 'package:firewood/playground/simple/simple_dash_divider_demo.dart';
import 'package:firewood/playground/simple/simple_font_demo.dart';
import 'package:firewood/playground/simple/simple_icon_font_demo.dart';
import 'package:firewood/playground/simple/simple_text_shadow_demo.dart';
import 'package:firewood/playground/simple/toast_demo.dart';
import 'package:firewood/playground/simple/transform_demo.dart';
import 'package:firewood/playground/touch/pointer_event_demo.dart';
import 'package:flutter/material.dart';

class TouchDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: ActionBarWidget("TouchEventDemo"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              getItem(context, "PointerEventDemo", PointerEventDemo()),
            ],
          ),
        ));
  }

  Widget getItem(BuildContext context, String title, Widget w) {
    return Column(
      children: <Widget>[
        FlatButton(
            padding: EdgeInsets.all(0.0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              clickDemo(context, w);
            },
            child: Container(
                width: double.infinity,
                height: 45.0,
                padding: EdgeInsets.all(13.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(title))),
        Container(
          color: Colors.grey,
          height: 0.5,
        ),
      ],
    );
  }

  void clickDemo(BuildContext context, Widget w) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder: (BuildContext context, Animation animation,
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
