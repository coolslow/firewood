import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:flutter/material.dart';

class DashDividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget(""),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            width: double.infinity,
            child: DashedDivider(
              horizontal: true,
            ),
          ),
          Expanded(
              child: Container(
            width: 10,
            child: DashedDivider(),
          ))
        ],
      ),
    );
  }
}

