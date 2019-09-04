import 'package:flutter/material.dart';

class MyGroupDiscussSection extends StatefulWidget {
  @override
  _MyGroupDiscussState createState() => new _MyGroupDiscussState();
}

class _MyGroupDiscussState extends State<MyGroupDiscussSection> {
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
    return Container(
      child: Text('Hello World'),
    );
  }
}
