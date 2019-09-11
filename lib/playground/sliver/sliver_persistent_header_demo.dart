import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/font.dart';
import 'package:flutter/material.dart';

class SliverPersistentHeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              _buildAction(),
            ],
            title: Text('PersistentHeader滑动'),
            backgroundColor: Theme.of(context).accentColor,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://img3.doubanio.com/view/photo/l/public/p2567921571.webp"),
            ),
            floating: false,
            snap: false,
            pinned: true,
          ),
          SliverPersistentHeader(
            pinned: true,
//            floating: true,
            delegate: _SliverPersistentHeaderDelegate(
              minHeight: 60.0,
              maxHeight: 180.0,
              child: Container(
                color: Colors.deepOrangeAccent,
                child: Center(
                  child: CachedNetworkImage(
                      height: 180.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://img3.doubanio.com/view/photo/l/public/p2567020233.webp"),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(index);
              },
              childCount: 20,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
//            floating: floating,
            delegate: _SliverPersistentHeaderDelegate(
              minHeight: 60.0,
              maxHeight: 180.0,
              child: Container(
                color: Colors.deepOrangeAccent,
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 180.0,
                    imageUrl:
                        "https://img3.doubanio.com/view/photo/l/public/p2567020301.webp"),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(index);
              },
              childCount: 120,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAction() {
    return Container(
        margin: EdgeInsets.only(right: 17),
        child: Icon(
          FFontFamilyTpp.setting,
          size: 20,
          color: Colors.white,
        ));
  }

  Widget _buildItem(int index) {
    return Container(
      height: 100,
      color: _colors[index % _colors.length],
    );
  }

  final List<Color> _colors = [
    Color(0xffFF4040),
    Color(0xffFF8C00),
    Color(0xffFFFF00),
    Color(0xffC0FF3E),
    Color(0xff9FB6CD),
    Color(0xff5CACEE),
    Color(0xff008B8B)
  ];
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("shrinkOffset=$shrinkOffset     overlapsContent=$overlapsContent");
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
