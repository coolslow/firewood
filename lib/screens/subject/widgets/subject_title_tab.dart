import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/widgets/navigation/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SubjectTitleTab extends StatefulWidget {
  List<String> tabs;
  String more;
  double fontSize;

  double horSpace;
  double verSpace;

  SubjectTitleTab(this.tabs, this.more,
      {this.fontSize = 50.0, this.horSpace = 100, this.verSpace = 50});

  @override
  State<StatefulWidget> createState() {
    return _SubjectTitleTabState();
  }
}

class _SubjectTitleTabState extends State<SubjectTitleTab> {
  PageController _pageController;
  int currentIndex = 0;
  List<Widget> widgetData = List<Widget>();
  List<FTabBarData> tabData = List<FTabBarData>();

  double initWidth;
  double initHeight;

  @override
  void initState() {
    double letterCount = 0;

    if (widget.tabs != null) {
      widget.tabs.forEach((String source) {
        tabData.add(FTabBarData(source));
        letterCount += source.length;
      });
    }

    initWidth =
        letterCount * widget.fontSize + tabData.length  * widget.horSpace +SizeCompat.pxToDp(Dimens.appEdgeEdge) *2;
    initHeight = widget.fontSize + widget.verSpace * 2;

    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
//              height: SizeCompat.pxToDp(150),
              color: Colors.white,
//              width: SizeCompat.pxToDp(516),
              width: SizeCompat.pxToDp(initWidth),
              height: SizeCompat.pxToDp(initHeight),
              padding: EdgeInsets.only(
                left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
                right: SizeCompat.pxToDp(Dimens.appEdgeEdge),
              ),
              child: FTabBar(
                tabData: tabData,
                currIndex: currentIndex,
                callback: _onTap,
                unSelectTs: TextStyle(
                    color: Color(0xff848484),
                    fontSize: SizeCompat.pxToDp(widget.fontSize),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
                selectTs: TextStyle(
                    color: Color(0xff191919),
                    fontSize: SizeCompat.pxToDp(widget.fontSize),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            getMore(),
          ]),
      Container(
        height: SizeCompat.pxToDp(2),
        color: Color(0xffEBEBEB),
      )
    ]);
  }

  void _onTap(int index) {
//    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  getMore() {
    if (widget.more == null || widget.more == "") {
      return Container();
    } else {
      return Row(
        children: <Widget>[
          Text(
            widget.more,
            style: TextStyle(
                color: Color(0xff191919),
                fontSize: SizeCompat.pxToDp(36),
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: SizeCompat.pxToDp(Dimens.appEdgeEdge)),
            child: Image.asset(
              "images/ic_arrow_forward.png",
              width: SizeCompat.pxToDp(36),
              height: SizeCompat.pxToDp(36),
              color: Color(0xff191919),
              colorBlendMode: BlendMode.srcATop,
            ),
          )
        ],
      );
    }
  }
}
