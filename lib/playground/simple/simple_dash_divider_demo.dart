import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:flutter/material.dart';

class DashDividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget(""),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            width: double.infinity,
            child: DashedDivider(
              horizontal: true,
            ),
          ),
          Expanded(
              child: Container(
            width: 10,
            child: DashedDivider(),
          ))
        ],
      ),
    );
  }
}

//class SimpleDemoPage extends StatefulWidget {
//  @override
//  _SimpleDemoPageState createState() => new _SimpleDemoPageState();
//}
//
//class _SimpleDemoPageState extends State<SimpleDemoPage> {
//  List<Pair> data = List<Pair>();
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: Column(
//        children: <Widget>[
//          ActionBarWidget(""),
//          Container(
//            child: FBanner(
//              data,
//            ),
//          ),
//          Container(
//              height: 30,
//              width: double.infinity,
//              child: Center(
//                child: Text(
//                  "我爱中国！ I love China...",
//                  style: TextStyle(
//                      fontSize: 20,
//                      color: Color(0xff666666),
//                      shadows: <Shadow>[
//                        Shadow(color: Colors.red, offset: Offset(2, 2),blurRadius: 2),
//                        Shadow(color: Colors.yellow, offset: Offset(4, 4),blurRadius: 2),
//                      ]),
//                ),
//              )),
//          Container(
//            height: 1,
//            width: double.infinity,
//            child: DashedDivider(
//              horizontal: true,
//            ),
//          ),
//          Expanded(
//              child: Container(
//            width: 10,
//            child: DashedDivider(),
//          ))
//        ],
//      ),
//    );
//  }
//}
