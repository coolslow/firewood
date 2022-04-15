import 'package:firewood/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashedDivider extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double solidWidth;
  final double gapWidth;
  final double indent;
  final double endIndent;
  final Axis direction;

  DashedDivider({
//    this.color = Colors.transparent,
    this.color = FColors.divider,
    this.strokeWidth = 1,
    this.solidWidth = 2.0,
    this.gapWidth = 2.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: direction == Axis.horizontal
            ? EdgeInsets.only(left: indent, right: endIndent)
            : EdgeInsets.only(top: indent, bottom: endIndent),
        child: CustomPaint(
          painter: _DashRectPainter(direction,
              color: color,
              strokeWidth: strokeWidth,
              solidWidth: solidWidth,
              gapWidth: gapWidth),
        ));
  }
}

class _DashRectPainter extends CustomPainter {
  final double strokeWidth;
  final double gapWidth;
  final double solidWidth;
  final Color color;
  Axis direction = Axis.vertical;
  late Paint dashedPaint;

  _DashRectPainter(this.direction,
      {required this.strokeWidth,
      required this.solidWidth,
      required this.gapWidth,
      required this.color}) {
    dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print("size=$size");

    if (direction == Axis.horizontal) {
      drawHorizontal(canvas, size);
    } else {
      drawVertical(canvas, size);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void drawHorizontal(Canvas canvas, Size size) {
    Path path = Path();
    double distance = 0.0;
    while (size.width > distance) {
      path.moveTo(distance, 0);
      distance += solidWidth;
      path.lineTo(distance, 0);
      distance += gapWidth;
    }

    canvas.drawPath(path, dashedPaint);
  }

  void drawVertical(Canvas canvas, Size size) {
    Path path = Path();
    double distance = 0.0;
    while (size.height > distance) {
      path.moveTo(0, distance);
      distance += solidWidth;
      path.lineTo(0, distance);
      distance += gapWidth;
    }

    canvas.drawPath(path, dashedPaint);
  }
}
