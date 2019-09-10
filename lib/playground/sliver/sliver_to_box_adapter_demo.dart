import 'dart:math' as math;

import 'package:firewood/common/font.dart';
import 'package:flutter/material.dart';

class SliverToBoxAdapterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              _buildAction(),
            ],
            title: Text('SliverToBoxAdapterDemo'),
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
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              child: Text("Header"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(index);
              },
              childCount: 10,
            ),
          ),
//          Container(
//            child: Text("Common"),
//          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.deepOrangeAccent,
              child: Text("Ad"),
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
          SliverToBoxAdapter(
            child: Container(
              color: Colors.green,
              child: Text("Footer"),
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
