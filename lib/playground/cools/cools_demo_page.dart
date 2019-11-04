import 'package:firewood/playground/chess/chess_demo.dart';
import 'package:firewood/playground/cools/clip_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("Demo"),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        FItem.getItem(context, "Chess", ChessDemoPage()),
        FItem.getItem(context, "ClipImage", ClipDemoPage()),
      ])),
    );
  }
}
