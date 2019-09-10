import 'package:firewood/common/font.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/sliver/sliver_app_bar_demo.dart';
import 'package:firewood/playground/sliver/sliver_grid_demo.dart';
import 'package:firewood/playground/sliver/sliver_list_demo.dart';
import 'package:firewood/playground/sliver/sliver_mix_demo.dart';
import 'package:firewood/playground/sliver/sliver_persistent_header_demo.dart';
import 'package:firewood/playground/sliver/sliver_to_box_adapter_demo.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class SliverDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: ActionBarWidget("SliverDemo"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              getItem(context, "SliverAppBarDemoPage", SliverAppBarDemoPage()),
              getItem(context, "SliverListDemoPage", SliverListDemoPage()),
              getItem(context, "SliverGridDemoPage", SliverGridDemoPage()),
              getItem(context, "SliverMixDemoPage", SliverMixDemoPage()),
              getItem(context, "SliverPersistentHeaderDemo",
                  SliverPersistentHeaderDemo()),
              getItem(
                  context, "SliverToBoxAdapterDemo", SliverToBoxAdapterDemo()),
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
