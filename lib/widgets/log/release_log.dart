import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class LogPage extends StatelessWidget {
  static void jump(BuildContext context, {int delay: 0}) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LogPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget(""),
            Center(
              child: new Text(
                "${Utils.getReleaseLog()}",
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
