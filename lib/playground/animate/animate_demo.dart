import 'package:firewood/playground/animate/advance_animate_demo.dart';
import 'package:firewood/playground/animate/animated_builder_demo.dart';
import 'package:firewood/playground/animate/animated_widget_demo.dart';
import 'package:firewood/playground/animate/simple_animate_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimateDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: ActionBarWidget("动画"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              getItem(context, "Animate基本使用", SimpleAnimateDemoPage()),
              getItem(context, "AnimatedWidget动画", AnimatedWidgetDemoPage()),
              getItem(context, "AnimatedBuilder动画", AnimatedBuilderDemoPage()),
              getItem(context, "Animate高级用法", AdvanceAnimateDemoPage()),
            ],
          ),
        ));
  }

  Widget getItem(BuildContext context, String title, Widget w) {
    return Column(
      children: <Widget>[
        FlatButton(
            padding: EdgeInsets.all(0.0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              clickDemo(context, w);
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

  void clickDemo(BuildContext context, Widget w) {
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
