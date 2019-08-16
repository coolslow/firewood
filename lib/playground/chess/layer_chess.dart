import 'package:flutter/material.dart';

import 'chess_controller.dart';


class LayerChess extends StatefulWidget {

  final ChessController chessController;

  LayerChess(this.chessController);

  @override
  State<StatefulWidget> createState() {
    return LayerChessState(chessController);
  }
}

class LayerChessState extends State<LayerChess> {
  ChessController chessController;

  LayerChessState(this.chessController);

  @override
  void initState() {
    super.initState();
  }

  GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        onClick(details);
      },
      child: CustomPaint(
        key: _key,
        painter: _LayerChessPaint(chessController),
        size: Size(w, w),
      ),
    );
  }

  void onClick(TapUpDetails details) {
    RenderBox box = _key.currentContext.findRenderObject();
    Offset localOffset = box.localToGlobal(Offset.zero);
    Offset offset = details.globalPosition - localOffset;
    bool success = chessController.appendChess(offset);

    if (success) {
      setState(() {});
    }
  }
}

class _LayerChessPaint extends CustomPainter {
  ChessController chessController;

  _LayerChessPaint(this.chessController);

  Paint _pBlack = Paint()..color = Colors.black;

  Paint _pWhite = Paint()..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    _drawLayerChess(canvas);
  }

  void _drawLayerChess(Canvas canvas) {
    List<Offset> data = chessController.chessData;
    if (data == null) {
      return;
    }
    double radius = chessController.tileSize / 2;

    for (int i = 0; i < data.length; i++) {
      Offset target = data[i];
      if (i % 2 == 0) {
        canvas.drawCircle(target, radius, _pBlack);
      } else {
        canvas.drawCircle(target, radius, _pWhite);
      }

      if (chessController.showChart) {
        TextSpan textSpan = TextSpan(
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: chessController.tileSize * 2 / 5),
            text: "${i + 1}");
        TextPainter textPainter =
            TextPainter(text: textSpan, textDirection: TextDirection.ltr);
        textPainter.layout();
        textPainter.paint(
            canvas,
            Offset(target.dx - textPainter.width / 2,
                target.dy - textPainter.height / 2)); //
      }
    }
  }

  @override
  bool shouldRepaint(_LayerChessPaint oldDelegate) {
//    if(oldDelegate.chessController.chessData.length == chessController.chessData.length){
//    if(oldDelegate == this){
//      print("==");
//      return false;
//    }else{
//      print("not ==");
//      return true;
//    }

     return true;
  }
}
