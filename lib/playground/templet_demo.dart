import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'navigation/action_bar.dart';

class TempletDemoPage extends StatefulWidget {
  @override
  _TempletDemoState createState() => new _TempletDemoState();
}

class _TempletDemoState extends State<TempletDemoPage> {
  @override
  void initState() {
    super.initState();

  }

//  void setStatusBar ()async{
//    await FlutterStatusbarcolor.setStatusBarColor(Colors.greenAccent);
//    if (useWhiteForeground(Colors.greenAccent)) {
//      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
//    } else {
//      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getActionbar(context, "TempletDemo"),
            getBody(context)
          ],
        ),
      ),
    );
  }

  Widget getActionbar(BuildContext context, String title) {
    return ActionBarWidget(title);
  }

  Widget getBody(BuildContext context) {
    return Container(
      child: new Text("templet"),
    );
  }
}
