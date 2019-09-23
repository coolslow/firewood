import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/toast/toast.dart';
import 'package:flutter/material.dart';

class AdvanceAnimateDemoPage extends StatefulWidget {
  @override
  _AdvanceAnimateDemoPageState createState() =>
      new _AdvanceAnimateDemoPageState();
}

class _AdvanceAnimateDemoPageState extends State<AdvanceAnimateDemoPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  Animation<int> animation;
  Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    animation = IntTween(begin: 0, end: 255).animate(controller);

    controller2 = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this)
      ..addListener(() {
        print(
            "Controller2 addListener = ${controller2.value}     ${animation2.value}     ${controller2.isAnimating}");
      });
    animation2 = controller2.view;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("Animate高级用法"),
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
                  controller.forward();
                },
              ),
              FlatButton(
                child: Text("反转"),
                onPressed: () {
                  print("反转动画");
                  controller.reverse();
                },
              ),
              FlatButton(
                child: Text("停止"),
                onPressed: () {
                  controller.stop();
                  print("停止动画");
                },
              ),
              FlatButton(
                child: Text("重置"),
                onPressed: () {
                  controller.reset();
                  print("重置动画");
                },
              ),
            ]),
            Row(children: <Widget>[
              FlatButton(
                child: Text("fling"),
                onPressed: () {
                  controller.fling(velocity: 2);
                },
              ),
              FlatButton(
                child: Text("animateTo"),
                onPressed: () {
                  controller.animateTo(1);
                },
              ),
              FlatButton(
                child: Text("C2 forward"),
                onPressed: () {
                  controller2.forward();
                },
              ),
              FlatButton(
                child: Text("C2 reset"),
                onPressed: () {
                  controller2.reset();
                },
              ),
            ]),
            getBody(context),
          ],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    print("build");
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        print("Animated build  value=${animation.value.toDouble()}");
        return Container(
            margin: EdgeInsets.only(left: animation.value.toDouble()),
            child: child);
      },
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
        child: Center(
            child: new Text(
          "Animate",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }
}
