import 'dart:async';

import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class PointerEventDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointerEventDemoState();
  }
}

class _PointerEventDemoState extends State<PointerEventDemo> {
  StreamController<PointerEvent> _stream = StreamController<PointerEvent>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("TouchEventDemo"),
      body: Listener(
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.red,
          height: 150.0,
          child: StreamBuilder(
            stream: _stream.stream,
            builder:
                (BuildContext context, AsyncSnapshot<PointerEvent> snapshot) {
              return Text(
//                  snapshot.data?.toString() ?? "",
              "Box A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decoration: TextDecoration.none));
            },
          ),
        ),
        onPointerDown: (PointerDownEvent event) => print("down A"),
//        onPointerDown: (PointerDownEvent event) => _stream.add(event),
        onPointerMove: (PointerMoveEvent event) => _stream.add(event),
        onPointerUp: (PointerUpEvent event) => _stream.add(event),
      ),
    );
  }

  @override
  void dispose() {
    _stream.close();
    super.dispose();
  }
}
