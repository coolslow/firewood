import 'dart:io';

import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FSafeArea extends StatelessWidget {

  final Widget child;
  final Color color;

  FSafeArea(this.child, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return child;
    } else if (Platform.isIOS) {
      return Column(
        children: <Widget>[
          Expanded(child: child),
          Container(
            color: color,
            height: SizeCompat.bottom / 2,
            width: double.infinity,
          )
        ],
      );
    }
    // 其他平台兼容，返回空页面
    return Container();
  }
}
