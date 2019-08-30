import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/customerappbar/customer_app_bar.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => new _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: CustomAppbarWidget(
          key: UniqueKey(), height: 100.0, bgColor: Colors.black),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
