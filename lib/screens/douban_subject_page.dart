import 'package:firewood/common/constants.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
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
        body: Column(
          children: <Widget>[
            FActionSearchBar(
                searchHint: "电影票房小组",
                bgColor: Colors.white,
                connerBgColor: Color(0xffF4F4F4),
                mailColor: FColors.iconColorFilter),
          ],
        ),
      ),
    );
  }
}
