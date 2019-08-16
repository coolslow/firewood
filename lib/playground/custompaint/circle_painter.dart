

import 'package:flutter/widgets.dart';

class CirclePaintView extends CustomPainter{

  final red = Color.fromRGBO(255, 0, 0, 1);
  final blue = Color.fromRGBO(0, 0, 255, 1);

  @override
  void paint(Canvas canvas, Size size) {


    print("paint====");
    final paint = Paint();
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    // 注意这一句
    canvas.clipRect(rect);
    paint.color = blue;
    canvas.drawRect(rect, paint);
    paint.color = red;
    canvas.drawCircle(Offset.zero, size.height, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}