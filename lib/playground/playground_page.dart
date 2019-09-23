import 'package:firewood/playground/animate/animate_demo.dart';
import 'package:firewood/playground/banner/banner_demo.dart';
import 'package:firewood/playground/bloc/bloc_demo.dart';
import 'package:firewood/playground/camera/camera_demo.dart';
import 'package:firewood/playground/dialog/dialog_demo.dart';
import 'package:firewood/playground/http/http_demo.dart';
import 'package:firewood/playground/listviews/list_demo.dart';
import 'package:firewood/playground/mediaquery/basic.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/pageviews/page_view_demo.dart';
import 'package:firewood/playground/popupmenu/popup_meun_demo.dart';
import 'package:firewood/playground/simple/circle_avatar_demo.dart';
import 'package:firewood/playground/simple/simple_dash_divider_demo.dart';
import 'package:firewood/playground/simple/simple_font_demo.dart';
import 'package:firewood/playground/simple/simple_icon_font_demo.dart';
import 'package:firewood/playground/simple/simple_text_shadow_demo.dart';
import 'package:firewood/playground/simple/toast_demo.dart';
import 'package:firewood/playground/simple/transform_demo.dart';
import 'package:firewood/playground/sliver/sliver_demo.dart';
import 'package:firewood/playground/ticker/ticker_demo.dart';
import 'package:firewood/playground/touch/pointer_event_demo.dart';
import 'package:firewood/playground/util/fitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circleprogress/circle_progress_bar_demo.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("Demo"),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        FItem.getItem(context, "文字阴影", TextShadowDemo()),
        FItem.getItem(context, "圆角图片", CircleAvatarDemoPage()),
        FItem.getItem(context, "图文混排", IconFontDemo()),
        FItem.getItem(context, "字体", FontDemo()),
        FItem.getItem(context, "3D", TransformDemo()),
        FItem.getItem(context, "平台提示", ToastDemoPage()),
        FItem.getItem(context, "Sliver滑动", SliverDemoPage()),
        FItem.getItem(context, "轮播图", BannerDemoPage()),
        FItem.getItem(context, "进度条", CircleProgressBarDemoPage()),
        FItem.getItem(context, "导航菜单", PopupMenuDemoPage()),
        FItem.getItem(context, "列表", ListDemoPage()),
        FItem.getItem(context, "页级列表", PageViewDemoPage()),
        FItem.getItem(context, "定时器", TickerDemoPage()),
        FItem.getItem(context, "手势", PointerEventDemo()),
        FItem.getItem(context, "动画", AnimateDemoPage()),
        FItem.getItem(context, "媒体", CameraDemoPage()),
        FItem.getItem(context, "状态管理", BlocDemoPage()),
        FItem.getItem(context, "网络服务", HttpDemoPage()),
        FItem.getItem(context, "加载", DialogDemoPage()),
        FItem.getItem(context, "分割线", DashDividerDemo()),
        FItem.getItem(context, "MediaQuery", MediaQueryDataScreen()),
      ])),
    );
  }
}
