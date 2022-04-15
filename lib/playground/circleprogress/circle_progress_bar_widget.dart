import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'circle_progress_painter.dart';

class CircleProgressBarWidget extends StatefulWidget {
  final double progress;
  final bool supportGesture;
  final bool startAnim;
  final ValueChanged<double> callback;

  CircleProgressBarWidget(this.progress,
      {this.supportGesture = false, required this.callback, this.startAnim = true});

  @override
  _CircleProgressBarState createState() {
//    print(
//        "ProgressBarWidget createState  ${describeIdentity(this)}   _state=$state ");
    return _CircleProgressBarState();
  }
}

class _CircleProgressBarState extends State<CircleProgressBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  GlobalKey _globalKey = GlobalKey();
  late CircleProgressPainterView painterView;
  double currProgress = 0;

  @override
  void initState() {
    super.initState();
    print("ProgressBarWidget======>initState ${this}}");
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    startTo();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
//    print("ProgressBarWidget======>didChangeDependencies ${this}}");
  }

  void didUpdateWidget(CircleProgressBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
//    print("ProgressBarWidget======>didUpdateWidget ${this}}  currWidget=${describeIdentity(widget)}  oldWidget=${describeIdentity(oldWidget)}");
    startTo();
  }

  void _progressListener() {
    if (widget.callback != null) {
      widget.callback(currProgress);
    }
  }

  @override
  Widget build(BuildContext context) {
//    print(
//        "ProgressBarWidget======>build    ${controller.toString()}        ${this}");

    print("===ProgressBarWidget build ");

    var width = MediaQuery.of(context).size.width; //

//    Future.delayed(Duration(milliseconds: 300), () {
//      print(
//          "ProgressBarWidget======Future delayed after build   ${this}");
//    });

    painterView = CircleProgressPainterView(currProgress);

    return Container(
        color: Colors.white,
        child: GestureDetector(
            onPanStart: (DragStartDetails details) {},
            onPanUpdate: (DragUpdateDetails details) {
              update(details);
            },
            onPanEnd: (DragEndDetails details) {},
            child: CustomPaint(
              key: _globalKey,
              painter: painterView,
              size: Size(width, width),
            )));
  }

  void update(DragUpdateDetails details) {
    if (!widget.supportGesture) {
      return;
    }

    RenderBox getBox = _globalKey.currentContext!.findRenderObject() as RenderBox;
    Offset local = getBox.globalToLocal(details.globalPosition);
    bool isValid = painterView.checkValidTouch(local);
    if (isValid) {
      currProgress = painterView.updataProgress(local);
      _progressListener();
      setState(() {});
    }
  }

  void startTo() {

    if(!widget.startAnim){
      return;
    }
    double progress = widget.progress;

    if (progress < 0) {
      progress = 0;
    }
    if (progress > 1) {
      progress = 1;
    }

    currProgress = progress;
//    print(
//        "startTo ${controller.toString()}    $progress    State=${describeIdentity(this)}");

    animation = Tween(begin: 0.0, end: currProgress).animate(controller);
    animation.addListener(() {
      currProgress = animation.value;
      _progressListener();
      setState(() {});
    });

    controller.reset();
    controller.forward();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
