import 'package:firewood/common/font.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class SliverGridDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              _buildAction(),
            ],
            title: Text('SliverGrid'),
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
//          SliverGrid(
//            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                maxCrossAxisExtent: 100),
//            delegate: SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//                return _buildItem(index);
//              },
//              childCount: 120,
//            ),
//          ),
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
