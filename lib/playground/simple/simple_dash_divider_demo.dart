import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:flutter/material.dart';

class DashDividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("分割线"),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            width: double.infinity,
            child: DashedDivider(
              horizontal: true,
              color: Colors.red,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            width: double.infinity,
            child: DashedDivider(
              solidWidth: 8,
              color: Colors.green,
              horizontal: true,
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 100,
              child: Row(
                children: <Widget>[
                  DashedDivider(
                    horizontal: false,
                    color: Colors.red,
                  ),
                ],
              )),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            color: Colors.blueGrey,
            child: DashedDivider(
//              solidWidth: 8,
              horizontal: false,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
