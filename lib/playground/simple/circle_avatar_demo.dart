import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class CircleAvatarDemoPage extends StatelessWidget {

  final String portrait = "https://img3.doubanio.com/icon/up180055214-15.jpg";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("CircleAvatarDemo"),
            Container(
              padding: EdgeInsets.only(top: SizeCompat.pxToDp(54)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: SizeCompat.pxToDp(40),
                    backgroundImage: NetworkImage(portrait),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: SizeCompat.pxToDp(80),
                    width: SizeCompat.pxToDp(80),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(portrait)),
                        borderRadius:
                            BorderRadius.circular(SizeCompat.pxToDp(40))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: SizeCompat.pxToDp(80),
                    width: SizeCompat.pxToDp(80),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(portrait)),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
