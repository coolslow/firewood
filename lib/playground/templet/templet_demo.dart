import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';


class TempletDemoPage extends StatefulWidget {
  @override
  _TempletDemoState createState() => new _TempletDemoState();
}

class _TempletDemoState extends State<TempletDemoPage> {
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
            ActionBarWidget(""),
            getBody(context)
          ],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      child: new Text("templet"),
    );
  }
}
