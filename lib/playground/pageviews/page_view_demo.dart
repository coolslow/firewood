import 'package:firewood/common/utils/log_util.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class PageViewDemoPage extends StatefulWidget {
  @override
  _PageViewDemoState createState() => new _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemoPage> {
  PageController controller = PageController();

  double currentPageValue = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("PageViewDemo"),
            getTitle("Children方式"),
            SizedBox.fromSize(
              child: pvChildren(context),
              size: Size.fromHeight(100),
            ),
            getTitle("Builder方式"),
            SizedBox.fromSize(
              child: pvBuilder(context),
              size: Size.fromHeight(100),
            ),
            getTitle("Axis.vertical"),
            SizedBox.fromSize(
              child: pvVertical(context),
              size: Size.fromHeight(100),
            ),
            getTitle("Snapping"),
            SizedBox.fromSize(
              child: pvSnapping(context),
              size: Size.fromHeight(100),
            ),
            getTitle("Transition1"),
            SizedBox.fromSize(
              child: pvTransition1(context),
              size: Size.fromHeight(100),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitle(String title) {
    return Container(
      child: Center(child: Text("$title")),
      height: 40,
    );
  }

  Widget pvChildren(BuildContext context) {
    PageView pageView = PageView(
      children: <Widget>[
        // Add children
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.cyan,
        ),
        Container(
          color: Colors.deepPurple,
        ),
      ],
    );

    return Container(
      child: pageView,
    );
  }

  Widget _buildPage(int index) {
    List<Widget> list = List<Widget>();
    list.add(Container(
      color: Colors.pink,
    ));
    list.add(Container(
      color: Colors.cyan,
    ));
    list.add(Container(
      color: Colors.deepPurple,
    ));
    return list[index % list.length];
  }

  Widget pvBuilder(BuildContext context) {
    return PageView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _buildPage(index);
      },
//      itemCount: 3,
    );
  }

  Widget pvVertical(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return _buildPage(index);
      },
      itemCount: 3,
    );
  }

  Widget pvSnapping(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      pageSnapping: false,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildPage(index);
      },
      itemCount: 3,
    );
  }

  Widget pvTransition1(BuildContext context) {
    return PageView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        Log.debug(
            "index=$index        value=$currentPageValue floor = ${currentPageValue.floor()}   cell=${currentPageValue.ceil()}");

        if (index == currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - index),
            child: _buildPage(index),
          );
        } else if (index == currentPageValue.floor() + 1) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - index),
            child: _buildPage(index),
          );
        } else {
          return _buildPage(index);
        }
      },
      itemCount: 5,
    );
  }
}
