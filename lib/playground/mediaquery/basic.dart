import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

///
/// 实践 MediaQueryData 类中的方法，flutter 中获取屏幕尺寸及相关信息
///

class MediaQueryDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    var _height = data.size.height;
    var _width = data.size.width;
    var _devicePixelRatio = data.devicePixelRatio;
    var _disableAnimations = data.disableAnimations;
    var _hashCode = data.hashCode;

    return Scaffold(
      body: Column(
        children: <Widget>[
          ActionBarWidget("MediaQuery相关数据"),
          Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  'MediaQueryData 数据展示',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("屏幕尺寸： $_width(宽) x $_height(高)"),
                    ),
                    ListTile(
                      title: Text("像素密度：$_devicePixelRatio"),
                    ),
                    ListTile(
                      title: Text("是否禁用动画：$_disableAnimations"),
                    ),
                    ListTile(
                      title: Text("Hash Code：$_hashCode"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
