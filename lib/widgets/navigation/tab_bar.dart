import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class FTabBar extends StatefulWidget {

  final List<FTabBarData> tabData;
  int currIndex;
  final ValueChanged<int> callback;
  TextStyle selectTs;
  TextStyle unSelectTs;

  FTabBar(
      {@required this.tabData,
      this.currIndex = 0,
      this.callback,
      this.selectTs,
      this.unSelectTs}) {
    selectTs ??= TextStyle(
        color: Color(0xff42BD56),
        fontSize: SizeCompat.pxToDp(40),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w700);

    unSelectTs ??= TextStyle(
        color: Color(0xff959595),
        fontSize: SizeCompat.pxToDp(40),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w200);
  }

  @override
  State<StatefulWidget> createState() {
    return _FTabBarState();
  }
}

class _FTabBarState extends State<FTabBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(FTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
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
              if (widget.currIndex != i) {
                notify(i);
                setState(() {
                  widget.currIndex = i;
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
                        style: widget.currIndex == i
                            ? widget.selectTs
                            : widget.unSelectTs),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: SizeCompat.pxToDp(6),
                    color: widget.currIndex == i
                        ? widget.selectTs.color
                        : Colors.white,
                    child: Center(
                      child: Text(data[i].title,
                          style: widget.currIndex == i
                              ? widget.selectTs
                              : widget.unSelectTs),
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
