import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FIndicator extends StatefulWidget {
  // 选中指示器颜色
  final Color selectedColor;

  // 未选中指示器颜色
  final Color unSelectedColor;

  // 指示器数量
  final int indicatorCount;

  // 指示器大小
  final double size;

  final double margin = 2;

  //
  final int current;

  final int maxCount = 4;

  FIndicator(
      {this.selectedColor = Colors.greenAccent,
      this.unSelectedColor = Colors.grey,
      this.indicatorCount = 0,
      this.size = 5,
      this.current = 0});

  @override
  State<StatefulWidget> createState() {
    return _FIndicatorState();
  }
}

class _FIndicatorState extends State<FIndicator> {
  ScrollController mController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(FIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    mController.animateTo(widget.current * (widget.size + widget.margin),
        duration: new Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.size + widget.margin * 2) * widget.maxCount,
      child: ListView.builder(
          controller: mController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.indicatorCount,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin:
                  EdgeInsets.only(left: widget.margin, right: widget.margin),
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.current == index
                    ? widget.selectedColor
                    : widget.unSelectedColor,
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    mController?.dispose();
    super.dispose();
  }
}
