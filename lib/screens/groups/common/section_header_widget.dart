import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final Widget icon;

  const SectionHeaderWidget({
    required this.title,
    required this.subTitle,
    required this.icon,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.blueAccent),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          this.title,
          Row(
            children: <Widget>[
              this.subTitle,
              this.icon,
            ],
          )
        ],
      ),
    );
  }
}
