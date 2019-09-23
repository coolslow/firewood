import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class PageViewDemoPage extends StatefulWidget {
  @override
  _PageViewDemoState createState() => new _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemoPage> {
  PageController controller = PageController();

  StreamController<double> streamController = StreamController<double>();

  List<Widget> transitionList = List<Widget>();

  @override
  void initState() {
    controller.addListener(() {
      streamController.add(controller.page);
    });

    transitionList.add(
      Container(
        alignment: Alignment.center,
        color: Colors.pink,
        child: Text(
          WordPair.random().asPascalCase,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    transitionList.add(
      Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: Text(
          WordPair.random().asPascalCase,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    transitionList.add(Container(
      alignment: Alignment.center,
      color: Colors.deepPurple,
      child: Text(
        WordPair.random().asPascalCase,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("页级列表"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
//            getTitle("Children方式"),
//            SizedBox.fromSize(
//              child: pvChildren(context),
//              size: Size.fromHeight(100),
//            ),
            getTitle("水平方向"),
            SizedBox.fromSize(
              child: pvBuilder(context),
              size: Size.fromHeight(100),
            ),
            getTitle("垂直方向"),
            SizedBox.fromSize(
              child: pvVertical(context),
              size: Size.fromHeight(100),
            ),
            getTitle("水平粘性滑动"),
            SizedBox.fromSize(
              child: pvSnappingHorizontal(context),
              size: Size.fromHeight(100),
            ),
            getTitle("垂直粘性滑动"),
            SizedBox.fromSize(
              child: pvSnappingVertical(context),
              size: Size.fromHeight(100),
            ),
            getTitle("转换过度"),
            SizedBox.fromSize(
              child: pvTransition(context),
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
          alignment: Alignment.center,
          color: Colors.pink,
          child: Text(
            WordPair.random().asPascalCase,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.cyan,
          child: Text(
            WordPair.random().asPascalCase,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.deepPurple,
          child: Text(
            WordPair.random().asPascalCase,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );

    return Container(
      child: pageView,
    );
  }

  Widget _buildPage(int index) {
    List<Widget> list = List<Widget>();
    list.add(
      Container(
        alignment: Alignment.center,
        color: Colors.pink,
        child: Text(
          WordPair.random().asPascalCase,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    list.add(
      Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: Text(
          WordPair.random().asPascalCase,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    list.add(Container(
      alignment: Alignment.center,
      color: Colors.deepPurple,
      child: Text(
        WordPair.random().asPascalCase,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
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

  Widget pvSnappingHorizontal(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      pageSnapping: false,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _buildPage(index);
      },
      itemCount: 3,
    );
  }

  Widget pvSnappingVertical(BuildContext context) {
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

  Widget pvTransition(BuildContext context) {
    return StreamBuilder(
      stream: streamController.stream,
      initialData: 0.0,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        return PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index == snapshot.data.floor()) {
              return Transform(
                transform: Matrix4.identity()..rotateX(snapshot.data - index),
                child: transitionList[index % transitionList.length],
              );
            } else if (index == snapshot.data.floor() + 1) {
              return Transform(
                transform: Matrix4.identity()..rotateX(snapshot.data - index),
                child: transitionList[index % transitionList.length],
              );
            } else {
              return transitionList[index % transitionList.length];
            }
          },
          itemCount: 15,
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    streamController?.close();
    super.dispose();
  }
}
