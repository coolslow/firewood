import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/pair_entity.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/banner/banner.dart';
import 'package:flutter/material.dart';

class BannerDemoPage extends StatelessWidget {
  final List<Pair> data = <Pair>[];

  BannerDemoPage() {
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
      appBar: ActionBarWidget("轮播图"),
      body: Column(
        children: <Widget>[
          Container(
            child: FBanner(
              data,
              ratio: 2,
              size: 5,
              duration: Duration(milliseconds: 1000),
              alignment: FBannerAlignment.left,
              width: SizeCompat.width(),
              autoStart: true,
              selectedColor: Colors.greenAccent,
              unSelectedColor: Colors.grey,
              left: 20,
              right: 20,
              bottom: 20,
              space: 10,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FBanner(
              data,
              size: 10,
              width: SizeCompat.width(),
              autoStart: true,
              selectedColor: Colors.greenAccent,
              unSelectedColor: Colors.grey,
              left: 20,
              right: 20,
              bottom: 20,
              space: 10,
              ratio: 3,
              duration: Duration(milliseconds: 2000),
              alignment: FBannerAlignment.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FBanner(
              data,
              size: 15,
              selectedColor: Colors.white,
              unSelectedColor: Colors.grey,
              left: 20,
              right: 20,
              bottom: 20,
              space: 10,
              ratio: 3,
              duration: Duration(milliseconds: 4000),
              alignment: FBannerAlignment.right,
              autoStart: true,
              width: SizeCompat.width(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: FBanner(data,
                size: 15,
                selectedColor: Colors.white,
                unSelectedColor: Colors.grey,
                autoStart: false,
                left: 20,
                right: 20,
                bottom: 20,
                space: 10,
                ratio: 3,
                alignment: FBannerAlignment.right,
                width: SizeCompat.width(),
                duration: Duration(milliseconds: 4000)),
          ),
        ],
      ),
    );
  }
}
