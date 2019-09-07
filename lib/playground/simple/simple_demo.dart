import 'package:firewood/entity/pair_entity.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/simple/simple_dash_divider_demo.dart';
import 'package:firewood/playground/simple/simple_font_demo.dart';
import 'package:firewood/playground/simple/simple_icon_font_demo.dart';
import 'package:firewood/playground/simple/simple_text_shadow_demo.dart';
import 'package:firewood/widgets/banner/banner.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:flutter/material.dart';

class SimpleDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: ActionBarWidget("SimpleDemo"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              getItem(context, "DashDividerDemo", DashDividerDemo()),
              getItem(context, "TextShadowDemo", TextShadowDemo()),
              getItem(context, "IconFontDemo", IconFontDemo()),
              getItem(context, "FontDemo", FontDemo()),
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
