import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/screens/subject/douban_subject_citywide_page.dart';
import 'package:firewood/screens/subject/douban_subject_fiction_page.dart';
import 'package:firewood/screens/subject/douban_subject_move_page.dart';
import 'package:firewood/screens/subject/douban_subject_music_page.dart';
import 'package:firewood/screens/subject/douban_subject_read_page.dart';
import 'package:firewood/screens/subject/douban_subject_teleplay_page.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:firewood/widgets/navigation/tab_bar.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List<FTabBarData> tabData = List<FTabBarData>();
  List<Widget> widgetData = List<Widget>();
  int currentIndex = 1;

  PageController _pageController;

  @override
  void initState() {
    tabData.add(FTabBarData("电影"));
    tabData.add(FTabBarData("电视"));
    tabData.add(FTabBarData("读书"));
    tabData.add(FTabBarData("原创小说"));
    tabData.add(FTabBarData("音乐"));
    tabData.add(FTabBarData("同城"));

    widgetData.add(MovePage());
    widgetData.add(TeleplayPage());
    widgetData.add(ReadPage());
    widgetData.add(FictionPage());
    widgetData.add(MusicPage());
    widgetData.add(CityWidePage());

    _pageController = PageController(initialPage: currentIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FActionSearchBar(
              searchHint: "电影票房小组",
              bgColor: Colors.white,
              connerBgColor: Color(0xffF4F4F4),
              unReadCount: 9,
              mailColor: FColors.iconColorFilter),
          // TabBar
          Container(
              height: SizeCompat.pxToDp(106),
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
                right: SizeCompat.pxToDp(Dimens.appEdgeEdge),
              ),
              child: FTabBar(
                tabData: tabData,
                currIndex: currentIndex,
                callback: _onTap,
                unSelectTs: TextStyle(
                    color: Color(0xff818181),
                    fontSize: SizeCompat.pxToDp(40),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
                selectTs: TextStyle(
                    color: Color(0xff121212),
                    fontSize: SizeCompat.pxToDp(40),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
              )),
          Container(
            height: SizeCompat.pxToDp(2),
            color: Color(0xffEBEBEB),
          ),
          Expanded(
            child: PageView.builder(
//              onPageChanged: _pageChange,
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return widgetData[index];
              },
              itemCount: tabData.length,
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
