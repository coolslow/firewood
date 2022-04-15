import 'package:bloc/bloc.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDemoPage extends StatefulWidget {
  @override
  _BlocDemoState createState() => new _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemoPage> {
  var ts = TextStyle(color: FColor.textMajor);

  @override
  void initState() {
    super.initState();
  }

  /*

   */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("状态管理"),
      body: BlocProvider(
        create: (_) => CounterBloc(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return _getRealChild(state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRealChild(int state) {
    Widget desc = Text("Init = $state");

    return Stack(
      children: <Widget>[
        Column(children: [
          Container(
              color: FColor.bgMajor,
              height: 50,
              child: Center(
                child: desc,
              )),
          FlatButton(
            onPressed: () {
              print("Increment");
              context.read<CounterBloc>().increment();
            },
            child: Container(
                height: 40,
                color: Colors.orange,
                width: double.maxFinite,
                child: Center(child: Text("Plus"))),
          ),
          FlatButton(
            onPressed: () {
              print("Decrement");
              context.read<CounterBloc>().decrement();
            },
            child: Container(
                height: 40,
                color: Colors.orange,
                width: double.maxFinite,
                child: Center(child: Text("Minus"))),
          )
        ]),
      ],
    );
  }
}

class CounterBloc extends Cubit<int> {

  CounterBloc() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
