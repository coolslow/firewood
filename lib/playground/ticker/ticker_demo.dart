import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerDemoPage extends StatefulWidget {
  @override
  _TickerDemoState createState() => new _TickerDemoState();
}

class _TickerDemoState extends State<TickerDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ActionBarWidget(""), getBody(context)],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: <Widget>[
        new Text("templet"),
        FlatButton(
          onPressed: () {
            _clickStart();
          },
          child: Container(
              height: 40,
              color: Colors.blueGrey,
              width: double.maxFinite,
              child: Center(child: Text("Start"))),
        ),
      ],
    );
  }

  void _clickStart() {
    String time1 = "1".padLeft(2, '0');
    String time2 = "11".padLeft(2, '0');


    print("_clickStart=====$time1       $time2");
//    Stream<int> stream = tick(ticks: 10);
//    stream.listen((count){
//      print("_listen=====$count");
//    });

//    ticker = Ticker((Duration elapsed) {
//      print("Ticker=====${elapsed.inMicroseconds}");
//    });
//    ticker.start();


  }
  Ticker ticker;

//  Stream<int> tick({int ticks}) {
//    return Stream.periodic(Duration(seconds: 1), (x) {
//      print("tick=$x");
//
//      return (ticks - x - 1);
//    }).take(ticks);
//  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }
}
