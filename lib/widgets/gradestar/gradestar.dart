import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class GradeStart extends StatelessWidget {
  final double score;
  final int total;
  final IconData iconData = Icons.star;
  Color selectColor = Colors.redAccent;
  Color unSelectColor = Colors.grey;
  double size = 5;

  GradeStart(this.score, this.total, {this.size,this.selectColor,this.unSelectColor});

  @override
  Widget build(BuildContext context) {
    return Row(children: _getGradeStar(score, total));
  }

  List<Widget> _getGradeStar(double score, int total) {
    List<Widget> _list = List<Widget>();

    for (var i = 0; i < total; i++) {
      double factor = (score - i);
      if (factor >= 1) {
        factor = 1.0;
      } else if (factor < 0) {
        factor = 0;
      }
      Stack stack = Stack(
        children: <Widget>[
          Icon(
            iconData,
            color: unSelectColor,
            size: size,
          ),
          ClipRect(
              child: Align(
            alignment: Alignment.topLeft,
            widthFactor: factor,
            child: Icon(
              iconData,
              color: selectColor,
              size: size,
            ),
          ))
        ],
      );
      _list.add(stack);
    }
    return _list;
  }
}
