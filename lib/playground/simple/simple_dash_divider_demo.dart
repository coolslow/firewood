import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:flutter/material.dart';

class DashDividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("分割线"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            width: double.infinity,
            child: DashedDivider(
              direction: Axis.horizontal,
              color: Colors.red,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            width: 200,
            child: DashedDivider(
              solidWidth: 8,
              color: Colors.green,
              direction: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 100,
            width: 10,
            child: DashedDivider(
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: DashedDivider(
//              solidWidth: 8,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
