import 'package:flutter/material.dart';

class ProgressDialogDemo extends Dialog {

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Color(0x99ffffff),
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
              ],
            )),
      );

  }
}
