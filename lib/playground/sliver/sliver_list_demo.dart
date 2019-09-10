import 'package:firewood/common/font.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class SliverListDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              _buildAction(),
            ],
            title: Text('SliverList'),
            backgroundColor: Theme.of(context).accentColor,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/bg_compose_artwork.png',
                  fit: BoxFit.cover),
            ),
            floating: true,
            snap: true,
            pinned: true,
          ),
//          SliverFixedExtentList(
//            itemExtent: 120.0,
//            delegate: SliverChildListDelegate(List.generate(20, (index) {
//              return _buildItem(index);
//            })),
//          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(index);
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAction() {
    return Container(
        margin: EdgeInsets.only(right: 17),
        child:Icon(
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
