import 'package:firewood/playground/listviews/list_grid_demo.dart';
import 'package:firewood/playground/listviews/list_hor_demo.dart';
import 'package:firewood/playground/listviews/list_ver_demo.dart';
import 'package:firewood/playground/listviews/refresh_list_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class ListDemoPage extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusbarHeight = MediaQuery.of(context).padding.top; //

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("列表"),
            FlatButton(
              onPressed: () {
                jump(ListVerDemoPage());
              },
              child: Container(
                  height: 40,
                  color: Colors.deepOrangeAccent,
                  width: double.maxFinite,
                  child: Center(child: Text("垂直列表"))),
            ),
            FlatButton(
              onPressed: () {
                jump(ListHorDemoPage());
              },
              child: Container(
                  height: 40,
                  color: Colors.deepOrangeAccent,
                  width: double.maxFinite,
                  child: Center(child: Text("水平列表"))),
            ),
            FlatButton(
              onPressed: () {
                jump(ListGridDemoPage());
              },
              child: Container(
                  height: 40,
                  color: Colors.deepOrangeAccent,
                  width: double.maxFinite,
                  child: Center(child: Text("九宫格"))),
            ),
            FlatButton(
              onPressed: () {
                jump(RefreshListDemoPage());
              },
              child: Container(
                  height: 40,
                  color: Colors.deepOrangeAccent,
                  width: double.maxFinite,
                  child: Center(child: Text("下拉刷新"))),
            ),
//        ListGridDemoPage
          ],
        ),
      ),
    );
  }

  void jump(Widget w) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) =>
                SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                  child: w,
                )));
  }
}
