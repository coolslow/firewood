import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/material.dart';

import 'circle_painter.dart';


class CustomPaintDemoPage extends StatefulWidget {
  @override
  _CustomPaintDemoState createState() => new _CustomPaintDemoState();
}

class _CustomPaintDemoState extends State<CustomPaintDemoPage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("CustomPaintDemo"),
            getBody(context)
          ],
        ),
      ),
    );
  }


  Widget getBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: CustomPaint(
          painter: CirclePaintView(),
          size: Size(300, 200),
        )),
      ],
    );
  }
}
