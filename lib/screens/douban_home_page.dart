import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:firewood/widgets/navigation/tab_bar.dart';
import 'package:flutter/material.dart';

import 'douban_home_dynamic_page.dart';
import 'douban_home_recommend_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FTabBarData> tabData;
  int currentIndex = 0;

  @override
  void initState() {
    tabData = new List();
    tabData.add(FTabBarData("动态"));
    tabData.add(FTabBarData("推荐"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double padding = SizeCompat.px(390);

    return new MaterialApp(
      home: new Scaffold(
          body: Column(
        children: <Widget>[
          FActionSearchBar(searchHint: "村里那个古怪的人", unReadCount: 9),
          Container(
              height: SizeCompat.px(106),
              padding: EdgeInsets.only(left: padding, right: padding),
              width: double.infinity,
              child: FTabBar(tabData: tabData, callback: _onTap)),
          Expanded(
            child: PageView.builder(
              onPageChanged: _pageChange,
//              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return DynamicPage();
                } else {
                  return RecommendPage();
                }
              },
              itemCount: tabData.length,
            ),
          ),
        ],
      )),
    );
  }

  var _pageController = new PageController(initialPage: 0);

  void _onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
