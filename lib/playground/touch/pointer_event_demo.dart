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
  StreamController<String> _stream = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("手势识别"),
      body: Listener(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.topCenter,
            color: Colors.red,
            height: 150.0,
            child: StreamBuilder(
              stream: _stream.stream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return Center(
                    child: Text(snapshot.data == null ? "" : snapshot.data,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            decoration: TextDecoration.none)));
              },
            ),
          ),
          onTap: () {
            _stream.add("单击");
          },
          onDoubleTap: () {
            _stream.add("双击");
          },
          onPanStart: (DragStartDetails details) {
//            _stream.add(
//                "按下 x=${details.globalPosition.dx} y=${details.globalPosition.dy}");
          },
          onPanUpdate: (DragUpdateDetails details) {
            _stream.add(
                "移动 x=${details.globalPosition.dx} y=${details.globalPosition.dy}");
          },
          onPanEnd: (DragEndDetails details) {
//            _stream.add("抬起");
            _stream.add("");
          },
        ),
//        onPointerDown: (PointerDownEvent event) =>
//            _stream.add("按下 x=${event.position.dx} y=${event.position.dx}"),
//        onPointerMove: (PointerMoveEvent event) =>
//            _stream.add("移动 x=${event.position.dx} y=${event.position.dx}"),
//        onPointerUp: (PointerUpEvent event) =>
//            _stream.add("抬起 x=${event.position.dx} y=${event.position.dx}"),
      ),
    );
  }

  @override
  void dispose() {
    _stream.close();
    super.dispose();
  }
}
