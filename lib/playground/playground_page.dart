import 'package:camera/camera.dart';
import 'package:firewood/playground/banner/banner_demo.dart';
import 'package:firewood/playground/bloc/bloc_demo.dart';
import 'package:firewood/playground/dialog/dialog_demo.dart';
import 'package:firewood/playground/http/http_demo.dart';
import 'package:firewood/playground/listviews/list_demo.dart';
import 'package:firewood/playground/mediaquery/basic.dart';
import 'package:firewood/playground/pageviews/page_view_demo.dart';
import 'package:firewood/playground/popupmenu/popup_meun_demo.dart';
import 'package:firewood/playground/simple/circle_avatar_demo.dart';
import 'package:firewood/playground/simple/hero_demo.dart';
import 'package:firewood/playground/simple/simple_dash_divider_demo.dart';
import 'package:firewood/playground/simple/simple_demo.dart';
import 'package:firewood/playground/simple/simple_font_demo.dart';
import 'package:firewood/playground/simple/simple_icon_font_demo.dart';
import 'package:firewood/playground/simple/simple_text_shadow_demo.dart';
import 'package:firewood/playground/simple/toast_demo.dart';
import 'package:firewood/playground/simple/transform_demo.dart';
import 'package:firewood/playground/sliver/sliver_demo.dart';
import 'package:firewood/playground/templet/templet_demo.dart';
import 'package:firewood/playground/ticker/ticker_demo.dart';
import 'package:firewood/playground/touch/pointer_event_demo.dart';
import 'package:firewood/playground/touch/touch_demo.dart';
import 'package:firewood/widgets/log/release_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chess/chess_demo.dart';
import 'circleprogress/circle_progress_bar_demo.dart';
import 'custompaint/custom_paint_demo.dart';

class PlaygroundPage extends StatefulWidget {
  @override
  _PlaygroundPageState createState() => new _PlaygroundPageState();

// final CameraDescription cameraDescription;

// const PlaygroundPage({
//   Key key,
//   @required this.cameraDescription,
// }) : super(key: key);
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  final CameraDescription cameraDescription = CameraDescription();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          getActionbar(context, "Demo"),
          Expanded(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
//              getItem(context, "", SimpleDemoPage()),
              getItem(context, "文字阴影", TextShadowDemo()),
              getItem(context, "圆角图片", CircleAvatarDemoPage()),
              getItem(context, "图文混排", IconFontDemo()),
              getItem(context, "字体", FontDemo()),
              getItem(context, "3D", TransformDemo()),

//              getHeroItem(context, "HeroDemo", HeroDemo()),
              getItem(context, "平台提示", ToastDemoPage()),
              getItem(context, "Sliver滑动", SliverDemoPage()),

              getItem(context, "轮播图", BannerDemoPage()),
              getItem(context, "进度条", CircleProgressBarDemoPage()),
              getItem(context, "导航菜单", PopupMenuDemoPage()),
              getItem(context, "列表", ListDemoPage()),
              getItem(context, "页级列表", PageViewDemoPage()),
              getItem(context, "定时器", TickerDemoPage()),

              getItem(context, "手势", PointerEventDemo()),
//              getItem(context, "TempletDemo", TempletDemoPage()),
              getItem(context, "状态管理", BlocDemoPage()),
              getItem(context, "网络服务", HttpDemoPage()),
//              getItem(context, "CustomPaintDemo", CustomPaintDemoPage()),
//              getItem(context, "ChessDemo", ChessDemoPage()),
//              getItem(context, "手势", TouchDemoPage()),
              getItem(context, "加载", DialogDemoPage()),
              getItem(context, "分割线", DashDividerDemo()),
              getItem(context, "MediaQuery", MediaQueryDataScreen()),
//              getItem(context, "LogDemoPage", LogPage()),
            ])),
          )
        ],
      ),
    );
  }

  Widget getActionbar(BuildContext context, String title) {
    var statusbarHeight = MediaQuery.of(context).padding.top; //
    return Container(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(
          minWidth: double.maxFinite, minHeight: 58 + statusbarHeight),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      padding: EdgeInsets.fromLTRB(16.0, statusbarHeight, 0.0, 0),
      child: Center(
          child: Text(title,
              style: new TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: TextDecoration.none))),
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
                decoration: BoxDecoration(color: Colors.white),
                child: Text(title))),
        Container(
          color: Colors.grey,
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
