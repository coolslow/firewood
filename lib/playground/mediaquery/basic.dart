import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

///
/// 实践 MediaQueryData 类中的方法，flutter 中获取屏幕尺寸及相关信息
///

class MediaQueryDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ActionBarWidget("hello"),
      body: Column(
        children: <Widget>[
          ActionBarWidget("testing..."),
          Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                child: Text(
                  'MediaQueryData 数据展示',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
