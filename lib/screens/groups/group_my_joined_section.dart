import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/screens/groups/common/section_header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyJoinedSection extends StatefulWidget {
  @override
  _MyJoinedSectionState createState() => new _MyJoinedSectionState();
}

class _MyJoinedSectionState extends State<MyJoinedSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // ListTile()
      margin: EdgeInsets.symmetric(vertical: 1.0),
      height: 80.0,
      child: Column(
        children: <Widget>[
          SectionHeaderWidget(
            title: Text(
              '主标题',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeCompat.pxToDp(50.0),
              ),
            ),
            subTitle: Text(
              '副标题',
              style: TextStyle(
                fontSize: SizeCompat.pxToDp(30.0),
              ),
            ),
            icon: Container(
              child: Text('icon'),
            ),
          ),
        ],
      ),
    );
  }
}
