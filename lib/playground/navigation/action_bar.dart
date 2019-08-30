import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  final String title;

  ActionBarWidget(this.title);

  @override
  Widget build(BuildContext context) {
    var statusbarHeight = MediaQuery.of(context).padding.top; //
//    var statusbarHeight = 0.0; //
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: statusbarHeight),
            constraints: BoxConstraints(
                minWidth: double.maxFinite, minHeight: 48 + statusbarHeight),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
//          padding: EdgeInsets.fromLTRB(16.0, statusbarHeight, 0.0, 0),
            child: Stack(children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "images/ic_arrow_back.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              Center(
                child: new Text(title,
                    style: new TextStyle(
                        fontSize: 18,
                        color: FColor.textMajor,
                        decoration: TextDecoration.none)),
              ),
            ]))
      ],
    );
  }
}
