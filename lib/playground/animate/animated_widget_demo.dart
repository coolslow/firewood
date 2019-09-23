import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/toast/toast.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetDemoPage extends StatefulWidget {
  @override
  _AnimatedWidgetDemoPageState createState() =>
      new _AnimatedWidgetDemoPageState();
}

class _AnimatedWidgetDemoPageState extends State<AnimatedWidgetDemoPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    animation = IntTween(begin: 0, end: 255).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
        } else if (status == AnimationStatus.dismissed) {}
        print("AnimationStatus=$status");
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("AnimatedWidget动画"),
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
            getBody(context),
          ],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return AnimatedContainer(
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedContainer extends AnimatedWidget {
  AnimatedContainer({Key key, Animation<int> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<int> animation = listenable;

    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      margin: EdgeInsets.only(left: animation.value.toDouble()),
      child: Center(
          child: new Text(
        "Animate",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
