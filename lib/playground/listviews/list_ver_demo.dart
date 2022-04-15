import 'package:english_words/english_words.dart';
import 'package:firewood/playground/listviews/refresh_list_demo.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

// deprecated zhl
class ListVerDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActionBarWidget("垂直列表"),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
               scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0.0),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: Icon(Icons.list),
                title: Text("顾名思义=$index"),
                subtitle: Text("属性详细介绍"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
