import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class FBottomNavigationBar extends StatefulWidget {
  final List<FBottomData> bottomData;
  final ValueChanged<int> callback;
  TextStyle selectTs;
  TextStyle unSelectTs;
  final Color selectBg;

  final Color unSelectBg;

  FBottomNavigationBar(
      {@required this.bottomData,
      this.callback,
      this.selectTs,
      this.unSelectTs,
      this.selectBg = Colors.white,
      this.unSelectBg = Colors.white}) {
    if (selectTs == null) {
      this.selectTs = TextStyle(
          color: Color(0xff42BD56),
          fontSize: SizeCompat.pxToDp(30),
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w200);
    }

    if (unSelectTs == null) {
      this.unSelectTs = TextStyle(
          color: Color(0xffa6a6a6),
          fontSize: SizeCompat.pxToDp(30),
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w200);
    }
  }

  @override
  State<FBottomNavigationBar> createState() {
    return _FBottomNavigationBarState();
  }
}

class _FBottomNavigationBarState extends State<FBottomNavigationBar> {
  var currIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void notify(int index) {
    if (currIndex != index) {
      if (widget.callback != null) {
        widget.callback(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 0.5,
          color: Color(0xfff0f0f0),
        ),
        Container(
            child: Row(
          children: getBar(widget.bottomData),
        ))
      ],
    );
  }

  List<Widget> getBar(List<FBottomData> data) {
    List<Widget> body = List<Widget>();
    if (data != null && data.length > 0) {
      for (int i = 0; i < data.length; i++) {
        Widget item = Expanded(
          child: GestureDetector(
            onTap: () {
              notify(i);
              setState(() {
                currIndex = i;
              });
            },
            child: Container(
              color: currIndex == i ? widget.selectBg : widget.unSelectBg,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      width: SizeCompat.pxToDp(64),
                      height: SizeCompat.pxToDp(64),
                      margin: EdgeInsets.only(
                        top: SizeCompat.pxToDp(6),
                      ),
                      child: currIndex == i
                          ? data[i].selectIcon
                          : data[i].unSelectIcon,
                    ),
                    Container(
                      height: SizeCompat.pxToDp(40),
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Text(
                        data[i].title,
                        style: currIndex == i
                            ? widget.selectTs
                            : widget.unSelectTs,
                      ),
                    ),
                  ]),
//                  Positioned(
//                    right: 15,
//                    top: 5,
//                    child: Container(
//                      padding: const EdgeInsets.fromLTRB(3.0, 1.0, 3.0, 1.0),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.horizontal(
//                              left: Radius.elliptical(8.0, 8.0),
//                              right: Radius.elliptical(8.0, 8.0)),
//                          color: Color(0xFFFF0000)),
//                      child: Text("3",
//                          style: new TextStyle(
//                              color: Color(0xFFffffff),
//                              fontSize: 8,
//                              decoration: TextDecoration.none)),
//                    ),
//                  ),
                ],
              ),
            ),
          ),
          flex: 1,
        );
        body.add(item);
      }
    }

    return body;
  }
}

class FBottomData {
  String title;

  Widget selectIcon;
  Widget unSelectIcon;

  Widget page;

  FBottomData({this.page, this.title, this.selectIcon, this.unSelectIcon});
}
