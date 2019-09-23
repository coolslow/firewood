import 'package:english_words/english_words.dart';
import 'package:firewood/playground/listviews/refresh_list_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class ListGridDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionBarWidget("九宫格"),
      body: Column(
        children: <Widget>[
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(0.0),
                  itemCount: 120,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.5),
                  itemBuilder: (BuildContext context, int index) => Container(
                        alignment: Alignment.center,
                        color: Colors.deepOrangeAccent,
                        padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                        child: Text(new WordPair.random().asPascalCase),
                      ))),
        ],
      ),
    );
  }
}
