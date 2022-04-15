import 'package:firewood/playground/util/frouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FItem {
  ///
  static Widget getItem(BuildContext context, String title, Widget? w) {
    return Column(
      children: <Widget>[
        TextButton(
            // padding: EdgeInsets.all(0.0),
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft),
            onPressed: () {
              FRouter.to(context, w);
            },
            child: Container(
                width: double.infinity,
                height: 45.0,
                padding: EdgeInsets.all(13.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(title))),
        Container(
          color: Colors.grey,
          height: 0.5,
        ),
      ],
    );
  }

  static Widget getItemCallback(BuildContext context, String title, Widget? w,
      {required VoidCallback onPressed}) {
    return Column(
      children: <Widget>[
        FlatButton(
            padding: EdgeInsets.all(0.0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              if (onPressed != null) {
                onPressed();
                return;
              }
              FRouter.to(context, w);
            },
            child: Container(
                width: double.infinity,
                height: 45.0,
                padding: EdgeInsets.all(13.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Text(title))),
        Container(
          color: Colors.grey,
          height: 0.5,
        ),
      ],
    );
  }
}
