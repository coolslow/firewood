import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/divider/h_divider.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class PopupMenuDemoPage extends StatefulWidget {
  @override
  _PopupMenuDemoState createState() => new _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemoPage> {
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
            ActionBarWidget("PopupMenu菜单"),
            Container(
              child: FlatButton(
                onPressed: () {
                  click1();
                },
                child: Container(
                    height: 40,
                    color: Colors.deepOrangeAccent,
                    width: double.maxFinite,
                    child: Center(child: Text("Popup Menu文字菜单"))),
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  click2();
                },
                child: Container(
                    height: 40,
                    color: Colors.deepOrangeAccent,
                    width: double.maxFinite,
                    child: Center(child: Text("Popup Menu图文菜单"))),
              ),
            )
          ],
        ),
      ),
    );
  }

  void click1() async {
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(10.0, 90.0, 0.0, 0.0),
        items: <PopupMenuEntry<String>>[
          PopupMenuItem<String>(value: 'value01', child: new Text('分享')),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(value: 'value02', child: new Text('转发')),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(value: 'value03', child: new Text('点赞')),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(value: 'value04', child: new Text('评论')),
        ]);
    print("文字菜单 选中项=$result");
  }

  void click2() async {
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(10.0, 90.0, 0.0, 0.0),
        items: <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
              value: 'value01',
              child: Row(
                children: <Widget>[
                  Icon(Icons.share),
                  FHDivider(
                    width: 10,
                  ),
                  new Text('分享')
                ],
              )),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(
              value: 'value02',
              child: Row(
                children: <Widget>[
                  Icon(Icons.forward),
                  FHDivider(
                    width: 10,
                  ),
                  new Text('转发')
                ],
              )),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(
              value: 'value03',
              child: Row(
                children: <Widget>[
                  Icon(Icons.thumb_up),
                  FHDivider(
                    width: 10,
                  ),
                  new Text('点赞')
                ],
              )),
          PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(
              value: 'value04',
              child: Row(
                children: <Widget>[
                  Icon(Icons.comment),
                  FHDivider(
                    width: 10,
                  ),
                  new Text('评论')
                ],
              )),
        ]);
    print("文字菜单 Menu图文菜单=$result");
  }
}
