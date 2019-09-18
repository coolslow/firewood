import 'dart:async';

import 'package:firewood/bloc/recommend/recommend_data_bloc.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/routers/router_animate.dart';
import 'package:firewood/routers/router_table.dart';
import 'package:firewood/screens/home/douban_home_dynamic_page.dart';
import 'package:firewood/screens/home/douban_home_recommend_page.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:firewood/widgets/navigation/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<FTabBarData> tabData;
  int currentIndex = 1;
  PageController _pageController;

  StreamController<int> _stream = StreamController<int>();

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);

    tabData = new List();
    tabData.add(FTabBarData("动态"));
    tabData.add(FTabBarData("推荐"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double padding = SizeCompat.pxToDp(390);

    return new Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          RouterTable.handle(context, RouterTable.COMPOSE,
              animateType: RouterAnimate.SlideLeftIn);
        },
        child: Container(
          alignment: Alignment.center,
          height: SizeCompat.pxToDp(130),
          width: SizeCompat.pxToDp(130),
          decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0x33cdcdcd),
                  offset: Offset(3, 3),
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                ),
              ],
              color: Color(0xff494949),
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeCompat.pxToDp(65)))),
          child: Image.asset(
            "images/ic_compose.png",
            width: SizeCompat.pxToDp(60),
            height: SizeCompat.pxToDp(60),
            color: Colors.white,
            colorBlendMode: BlendMode.srcATop,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          FActionSearchBar(searchHint: "村里那个古怪的人", unReadCount: 9),
          Container(
              height: SizeCompat.pxToDp(106),
              color: Colors.white,
              padding: EdgeInsets.only(left: padding, right: padding),
              width: double.infinity,
              child: StreamBuilder(
                  stream: _stream.stream,
                  initialData: currentIndex,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return FTabBar(
                        tabData: tabData,
                        currIndex: snapshot.data,
                        callback: _onTap);
                  })),
          Container(
            height: SizeCompat.pxToDp(2),
            color: Color(0xffEBEBEB),
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: _pageChange,
//              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return DynamicPage();
                } else {
                  return BlocProvider(
                    builder: (BuildContext context) {
                      return RecommendDataBloc()
                        ..dispatch(RecommendFetchEvent());
                    },
                    child: RecommendPage(),
                  );
                }
              },
              itemCount: tabData.length,
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _stream?.close();
    super.dispose();
  }

  void _pageChange(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      _stream.sink.add(currentIndex);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
