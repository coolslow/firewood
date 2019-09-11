import 'package:firewood/common/font.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class FontDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("字体"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "系统字体",
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "ModakRegular字体",
              style: TextStyle(
                  fontFamily: FFontModakRegular.family,
                  color: Colors.red,
                  fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "ShadowsIntoLight-Regular字体",
              style: TextStyle(
                  fontFamily: FFontShadowsIntoLightRegular.family,
                  color: Colors.greenAccent,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
