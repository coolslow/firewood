import 'package:firewood/playground/listviews/list_grid_demo.dart';
import 'package:firewood/playground/listviews/list_hor_demo.dart';
import 'package:firewood/playground/listviews/list_ver_demo.dart';
import 'package:firewood/playground/listviews/refresh_list_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fitem.dart';
import 'package:flutter/material.dart';

// deprecated zhl
class ListDemoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionBarWidget("列表"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FItem.getItem(context, "垂直列表", ListVerDemoPage()),
            FItem.getItem(context, "水平列表", ListHorDemoPage()),
            FItem.getItem(context, "九宫格", ListGridDemoPage()),
            FItem.getItem(context, "下拉刷新", RefreshListDemoPage()),
          ],
        ),
      ),
    );
  }
}
