import 'package:english_words/english_words.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/material.dart';

import 'navigation/action_bar.dart';

class ListDemoPage extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusbarHeight = MediaQuery.of(context).padding.top; //

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("ListDemo"),
            Container(
              height: 150,
              child: ListView.builder(
//                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(0.0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  leading: Icon(Icons.list),
                  title: Text("顾名思义=$index"),
                  subtitle: Text("属性详细介绍"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            Container(
                height: 50,
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
            Container(
                height: 150,
                margin: EdgeInsets.only(top: 10),
                child: GridView.builder(
                    padding: EdgeInsets.all(0.0),
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.5),
                    itemBuilder: (BuildContext context, int index) => Container(
                          color: Colors.deepOrangeAccent,
                          padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                          child: Text(new WordPair.random().asPascalCase),
                        ))),
          ],
        ),
      ),
    );
  }
}
