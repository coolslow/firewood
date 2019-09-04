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

  double left;
  double bottom;
  double space;
  double size;

  Color selectedColor;
  Color unSelectedColor;

  bool autoStart;

  BoxDecoration decoration = BoxDecoration(boxShadow: [
    BoxShadow(
        color: Color(0xFFBDBDBD), //Color(0xfff7f7f7)
        offset: Offset.zero,
        blurRadius: 0.0,
        spreadRadius: 0.0)
  ]);

  FBanner(this.data, {this.ratio, this.width}) {
    this.ratio ??= 3;
    this.width ??= SizeCompat.width();
    this.borderRadius ??= BorderRadius.all(Radius.circular(10));

    this.left = 20;
    this.bottom = 20;

    this.space ??= 10;
    this.size ??= 10;

    this.selectedColor ??= Colors.greenAccent;
    this.unSelectedColor ??= Colors.grey;
    this.autoStart ??= true;
  }

  @override
  State<StatefulWidget> createState() {
    return _FBannerState();
  }
}

class _FBannerState extends State<FBanner> {
  StreamController<int> stream = StreamController<int>();

  PageController pageController;
  Timer timer;

  final int maxCount = 1000;
  int itemCount;
  int initialPage;

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

  void startTimer(){
    if (widget.autoStart) {
      print("Ticker====1=${DateTime.now()}");
      timer = Timer.periodic(Duration(seconds: 2), (time) {
        // 只在倒计时结束时回调
        print(
            "Ticker====2=${DateTime.now()}     ${timer.tick}     ${pageController.page}");

//        stream.sink.add(pageController.page.toInt() + 1);
        pageController.nextPage(
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      });
    }
  }

  void stopTimer(){
    if (widget.autoStart) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build===");
    return Container(
        padding: widget.padding,
        margin: widget.margin,
        width: widget.width,
        height: widget.width / widget.ratio,
        child: Stack(
          children: <Widget>[
            PageView.builder(
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
            Positioned(
              left: widget.left,
              bottom: widget.bottom,
              height: widget.size,
              child: StreamBuilder<int>(
                stream: stream.stream,
                initialData: initialPage,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  print("StreamBuilder===${snapshot.data}");
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
                            color: (snapshot.data % widget.data.length) == index
                                ? widget.selectedColor
                                : widget.unSelectedColor,
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ));
  }

  void _onPageChanged(int index) {
    stream.sink.add(index);
  }

  @override
  void dispose() {
    stream?.close();
    pageController?.dispose();
    timer?.cancel();
    super.dispose();
  }
}
