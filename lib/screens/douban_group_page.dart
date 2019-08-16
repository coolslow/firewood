import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {

  @override
  _GroupPageState createState() => new _GroupPageState();

}

class _GroupPageState extends State<GroupPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('小组'),
          ),
          body: new Center(
              child: null
          ),
        ),
    );
  }

}