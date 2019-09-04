import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/customerappbar/customer_app_bar.dart';
import 'package:firewood/playground/pageviews/page_view_demo.dart';
import 'package:firewood/screens/groups/group_pageview_section.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:flutter/material.dart';

import 'groups/group_my_discuss_section.dart';
import 'groups/group_my_joined_section.dart';

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
      body: ListView(
        children: <Widget>[
          // todo 顶部卡片部分的内容展示
          GroupPageViewSection(),
          Divider(
            height: SizeCompat.pxToDp(20.0),
            color: Colors.red,
          ),
          // todo 我加入的部分的内容展示
          MyJoinedSection(),
          // todo 小组套路部分内容展示
          MyGroupDiscussSection(),
        ],
      ),
    );
  }
}
