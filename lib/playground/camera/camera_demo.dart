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
import 'package:firewood/playground/util/fitem.dart';
import 'package:firewood/playground/util/frouter.dart';
import 'package:flutter/material.dart';

class CameraDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: ActionBarWidget("相机"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FItem.getItem(context, "DashDividerDemo", DashDividerDemo()),
            ],
          ),
        ));
  }
}
