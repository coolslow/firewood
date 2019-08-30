import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/utils/size_compat.dart';
import 'screens/douban_main_page.dart';

void main() {

  runApp(MyApp());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 防止横屏变形
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: DouBan(),
    );
  }
}

class DouBan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeCompat.init(context, 1080);

    if (Platform.isAndroid) {
      return MainPage();
    } else if (Platform.isIOS) {
      return Column(
        children: <Widget>[
          Expanded(child: MainPage()),
          Container(
            color: Colors.white,
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
