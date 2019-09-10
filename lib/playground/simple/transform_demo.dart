import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:firewood/widgets/toast/toast.dart';
import 'package:flutter/material.dart';

class TransformDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransformDemoState();
  }
}

class _TransformDemoState extends State<TransformDemo> {
  int _counter = 0;
  Offset _offset = Offset(0.4, 0.7); // new

  @override
  Widget build(BuildContext context) {
    return Transform(
      // Transform widget
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(_offset.dy)
        ..rotateY(_offset.dx),
      alignment: FractionalOffset.center,
      child: GestureDetector(
        // new
        onPanUpdate: (details) {
          setState(() {
            _offset = Offset(_offset.dx + details.delta.dx / 170,
                _offset.dy + details.delta.dy / 190);
          });
        },
        onDoubleTap: () => setState(() => _offset = Offset.zero),
        child: _defaultApp(context),
      ),
    );
  }

  _defaultApp(BuildContext context) {
    // new
    return Scaffold(
      appBar: AppBar(
        title: Text('The Matrix 3D'), // changed
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPress,
        tooltip: 'Click',
        child: Icon(Icons.add),
      ),
    );
  }

  void _onPress() {
    setState(() {
      _counter++;
    });
  }
}
