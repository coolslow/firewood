import 'dart:ui';

import 'package:meta/meta.dart';


class ChessController {
  //棋盘路数
  int boardSize = 10;

  //棋盘尺寸
  double size;

  //每个格子的尺寸
  late double tileSize;

  //左右第一条边线和边界的距离
  late double xOffset;

  //上下第一条边线和边界的距离
  late double yOffset;

  bool showChart = false;

  List<Offset> chessData = <Offset>[];

  ChessController({required this.size, required this.boardSize}) {

    tileSize = this.size / (boardSize + 1);
    xOffset = tileSize * 1;
    yOffset = tileSize * 1;
  }

  bool appendChess(Offset offset) {
    double dx = offset.dx;
    double dy = offset.dy;
    int countX = dx ~/ tileSize;
    double remainX = dx % tileSize;
    int countY = dy ~/ tileSize;
    double remainY = dy % tileSize;

    double targetX;
    if (remainX > tileSize / 2) {
      targetX = xOffset + ((countX) * tileSize);
    } else {
      targetX = xOffset + ((countX - 1) * tileSize);
    }
    double targetY;

    if (remainY > tileSize / 2) {
      targetY = xOffset + ((countY) * tileSize);
    } else {
      targetY = xOffset + ((countY - 1) * tileSize);
    }

    bool success = false;
    Offset standard = Offset(targetX, targetY);

    if (!chessData.contains(standard)) {
      chessData.add(standard);
      success = true;
    }
    return success;
  }

  Offset getChess(Offset offset) {
    double dx = offset.dx;
    double dy = offset.dy;

    int countX = dx ~/ tileSize;
    double remainX = dx % tileSize;
    int countY = dy ~/ tileSize;
    double remainY = dy % tileSize;

    double targetX;
    if (remainX > tileSize / 2) {
      targetX = xOffset + ((countX) * tileSize);
    } else {
      targetX = xOffset + ((countX - 1) * tileSize);
    }

    double targetY;
    if (remainY > tileSize / 2) {
      targetY = xOffset + ((countY) * tileSize);
    } else {
      targetY = xOffset + ((countY - 1) * tileSize);
    }

    Offset result = Offset(targetX, targetY);
    return result;
  }

  void regret(){
    if(chessData.isNotEmpty) {

//      mChessState.setState((){
//        chessData.removeLast();
//      });
      chessData.removeLast();
    }
  }
  void chart(){
    showChart = !showChart;
  }

}
