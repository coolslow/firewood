import 'package:firewood/common/font.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/sliver/sliver_app_bar_demo.dart';
import 'package:firewood/playground/sliver/sliver_grid_demo.dart';
import 'package:firewood/playground/sliver/sliver_list_demo.dart';
import 'package:firewood/playground/sliver/sliver_mix_demo.dart';
import 'package:firewood/playground/sliver/sliver_persistent_header_demo.dart';
import 'package:firewood/playground/sliver/sliver_to_box_adapter_demo.dart';
import 'package:firewood/playground/util/fitem.dart';
import 'package:flutter/material.dart';

class SliverDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: ActionBarWidget("SliverDemo"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FItem.getItem(context, "AppBar滑动", SliverAppBarDemoPage()),
              FItem.getItem(context, "List滑动", SliverListDemoPage()),
              FItem.getItem(context, "Grid滑动", SliverGridDemoPage()),
              FItem.getItem(context, "Mix滑动", SliverMixDemoPage()),
              FItem.getItem(
                  context, "PersistentHeader滑动", SliverPersistentHeaderDemo()),
              FItem.getItem(context, "BoxAdapter滑动", SliverToBoxAdapterDemo()),
            ],
          ),
        ));
  }
}
