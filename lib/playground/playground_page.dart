import 'package:firewood/playground/pageviews/page_view_demo.dart';
import 'package:firewood/playground/templet_demo.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloc_demo.dart';
import 'chess/chess_demo.dart';
import 'circleavatar/circle_avatar_demo.dart';
import 'circleprogress/circle_progress_bar_demo.dart';
import 'custompaint/custom_paint_demo.dart';
import 'package:firewood/playground/http/http_demo.dart';
import 'list_demo.dart';
import 'package:firewood/playground/mediaquery/basic.dart';

class PlaygroundPage extends StatefulWidget {
  @override
  _PlaygroundPageState createState() => new _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getActionbar(context, "测试Demo"),
            getItem(context, "TempletDemo", TempletDemoPage()),
            getItem(context, "BlocDemo", BlocDemoPage()),
            getItem(context, "HttpDemo", HttpDemoPage()),
            getItem(context, "ListDemo", ListDemoPage()),
            getItem(context, "CustomPaintDemo", CustomPaintDemoPage()),
            getItem(context, "ChessDemo", ChessDemoPage()),
            getItem(
                context, "CircleProgressbarDemo", CircleProgressBarDemoPage()),
            getItem(context, "CircleAvatarDemo", CircleAvatarDemoPage()),
            getItem(context, "MediaQueryDataDemo", MediaQueryDataScreen()),
            getItem(context, "PageViewDemoPage", PageViewDemoPage()),
          ],
        ),
      ),
    );
  }

  Widget getActionbar(BuildContext context, String title) {
    var statusbarHeight = MediaQuery.of(context).padding.top; //
    return Container(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(
          minWidth: double.maxFinite, minHeight: 48 + statusbarHeight),
      decoration: BoxDecoration(
        color: FColor.appbarBg,
      ),
      padding: EdgeInsets.fromLTRB(16.0, statusbarHeight, 0.0, 0),
      child: new Text(title,
          style: new TextStyle(
              fontSize: 18,
              color: FColor.textMajor,
              decoration: TextDecoration.none)),
    );
  }

  Widget getItem(BuildContext context, String title, Widget w) {
    return Column(
      children: <Widget>[
        FlatButton(
            padding: EdgeInsets.all(0.0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              clickDemo(w);
            },
            child: Container(
                width: double.infinity,
                height: 45.0,
                padding: EdgeInsets.all(13.0),
                decoration: BoxDecoration(color: Color(0xff00ffff)),
                child: Text(title))),
        Container(
          color: Colors.blueGrey,
          height: 0.5,
        ),
      ],
    );
  }

  void clickDemo(Widget w) {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (BuildContext context) => w));

//    Navigator.push(
//        context, CupertinoPageRoute(builder: (BuildContext context) => w));

//    Routers.getRouterName("/home");
//    Navigator.of(context).pushNamed();

    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
//            transitionsBuilder: (BuildContext context,
//                    Animation<double> animation,
//                    Animation<double> secondaryAnimation,
//                    Widget child) =>
//                ScaleTransition(
//                  scale: Tween<double>(begin: 1.0, end: 1.5).animate(animation),
//                  child: child,
//                ),
            pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) =>
                SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                  child: w,
                )));

//    ScaleTransition
//    RotationTransition
//    SlideTransition
//    FadeTransition
  }
}
