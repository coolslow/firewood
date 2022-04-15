import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/font.dart';
import 'package:flutter/material.dart';

// deprecated zhl
class SliverMixDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              _buildAction(),
            ],
            title: Text('Mix滑动'),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(index);
              },
              childCount: 20,
            ),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItem(index);
              },
              childCount: 20,
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
