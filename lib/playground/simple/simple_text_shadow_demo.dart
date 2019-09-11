import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:flutter/material.dart';

class TextShadowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: ActionBarWidget("文字阴影"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 30,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "文字阴影  Text Shadow...",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff666666),
                          shadows: <Shadow>[
                            Shadow(
                                color: Colors.red,
                                offset: Offset(2, 2),
                                blurRadius: 2),
                            Shadow(
                                color: Colors.yellow,
                                offset: Offset(4, 4),
                                blurRadius: 2),
                          ]),
                    ),
                  )),
            ],
          ),
        ));
  }
}
