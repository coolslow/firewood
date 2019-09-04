import 'package:english_words/english_words.dart';
import 'package:firewood/playground/listviews/refresh_list_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class ListHorDemoPage extends StatefulWidget {
  @override
  _ListHorDemoState createState() => _ListHorDemoState();
}

class _ListHorDemoState extends State<ListHorDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ActionBarWidget("ListDemo"),
          Container(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(0.0),
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                  width: 1,
                  color: Colors.white,
                ),
                itemBuilder: (BuildContext context, int index) => Container(
                  color: Colors.deepPurpleAccent,
                  padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                  child: Text("属性详细介绍"),
                ),
              )),
        ],
      ),
    );
  }
}
