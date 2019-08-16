import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {

  @override
  _SubjectPageState createState() => new _SubjectPageState();

}

class _SubjectPageState extends State<SubjectPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('书影音'),
          ),
          body: new Center(
              child: null
          ),
        ),
    );
  }

}