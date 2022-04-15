import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class FBottomNavigationBar extends StatefulWidget {
  List<FBottomData> bottomData;
  late ValueChanged<int> callback;
  late TextStyle selectTs;
  late TextStyle unSelectTs;
  final Color selectBg;

  final Color unSelectBg;

  int currIndex;

  FBottomNavigationBar(
      {required this.bottomData,
      required this.callback,
      required this.selectTs,
      required this.unSelectTs,
      this.selectBg = Colors.white,
      this.unSelectBg = Colors.white,
      this.currIndex = 0}) {
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
  @override
  void initState() {
    super.initState();
  }

  void notify(int index) {
    if (widget.currIndex != index) {
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
          ),
        ),
      ],
    );
  }

  List<Widget> getBar(List<FBottomData> data) {
    List<Widget> body = <Widget>[];
    if (data != null && data.length > 0) {
      for (int i = 0; i < data.length; i++) {
        Widget item = Expanded(
          child: GestureDetector(
            onTap: () {
              notify(i);
              setState(() {
                widget.currIndex = i;
              });
            },
            child: Container(
              color:
                  widget.currIndex == i ? widget.selectBg : widget.unSelectBg,
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
                      child: widget.currIndex == i
                          ? data[i].selectIcon
                          : data[i].unSelectIcon,
                    ),
                    Container(
                      height: SizeCompat.pxToDp(40),
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: Text(
                        data[i].title,
                        style: widget.currIndex == i
                            ? widget.selectTs
                            : widget.unSelectTs,
                      ),
                    ),
                  ]),
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
  String title = "";

  late Widget selectIcon;
  late Widget unSelectIcon;

  late Widget page;

  FBottomData(
      {required this.page,
      required this.title,
      required this.selectIcon,
      required this.unSelectIcon});
}
