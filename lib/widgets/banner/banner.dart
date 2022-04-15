import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/pair_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class FBanner extends StatefulWidget {
  List<Pair> data;
  double width;
  double ratio;
  BorderRadius borderRadius = BorderRadius.all(Radius.circular(0));
  EdgeInsets margin = EdgeInsets.all(0);
  EdgeInsets padding = EdgeInsets.all(0);

  double left = 0;
  double right = 0;
  double bottom = 0;
  double space = 10;
  double size  = 0;

  Color selectedColor;
  Color unSelectedColor;

  bool autoStart;

  Duration duration;
  FBannerAlignment alignment;

  BoxDecoration decoration = BoxDecoration(boxShadow: [
    BoxShadow(
        color: Color(0xFFBDBDBD), //Color(0xfff7f7f7)
        offset: Offset.zero,
        blurRadius: 0.0,
        spreadRadius: 0.0)
  ]);

  FBanner(this.data,
      {required this.ratio,
      required this.width,
      required this.size,
      required this.space,
      required this.alignment,
      required this.left,
      required this.right,
      required this.bottom,
      required this.selectedColor,
      required this.unSelectedColor,
      required this.autoStart,
      required this.duration}) {
    this.left = 20;
    this.right = 20;
    this.bottom = 20;

  }

  @override
  State<StatefulWidget> createState() {
    return _FBannerState();
  }
}

class _FBannerState extends State<FBanner> {
  StreamController<int> stream = StreamController<int>();

  late PageController pageController;
  late Timer timer;

  final int maxCount = 1000;
  int itemCount = 0;
  int initialPage = 0;

  @override
  void initState() {
    itemCount = widget.data.length != 0 ? maxCount : 0;
    initialPage = widget.data.length != 0
        ? (maxCount / 2 - maxCount / 2 % widget.data.length).toInt()
        : 0;
    pageController = PageController(initialPage: initialPage);

    startTimer();
    super.initState();
  }

  void startTimer() {
    if (widget.autoStart) {
      timer = Timer.periodic(widget.duration, (time) {
        // 只在倒计时结束时回调
        pageController.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      });
    }
  }

  void stopTimer() {
    if (widget.autoStart) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding,
        margin: widget.margin,
        width: widget.width,
        height: widget.width / widget.ratio,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            getBanner(),
            getIndicator(),
          ],
        ));
  }

  void _onPageChanged(int index) {
    stream.sink.add(index);
  }

  @override
  void dispose() {
    stream.close();
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  Widget getBanner() {
    return Listener(
//      onNotification: (ScrollNotification notification) {
//        switch (notification.runtimeType) {
//          case ScrollStartNotification:
////            print("开始滚动");
//
//            break;
//          case ScrollUpdateNotification:
////            print("正在滚动");
//            break;
//          case ScrollEndNotification:
////            print("滚动停止");
//            startTimer();
//            break;
//          case OverscrollNotification:
////            print("滚动到边界");
//            break;
//        }
//        return false;
//      },
      onPointerDown: (PointerDownEvent event) {
        stopTimer();
      },
      onPointerMove: (PointerMoveEvent event) {},
      onPointerUp: (PointerUpEvent event) {
        startTimer();
      },
      child: PageView.builder(
        onPageChanged: _onPageChanged,
        controller: pageController,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: widget.borderRadius,
            child: CachedNetworkImage(
              imageUrl: widget.data[index % widget.data.length].name,
              width: widget.width,
              height: widget.width / widget.ratio,
              fit: BoxFit.cover,
              placeholder: (BuildContext context, String url) {
                return Image.asset("images/default_place_holder.png");
              },
            ),
          );
        },
        itemCount: itemCount,
      ),
    );
  }

  Widget getIndicator() {
    if (widget.alignment == FBannerAlignment.left) {
      return Positioned(
        left: widget.left,
        bottom: widget.bottom,
        height: widget.size,
        child: StreamBuilder<int>(
          stream: stream.stream,
          initialData: initialPage,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.data.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: widget.space / 2, right: widget.space / 2),
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (snapshot.data! % widget.data.length) == index
                          ? widget.selectedColor
                          : widget.unSelectedColor,
                    ),
                  );
                });
          },
        ),
      );
    } else if (widget.alignment == FBannerAlignment.right) {
      return Positioned(
        right: widget.right,
        bottom: widget.bottom,
        height: widget.size,
        child: StreamBuilder<int>(
          stream: stream.stream,
          initialData: initialPage,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.data.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: widget.space / 2, right: widget.space / 2),
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (snapshot.data! % widget.data.length) == index
                          ? widget.selectedColor
                          : widget.unSelectedColor,
                    ),
                  );
                });
          },
        ),
      );
    } else {
      return Positioned(
        bottom: widget.bottom,
        height: widget.size,
        child: StreamBuilder<int>(
          stream: stream.stream,
          initialData: initialPage,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.data.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: widget.space / 2, right: widget.space / 2),
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (snapshot.data! % widget.data.length) == index
                          ? widget.selectedColor
                          : widget.unSelectedColor,
                    ),
                  );
                });
          },
        ),
      );
    }
  }
}

enum FBannerAlignment { left, right, center }
