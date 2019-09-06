import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FHDivider extends StatelessWidget {
  final double width;
  final double indent;
  final double endIndent;
  final Color color;

  const FHDivider({
    Key key,
    this.width = 16.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
