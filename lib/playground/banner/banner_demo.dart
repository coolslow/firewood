import 'package:firewood/entity/pair_entity.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/banner/banner.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:flutter/material.dart';

class BannerDemoPage extends StatefulWidget {
  @override
  _BannerDemoPageState createState() => new _BannerDemoPageState();
}

class _BannerDemoPageState extends State<BannerDemoPage> {
  List<Pair> data = List<Pair>();

  @override
  void initState() {
    super.initState();
    data.add(Pair.create(
        name: "https://img1.doubanio.com/view/photo/l/public/p1482506339.webp",
        value: ""));
    data.add(Pair.create(
        name: "https://img3.doubanio.com/view/photo/l/public/p1482523342.webp",
        value: ""));
    data.add(Pair.create(
        name: "https://img3.doubanio.com/view/photo/l/public/p1482491522.webp",
        value: ""));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          ActionBarWidget(""),
          Container(
            child: FBanner(
              data,
            ),
          ),
        ],
      ),
    );
  }
}
