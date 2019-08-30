import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class PopupMenuDemoPage extends StatefulWidget {
  @override
  _PopupMenuDemoState createState() => new _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemoPage> {
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
            ActionBarWidget("PopupMenu"),
            FlatButton(
              onPressed: () {
                click1();
              },
              child: Container(
                  height: 40,
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  child: Center(child: Text("Popup menu"))),
            ),
            FlatButton(
              onPressed: () {
                click2();
              },
              child: Container(
                  height: 40,
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  child: Center(child: Text("Toast long"))),
            ),
          ],
        ),
      ),
    );
  }

  void click1() async {
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(10.0, 90.0, 0.0, 0.0),
//    position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 10.0),
        items: <PopupMenuEntry<String>>[
          PopupMenuItem<String>(value: 'value01', child: new Text('Item One')),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(value: 'value02', child: new Text('Item Two')),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(
              value: 'value03', child: new Text('Item Three')),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(
              value: 'value04', child: new Text('I am Item Four')),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(
              value: 'value04', child: new Text('I am Item Four')),
        ]);
  }

  void click2() {}
}
