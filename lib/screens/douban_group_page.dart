import 'package:firewood/common/constants.dart';
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
      // appBar: CustomAppbarWidget(
      //     key: UniqueKey(), height: 46.0, bgColor: Colors.black),
      // appBar: AppBar(),
      appBar: FActionSearchBar(
        searchHint: "微单摄影同学会",
        bgColor: Colors.black,
        connerBgColor: Color(0xffF4F4F4),
        mailColor: FColors.iconColorFilter,
        unReadCount: 2,
      ),
      body: Column(
        children: <Widget>[
          // Container(
          // color: Colors.blue,
          // height: 10.0,
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 1.0),
            color: Colors.black,
            height: 120.0,
            child: ListView(
              padding: EdgeInsets.all(0.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 300.0,
                  // color: Colors.red,
                  child: Card(),
                ),
                Container(
                  width: 300.0,
                  // color: Colors.green,
                  child: Card(),
                ),
                Container(
                  width: 300.0,
                  // color: Colors.yellow,
                  child: Card(),
                ),
                Container(
                  width: 300.0,
                  // color: Colors.orange,
                  child: Card(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
