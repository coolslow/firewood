import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleProgressPainterView extends CustomPainter {
  double currentProgress = 90;
  Offset center;

  double radiusOffset; // 边距
  double ringWidth; //` ring宽度
  double outRadius; // 外半径
  double inRadius; // 内半径
  double ringRadius;

  Color startColor = Color(0xFFFF9E80);
  Color endColor = Colors.deepOrange;

  bool supportDot = false;

  final ringPaint = Paint();
  final progressPaint = Paint();
  final dotPaint = Paint();

  CircleProgressPainterView(double currentProgress) {
    this.currentProgress = currentProgress * 360;
//    this.currentProgress = 0.7 * 360;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _init(canvas, size);
    _drawRing(canvas);
    _drawProgress(canvas);
    _drawDot(canvas);
//    _drawStandardLine(canvas);
  }

  void _init(Canvas canvas, Size size) {
    center = Offset(size.width / 2.0, size.width / 2.0);

    radiusOffset = 10.0;
    ringWidth = 40.0;
    outRadius = center.dx - radiusOffset;
    inRadius = outRadius - ringWidth;
    ringRadius = inRadius + ringWidth / 2;

    ringPaint
      ..isAntiAlias = true
      ..color = startColor
      ..style = PaintingStyle.stroke;
//      ..strokeWidth = ringWidth
//      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    progressPaint
      ..isAntiAlias = true
      ..color = endColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = ringWidth;

    dotPaint..isAntiAlias = true;
  }

  void _drawRing(Canvas canvas) {
    Path path = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: center, radius: outRadius)),
      Path()..addOval(Rect.fromCircle(center: center, radius: inRadius)),
    );

    canvas.drawShadow(path, Colors.grey, 1.5, false);
    ringPaint
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = ringWidth;
//    canvas.drawPath(path, ringPaint);

    canvas.drawCircle(center, ringRadius, ringPaint);
  }

  void _drawProgress(Canvas canvas) {
    Rect rect = Rect.fromCircle(center: center, radius: ringRadius);
    double startAngle = degToRad(0);
    double sweepAngle = degToRad(currentProgress);
    if (sweepAngle <= 0) {
      return;
    }

//    Gradient gradient = new SweepGradient(
//      startAngle: startAngle,
//      endAngle: sweepAngle,
//      colors: [
//        startColor,
//        endColor,
//      ],
//    );
//    progressPaint.shader = gradient.createShader(rect);

    canvas.save();
    canvas.translate(0, center.dx * 2);
    canvas.rotate(degToRad(-90));
    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
    canvas.restore();
  }

  void _drawDot(Canvas canvas) {
    double radius = ringWidth / 2 + radiusOffset / 2;

    Offset c = Offset(
      center.dx + sin(degToRad(currentProgress)) * ringRadius,
      center.dy - cos(degToRad(currentProgress)) * ringRadius,
    );

    if (supportDot) {
      Path ringPath = Path.combine(
        PathOperation.difference,
        Path()..addOval(Rect.fromCircle(center: center, radius: outRadius)),
        Path()..addOval(Rect.fromCircle(center: center, radius: inRadius)),
      );
      Path dotPath = Path()
        ..addOval(Rect.fromCircle(center: c, radius: radius));
      Path path = Path.combine(PathOperation.intersect, ringPath, dotPath);

      dotPaint
        ..color = Colors.white
        ..isAntiAlias = true
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, dotPaint);

      dotPaint
        ..color = endColor
        ..isAntiAlias = true
        ..style = PaintingStyle.fill;
      canvas.drawCircle(c, ringWidth / 2, dotPaint);
    } else {
      dotPaint
        ..color = endColor
        ..isAntiAlias = true
        ..style = PaintingStyle.fill;
      canvas.drawCircle(c, ringWidth / 2, dotPaint);
    }
  }

//  void _drawStandardLine(Canvas canvas) {
//    var paint = Paint()
//      ..color = Colors.grey
//      ..strokeWidth = 0.5;
//
//    canvas.drawLine(
//        Offset(center.dx, 0), Offset(center.dx, center.dy * 2), paint);
//    canvas.drawLine(
//        Offset(0, center.dy), Offset(center.dx * 2, center.dy), paint);
//
//    canvas.drawLine(
//        Offset(center.dx, center.dy), Offset(center.dx * 2, 0), paint);
//  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degToRad(double deg) => deg * (pi / 180.0);

  double radToDeg(double rad) => rad * (180.0 / pi);

  bool checkValidTouch(Offset pointer) {
    double px = center.dx + sin(degToRad(currentProgress)) * ringRadius;
    double py = center.dy - cos(degToRad(currentProgress)) * ringRadius;
    Rect validArea = Rect.fromCircle(center: Offset(px, py), radius: ringWidth);
    return validArea.contains(pointer);
  }

  double updataProgress(Offset pointer) {
    double rad = atan2(pointer.dx - center.dx, center.dy - pointer.dy);
    if (rad <= 0) {
      rad = 2 * pi - rad.abs();
    }
    return radToDeg(rad) / 360;
  }
}

//ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
//  textAlign: TextAlign.center,
//  fontWeight: FontWeight.w600,
//  fontStyle: FontStyle.normal,
//  fontSize: 18,
//))
//  ..pushStyle(ui.TextStyle(color: Colors.blue))
//  ..addText(
//      'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。');
//ParagraphConstraints pc = ParagraphConstraints(width: Screen.width - 60);
//Paragraph paragraph = pb.build()..layout(pc);
//canvas.drawParagraph(paragraph, Offset(30, 30));
