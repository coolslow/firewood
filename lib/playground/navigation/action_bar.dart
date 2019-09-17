import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActionBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  ActionBarWidget(this.title);

  @override
  Widget build(BuildContext context) {
    var statusbarHeight = MediaQuery.of(context).padding.top; //
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: statusbarHeight),
            constraints: BoxConstraints(
                minWidth: double.maxFinite,
                minHeight: SizeCompat.pxToDp(130) + statusbarHeight),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
//          padding: EdgeInsets.fromLTRB(16.0, statusbarHeight, 0.0, 0),
            child: Stack(children: <Widget>[
              GestureDetector(
                onTap: () async {
                  bool canPop = Navigator.of(context).canPop();
                  if (!canPop) {
                    SystemNavigator.pop();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "images/ic_arrow_back.png",
                    width: 20,
                    height: 20,
                    color: Colors.white,
                    colorBlendMode: BlendMode.srcATop,
                  ),
                ),
              ),
              Center(
                child: new Text(title,
                    style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none)),
              ),
            ]))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeCompat.pxToDp(130));
}
