import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ToastDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("Toast"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                click1();
              },
              child: Container(
                  height: 40,
                  color: Colors.deepOrangeAccent,
                  width: double.maxFinite,
                  child: Center(
                      child: Text(
                    "Toast Center",
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
            FlatButton(
              onPressed: () {
                click2();
              },
              child: Container(
                  height: 40,
                  color: Colors.deepOrangeAccent,
                  width: double.maxFinite,
                  child: Center(
                      child: Text(
                    "Toast Bottom",
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
          ],
        ),
      ),
    );
  }

  void click1() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast with center",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void click2() {
    Fluttertoast.showToast(
        msg: "This is Center Long Toast with bottom ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
