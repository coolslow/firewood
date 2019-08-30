import 'package:firewood/playground/dialog/progress_dialog_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/dialog/loading_dialog.dart';
import 'package:flutter/material.dart';

class DialogDemoPage extends StatefulWidget {
  @override
  _DialogDemoState createState() => new _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

//    LoadingDialog.show(context);

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget(""),
            FlatButton(
              onPressed: () {
                show();
              },
              child: Container(
                  height: 40,
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  child: Center(
                      child: Text("show with barrierDismissible is true"))),
            ),
            FlatButton(
              onPressed: () {
                hide();
              },
              child: Container(
                  height: 40,
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  child: Center(child: Text("hide"))),
            ),
            FlatButton(
              onPressed: () {
                show2();
              },
              child: Container(
                  height: 40,
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  child: Center(
                      child: Text("show with barrierDismissible is false"))),
            ),
          ],
        ),
      ),
    );
  }

  void show() {
    LoadingDialog.show(context);
    Future.delayed(Duration(seconds: 5)).then((int) {
      LoadingDialog.hide(context);
    });
  }

  void show2() {
    LoadingDialog.show(context, barrierDismissible: false);
    Future.delayed(Duration(seconds: 5)).then((int) {
      LoadingDialog.hide(context);
    });
  }

  void hide() {
    LoadingDialog.hide(context);

  }
}
