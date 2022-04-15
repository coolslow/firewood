import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class FTabBar extends StatefulWidget {
  List<FTabBarData> tabData = [];
  int currIndex = 0;
  late ValueChanged<int> callback;
  late TextStyle selectTs;
  late TextStyle unSelectTs;

  FTabBar(
      {required this.tabData,
      this.currIndex = 0,
      required this.callback,
      required this.selectTs,
      required this.unSelectTs});

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
    List<Widget> body = <Widget>[];
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
                    width: SizeCompat.pxToDp(120),
                    color: widget.currIndex == i
                        ? widget.selectTs.color
                        : Colors.white,
                    // child: Center(
                    //   child: Text(data[i].title,
                    //       style: widget.currIndex == i
                    //           ? widget.selectTs
                    //           : widget.unSelectTs),
                    // ),
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
