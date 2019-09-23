import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/toast/toast.dart';
import 'package:flutter/material.dart';

class SimpleAnimateDemoPage extends StatefulWidget {
  @override
  _SimpleAnimateDemoPageState createState() =>
      new _SimpleAnimateDemoPageState();
}

class _SimpleAnimateDemoPageState extends State<SimpleAnimateDemoPage>
    with TickerProviderStateMixin {
  AnimationController controller1;
  Animation<int> animation1;
  AnimationController controller2;
  Animation<int> animation2;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    animation1 = IntTween(begin: 0, end: 255).animate(controller1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
        } else if (status == AnimationStatus.dismissed) {}
        FToast.showLong("AnimationStatus=$status");
      });

    controller2 = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: controller2, curve: Curves.easeOutQuad);
    animation2 = IntTween(begin: 0, end: 255).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("简单动画"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              FlatButton(
                child: Text("开始"),
                onPressed: () {
                  print("开始动画");
                  controller1.forward();
                },
              ),
              FlatButton(
                child: Text("反转"),
                onPressed: () {
                  print("反转动画");
                  controller1.reverse();
                },
              ),
              FlatButton(
                child: Text("停止"),
                onPressed: () {
                  controller1.stop();
                  print("停止动画");
                },
              ),
              FlatButton(
                child: Text("重置"),
                onPressed: () {
                  controller1.reset();
                  print("重置动画");
                },
              ),
            ]),
            getBody1(context),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text("开始"),
                  onPressed: () {
                    print("开始动画");
                    controller2.forward();
                  },
                ),
                FlatButton(
                  child: Text("反转"),
                  onPressed: () {
                    print("反转动画");
                    controller2.reverse();
                  },
                ),
                FlatButton(
                  child: Text("停止"),
                  onPressed: () {
                    controller2.stop();
                    print("停止动画");
                  },
                ),
                FlatButton(
                  child: Text("重置"),
                  onPressed: () {
                    controller2.reset();
                    print("重置动画");
                  },
                ),
              ],
            ),
            getBody2(context),
          ],
        ),
      ),
    );
  }

  Widget getBody1(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      margin: EdgeInsets.only(left: animation1.value.toDouble()),
      child: Center(
          child: new Text(
        "Animate",
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  Widget getBody2(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      margin: EdgeInsets.only(left: animation2.value.toDouble()),
      child: Center(
          child: new Text(
        "Animate",
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
}
