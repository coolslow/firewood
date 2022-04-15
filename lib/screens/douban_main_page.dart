import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/playground_page.dart';
import 'package:firewood/screens/home/douban_home_page.dart';
import 'package:firewood/screens/subject/douban_subject_page.dart';
import 'package:firewood/widgets/navigation/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'douban_group_page.dart';
import 'douban_market_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  late List<FBottomData> bottomData;
  List<Widget> pages = <Widget>[];
  int currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);

    bottomData = [];

    bottomData.add(FBottomData(
      title: "首页",
      page: HomePage(),
      selectIcon: Image.asset("images/ic_tab_home_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_home_normal.png"),
    ));
    bottomData.add(FBottomData(
      title: "书影音",
      page: SubjectPage(),
      selectIcon: Image.asset("images/ic_tab_subject_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_subject_normal.png"),
    ));
    // bottomData.add(FBottomData(
    //   title: "小组",
    //   page: GroupPage(),
    //   selectIcon: Image.asset("images/ic_tab_group_active.png"),
    //   unSelectIcon: Image.asset("images/ic_tab_group_normal.png"),
    // ));
    // bottomData.add(FBottomData(
    //   title: "市集",
    //   page: MarketPage(),
    //   selectIcon: Image.asset("images/ic_tab_shiji_active.png"),
    //   unSelectIcon: Image.asset("images/ic_tab_shiji_normal.png"),
    // ));
    bottomData.add(FBottomData(
      title: "我的",
//      page: ProfilePage(),
      page: PlaygroundPage(),
      selectIcon: Image.asset("images/ic_tab_profile_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_profile_normal.png"),
    ));
  }

  void onPageChange(val) {
//    setState(() {
//      currentIndex = val;
//    });
    currentIndex = val;
    _pageController.jumpToPage(currentIndex);
  }

  Widget getBody() {
//    pages.clear();
////    for (int i = 0; i < bottomData.length; i++) {
////      pages.add(Offstage(
////        offstage: currentIndex == i ? false : true,
////        child: bottomData[i].page,
////      ));
////    }
////
////    Stack stack = Stack(
////      children: pages,
////    );
////    return stack;

//    if (currentIndex == 0) {
//      return HomePage();
//    } else if (currentIndex == 1) {
//      return SubjectPage();
//    } else if (currentIndex == 2) {
//      return GroupPage();
//    } else if (currentIndex == 3) {
//      return MarketPage();
//    } else if (currentIndex == 4) {
//      return PlaygroundPage();
//    } else {
//      return Container();
//    }

    return PageView.builder(
//              onPageChanged: _pageChange,
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return bottomData[index].page;
      },
      itemCount: bottomData.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: getBody(),
        ),
        Container(
          height: SizeCompat.pxToDp(126),
          color: Colors.white,
          child: FBottomNavigationBar(
            currIndex: currentIndex,
            bottomData: bottomData,
            callback: onPageChange,
            selectTs: TextStyle(
                color: Color(0xff42BD56),
                fontSize: SizeCompat.pxToDp(30),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w200),
            unSelectTs: TextStyle(
                color: Color(0xffa6a6a6),
                fontSize: SizeCompat.pxToDp(30),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w200),
          ),
        ),
//        Container(
//          height: SizeCompat.pxToDp(20),
//          child: null,
//        )
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
