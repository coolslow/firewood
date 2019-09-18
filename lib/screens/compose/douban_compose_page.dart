import 'dart:async';

import 'package:firewood/bloc/recommend/recommend_data_bloc.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/dog.dart';
import 'package:firewood/screens/home/douban_home_dynamic_page.dart';
import 'package:firewood/screens/home/douban_home_recommend_page.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:firewood/widgets/navigation/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComposePage extends StatefulWidget {
  @override
  _ComposePageState createState() => new _ComposePageState();
}

class _ComposePageState extends State<ComposePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object queryParameters = ModalRoute.of(context).settings.arguments;
//    Dog queryParameters = ModalRoute.of(context).settings.arguments;

    print("QueryParameters=$queryParameters");

    return new Scaffold(
      appBar: AppBar(
        title: Text('编辑'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: SizeCompat.pxToDp(106),
            color: Colors.white,
            padding: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Text("$queryParameters"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: SizeCompat.pxToDp(106),
              color: Colors.white,
              padding: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: Text("返回上一页"),
            ),
          ),
        ],
      ),
    );
  }
}
