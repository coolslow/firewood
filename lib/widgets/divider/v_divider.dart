import 'package:flutter/widgets.dart';

class FVDivider extends StatelessWidget {
  final double height;
  final double indent;
  final double endIndent;
  final Color color;

  const FVDivider({
    Key key,
    this.height = 16.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsetsDirectional.only(start: indent, end: endIndent),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
