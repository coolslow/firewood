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
              getItem(context, "CircleAvatarDemoPage", CircleAvatarDemoPage()),
              getItem(context, "IconFontDemo", IconFontDemo()),
              getItem(context, "FontDemo", FontDemo()),
              getItem(context, "TransformDemo", TransformDemo()),
              getHeroItem(context, "HeroDemo", HeroDemo()),
              getItem(context, "ToastDemoPage", ToastDemoPage()),
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

  Widget getHeroItem(BuildContext context, String title, Widget w) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
            onTap: () {
//              clickDemo(context, w);
              Navigator.push(context, PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation<double> animation,
                      Animation secondaryAnimation) {
                return new FadeTransition(
                  opacity: animation,
                  child: w,
                );
              }));
            },
            child: ListTile(
              leading: Hero(
                tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                child: CircleAvatar(
                  radius: SizeCompat.pxToDp(40),
                  backgroundImage: NetworkImage(
                      "https://img3.doubanio.com/icon/up180055214-15.jpg"),
                ),
              ),
              title: Text(title),
            )),
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
