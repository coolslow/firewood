import 'package:firewood/common/constants.dart';
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
      body: Column(
        children: <Widget>[
          FActionSearchBar(
              searchHint: "日剧小组",
              bgColor: Colors.white,
              connerBgColor: Color(0xffF4F4F4),
              mailColor: FColors.iconColorFilter,
              unReadCount: 2),
        ],
      ),
    );
  }
}
