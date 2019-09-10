import 'dart:math' as math;

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
            title: Text('SliverPersistentHeader'),
            backgroundColor: Theme.of(context).accentColor,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/bg_compose_artwork.png',
                  fit: BoxFit.cover),
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
                  child: Text("SliverPersistentHeader1"),
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
                child: Center(
                  child: Text("SliverPersistentHeader2"),
                ),
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
    return ListTile(
      title: Text("Item $index"),
    );
  }
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
