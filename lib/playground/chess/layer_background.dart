import 'package:flutter/material.dart';

import 'chess_controller.dart';



class LayerBackground extends StatelessWidget {

  final ChessController chessController;

  LayerBackground(this.chessController);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LayerBackgroundPaint(chessController),
      size: Size(chessController.size, chessController.size),
    );
  }
}


class _LayerBackgroundPaint extends CustomPainter {
  ChessController chessController;

  // 路数
  _LayerBackgroundPaint(this.chessController);

  Paint _paintBg = Paint()
    ..color = Colors.yellow //画笔颜色
    ..strokeWidth = 15.0;

  Paint _paintLine = Paint()..color = Colors.black;

  final String character = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  void paint(Canvas canvas, Size size) {
    _drawLayerBackground(canvas);
    _drawLayerLines(canvas);
    _drawTextAnchor(canvas);
    _drawPlaceholder(canvas);
  }

  void _drawLayerBackground(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTRB(0, 0, chessController.size, chessController.size),
        _paintBg);
  }

  void _drawLayerLines(Canvas canvas) {
    for (int i = 0; i < chessController.boardSize; i++) {
      canvas.drawLine(
          Offset(chessController.xOffset,
              chessController.yOffset + i * chessController.tileSize),
          Offset(chessController.size - chessController.xOffset,
              chessController.yOffset + i * chessController.tileSize),
          _paintLine);

      canvas.drawLine(
          Offset(chessController.xOffset + i * chessController.tileSize,
              chessController.yOffset),
          Offset(chessController.xOffset + i * chessController.tileSize,
              chessController.size - chessController.yOffset),
          _paintLine);
    }
  }

  void _drawTextAnchor(Canvas canvas) {
    for (int i = 0; i < chessController.boardSize; i++) {
      TextSpan textSpanX = TextSpan(
          style: TextStyle(
              color: Colors.black, fontSize: chessController.tileSize * 2 / 5),
          text: character[i]);

      TextPainter textPainterX =
      TextPainter(text: textSpanX, textDirection: TextDirection.ltr);

      textPainterX.layout();
      textPainterX.paint(
          canvas,
          Offset(
              chessController.tileSize * i +
                  chessController.xOffset -
                  textPainterX.width / 2,
              (chessController.yOffset - textPainterX.height) / 2));

//
      TextSpan textSpanY = TextSpan(
          style: TextStyle(
              color: Colors.black, fontSize: chessController.tileSize * 2 / 5),
          text: (i + 1).toString());

      TextPainter textPainterY =
      TextPainter(text: textSpanY, textDirection: TextDirection.ltr);

      textPainterY.layout();
      textPainterY.paint(
          canvas,
          Offset(
              (chessController.xOffset - textPainterY.width) / 2,
              (chessController.tileSize * i +
                  chessController.yOffset -
                  textPainterY.height / 2)));
    }
  }


  void _drawPlaceholder(Canvas canvas) {
    double radius = chessController.tileSize * 1 / 6;
    List<Offset> placeholders = _getPlaceholder();
    placeholders.forEach((Offset offset) {
      canvas.drawCircle(offset, radius, _paintLine);
    });
  }

  List<Offset> _getPlaceholder() {
    List<Offset> data = List<Offset>();
    int referencePoint = 2;
    if (chessController.boardSize <= 12) {
      referencePoint = 2;
    } else if (chessController.boardSize <= 15) {
      referencePoint = 3;
    } else {
      referencePoint = 4;
    }

    data.add(Offset(
        chessController.xOffset + referencePoint * chessController.tileSize,
        chessController.yOffset + referencePoint * chessController.tileSize));
    data.add(Offset(
        chessController.xOffset +
            (chessController.boardSize - referencePoint - 1) *
                chessController.tileSize,
        chessController.yOffset + referencePoint * chessController.tileSize));

    data.add(Offset(
        chessController.xOffset + referencePoint * chessController.tileSize,
        chessController.yOffset +
            (chessController.boardSize - referencePoint - 1) *
                chessController.tileSize));
    data.add(Offset(
        chessController.xOffset +
            (chessController.boardSize - referencePoint - 1) *
                chessController.tileSize,
        chessController.yOffset +
            (chessController.boardSize - referencePoint - 1) *
                chessController.tileSize));
    return data;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}