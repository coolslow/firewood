import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/material.dart';

import 'chess_controller.dart';
import 'layer_background.dart';
import 'layer_chess.dart';

class ChessDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("ChessDemo"),
            getBody(context)
          ],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    ChessController chessController = ChessController(size: w, boardSize: 19);
    return Container(
        child: Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          textDirection: TextDirection.ltr,
          fit: StackFit.expand,
          children: <Widget>[
            LayerBackground(chessController),
            LayerChess(chessController),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.grey,
              child: FlatButton(
                  onPressed: () {
                    chessController.regret();
                  },
                  child: Text("悔棋")),
            )),
            Container(width: 1, color: Colors.white),
            Expanded(
                child: Container(
              color: Colors.grey,
              child: FlatButton(
                  onPressed: () {
                    chessController.chart();
                  },
                  child: Text("棋谱")),
            )),
          ],
        ),
      ),
    ]));
  }
}
