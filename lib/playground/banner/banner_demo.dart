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
        name: "https://img3.doubanio.com/view/photo/l/public/p2531065846.webp",
        value: ""));
    data.add(Pair.create(
        name: "https://img3.doubanio.com/view/photo/l/public/p1482523342.webp",
        value: ""));
    data.add(Pair.create(
        name: "https://img3.doubanio.com/view/photo/l/public/p1629405665.webp",
        value: ""));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          ActionBarWidget("轮播图"),
          Container(
            child: FBanner(
              data,
              ratio: 2,
              size: 5,
              duration: Duration(milliseconds: 1000),
              alignment: FBannerAlignment.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FBanner(data, size: 10),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FBanner(data,
                size: 15,
                selectedColor: Colors.white,
                unSelectedColor: Colors.grey,
                duration: Duration(milliseconds: 4000),
                alignment: FBannerAlignment.right),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FBanner(data,
                size: 15,
                selectedColor: Colors.white,
                unSelectedColor: Colors.grey,
                autoStart: false,
                duration: Duration(milliseconds: 4000)),
          ),
        ],
      ),
    );
  }
}
