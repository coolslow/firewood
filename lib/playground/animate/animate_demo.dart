import 'package:firewood/playground/animate/advance_animate_demo.dart';
import 'package:firewood/playground/animate/animated_builder_demo.dart';
import 'package:firewood/playground/animate/animated_widget_demo.dart';
import 'package:firewood/playground/animate/simple_animate_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fitem.dart';
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
              FItem.getItem(context, "Animate基本使用", SimpleAnimateDemoPage()),
              FItem.getItem(
                  context, "AnimatedWidget动画", AnimatedWidgetDemoPage()),
              FItem.getItem(
                  context, "AnimatedBuilder动画", AnimatedBuilderDemoPage()),
              FItem.getItem(context, "Animate高级用法", AdvanceAnimateDemoPage()),
            ],
          ),
        ));
  }
}
