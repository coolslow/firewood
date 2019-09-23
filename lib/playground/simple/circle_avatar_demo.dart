import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class CircleAvatarDemoPage extends StatelessWidget {
  final String portrait = "https://img3.doubanio.com/icon/up180055214-15.jpg";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("圆角图片"),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: SizeCompat.pxToDp(54)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: SizeCompat.pxToDp(80),
                backgroundImage: NetworkImage(portrait),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: SizeCompat.pxToDp(80),
                width: SizeCompat.pxToDp(80),
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(portrait)),
                    borderRadius: BorderRadius.circular(SizeCompat.pxToDp(80))),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: SizeCompat.pxToDp(80),
                width: SizeCompat.pxToDp(80),
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(portrait)),
                    shape: BoxShape.circle),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: SizeCompat.pxToDp(160),
                width: SizeCompat.pxToDp(160),
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(portrait)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
