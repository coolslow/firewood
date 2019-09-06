import 'dart:async';

import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/dynamic_create_entity.dart';
import 'package:firewood/entity/dynamic_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/dynamic_repos.dart';
import 'package:firewood/widgets/indicator/indicator.dart';
import 'package:flutter/material.dart';

import 'controller/dynamic_view_controller.dart';

// ignore: must_be_immutable
class DynamicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DynamicPageState();
  }
}

class _DynamicPageState extends State<DynamicPage>
    with AutomaticKeepAliveClientMixin {
  double _offset = 145;
  double _vpFraction;

  DynamicViewController _controller = DynamicViewController();
  PageController _pageController;
  StreamController<int> _stream = StreamController<int>();

  DynamicRepos _dynamicRepos = DynamicRepos.create();
  List<TypeEntity> _data = List<TypeEntity>();

  @override
  void initState() {
    double width = SizeCompat.width();
    _vpFraction = (width - SizeCompat.pxToDp(_offset * 2)) / width;

    _pageController = PageController(viewportFraction: _vpFraction);
    _data = _dynamicRepos.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                left: SizeCompat.pxToDp(_offset),
                right: SizeCompat.pxToDp(40),
                top: SizeCompat.pxToDp(65),
                bottom: SizeCompat.pxToDp(20)),
            child: Text(
              _dynamicRepos.getLabel(),
              style: TextStyle(
                  color: Color(0xff363636), fontSize: SizeCompat.pxToDp(40)),
            ),
          ),
          Expanded(
              child: Stack(
            children: <Widget>[
              Container(
                  constraints:
                      BoxConstraints(minHeight: SizeCompat.pxToDp(1000)),
                  margin: EdgeInsets.only(bottom: SizeCompat.pxToDp(200)),
                  child: PageView.builder(
                    onPageChanged: _onPageChanged,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return _controller.create(context, _data[index]);
                    },
                    itemCount: _data.length,
                  )),
              Positioned(
                  bottom: SizeCompat.pxToDp(130),
                  left: SizeCompat.pxToDeviceDp(
                      SizeCompat.widthPx() / 2 - 200 / 2),
                  child: Container(
                    width: SizeCompat.pxToDeviceDp(200),
                    height: 8,
                    alignment: Alignment.center,
                    child: StreamBuilder(
                        stream: _stream.stream,
                        initialData: 0,
                        builder: (BuildContext context,
                            AsyncSnapshot<int> snapshot) {
                          return FIndicator(
                              current: snapshot.data,
                              indicatorCount: _data.length);
                        }),
                  )),
            ],
          )),
        ],
      ),
      color: Color(0xFFF4F4F4),
    );
  }

  void _onPageChanged(int index) {
    _stream.sink.add(index);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _stream?.close();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
