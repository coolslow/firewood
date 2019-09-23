import 'dart:async';

import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerDemoPage extends StatefulWidget {
  @override
  _TickerDemoState createState() => new _TickerDemoState();
}

class _TickerDemoState extends State<TickerDemoPage> {
  StreamController<String> secondStreamController = StreamController<String>();
  StreamController<String> microsecondsStreamController =
      StreamController<String>();

  Ticker secondTicker;
  Ticker microsecondsTicker;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("定时器"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getBody(context),
          ],
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: <Widget>[
        getTitle("毫秒级定时器"),
        FlatButton(
            onPressed: () {
              _clickMicroseconds();
            },
            child: Container(
                height: 40,
                color: Colors.orange,
                width: double.maxFinite,
                child: StreamBuilder(
                    stream: microsecondsStreamController.stream,
                    initialData: "开始",
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return Center(child: Text(snapshot.data));
                    }))),
        getTitle("秒级定时器"),
        FlatButton(
            onPressed: () {
              _clickSeconds();
            },
            child: Container(
                height: 40,
                color: Colors.orange,
                width: double.maxFinite,
                child: StreamBuilder(
                    stream: secondStreamController.stream,
                    initialData: "开始",
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return Center(child: Text(snapshot.data));
                    }))),
      ],
    );
  }

  void _clickMicroseconds() {
    if (microsecondsTicker != null && microsecondsTicker.isTicking) {
      microsecondsTicker.stop();
      return;
    }
    if (microsecondsTicker != null) {
      microsecondsTicker.start();
      return;
    }
    microsecondsTicker = Ticker((Duration elapsed) {
      print("MicrosecondsTicker=${elapsed.inMicroseconds}");
      microsecondsStreamController.add("${elapsed.inMicroseconds}");
    });
    microsecondsTicker.start();
  }

  void _clickSeconds() {
    if (secondTicker != null && secondTicker.isTicking) {
      secondTicker.stop();
      return;
    }
    if (secondTicker != null) {
      secondTicker.start();
      return;
    }
    secondTicker = Ticker((Duration elapsed) {
      print("SecondTicker=${elapsed.inSeconds}");
      secondStreamController.add("${elapsed.inSeconds}");
    });
    secondTicker.start();
  }

//  Stream<int> microsecondsTick({int ticks}) {
//    return Stream.periodic(Duration(microseconds: 1), (x) {
//      return (ticks - x - 1);
//    }).take(ticks);
//  }

  @override
  void dispose() {
    secondTicker?.dispose();
    microsecondsTicker?.dispose();
    secondStreamController?.close();
    microsecondsStreamController?.close();
    super.dispose();
  }

  Widget getTitle(String title) {
    return Container(
      child: Center(child: Text("$title")),
      height: 40,
    );
  }
}
