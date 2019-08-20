import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class CircleAvatarDemoPage extends StatefulWidget {
  @override
  _CircleAvatarDemoState createState() => new _CircleAvatarDemoState();
}

class _CircleAvatarDemoState extends State<CircleAvatarDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getActionbar(context, "CircleAvatarDemo"),
            getBody(context)
          ],
        ),
      ),
    );
  }

  Widget getActionbar(BuildContext context, String title) {
    return ActionBarWidget(title);
  }

  String portrait = "https://img3.doubanio.com/icon/up180055214-15.jpg";

  Widget getBody(BuildContext context) {
    Container result = Container(
      padding: EdgeInsets.only(top: SizeCompat.px(54)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: SizeCompat.px(40),
            backgroundImage: NetworkImage(portrait),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: SizeCompat.px(80),
            width: SizeCompat.px(80),
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(portrait)),
                borderRadius: BorderRadius.circular(SizeCompat.px(40))),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: SizeCompat.px(80),
            width: SizeCompat.px(80),
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(portrait)),
                shape: BoxShape.circle),
          ),
        ],
      ),
    );

    return result;
  }
}
