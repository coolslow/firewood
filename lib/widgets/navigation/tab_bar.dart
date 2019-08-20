import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FTabBar extends StatefulWidget {
  final List<FTabBarData> tabData;
  final int currIndex;
  final ValueChanged<int> callback;
  final TextStyle selectTs;
  final TextStyle unSelectTs;

  FTabBar(
      {@required this.tabData,this.currIndex=0, this.callback, this.selectTs, this.unSelectTs});

  @override
  State<StatefulWidget> createState() {
    return _FTabBarState();
  }
}

class _FTabBarState extends State<FTabBar> {
  var currIndex = 0;

  var selectTs = new TextStyle(
      color: Color(0xff42BD56),
      fontSize: SizeCompat.px(40),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w700);
  var unSelectTs = new TextStyle(
      color: Color(0xff959595),
      fontSize: SizeCompat.px(40),
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w200);

  @override
  void initState() {
    if (widget.selectTs != null) {
      selectTs = widget.selectTs;
    }
    if (widget.unSelectTs != null) {
      unSelectTs = widget.unSelectTs;
    }
    currIndex = widget.currIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(FTabBar oldWidget) {
    currIndex = widget.currIndex;
    super.didUpdateWidget(oldWidget);
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getBar(widget.tabData),
    );
  }

  List<Widget> getBar(List<FTabBarData> data) {
    List<Widget> body = List<Widget>();
    if (data != null && data.length > 0) {
      for (int i = 0; i < data.length; i++) {
        Widget item = Container(
          child: GestureDetector(
            onTap: () {
              if (currIndex != i) {
                notify(i);
                setState(() {
                  currIndex = i;
                });
              }
            },
            child: Stack(children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(data[i].title,
                        style: currIndex == i ? selectTs : unSelectTs),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: SizeCompat.px(6),
                    color: currIndex == i ? selectTs.color : Colors.white,
                    child: Center(
                      child: Text(data[i].title,
                          style: currIndex == i ? selectTs : unSelectTs),
                    ),
                  ))
//        )
            ]),
          ),
        );

        body.add(item);
      }
    }
    return body;
  }
}

class FTabBarData {
  String title;

  FTabBarData(this.title);
}
