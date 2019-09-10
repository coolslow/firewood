import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero Demo'), // changed
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: Container(
                height: SizeCompat.width(),
                width: SizeCompat.width(),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                    imageUrl:
                        "https://img3.doubanio.com/icon/up180055214-15.jpg"),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ));
  }
}
