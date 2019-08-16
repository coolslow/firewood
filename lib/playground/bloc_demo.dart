import 'package:bloc/bloc.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation/action_bar.dart';

class BlocDemoPage extends StatefulWidget {
  @override
  _BlocDemoState createState() => new _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemoPage> {
  var ts = TextStyle(color: FColor.textMajor);

  CounterBloc _counterBloc = new CounterBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusbarHeight = MediaQuery.of(context).padding.top; //

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("BlocDemo"),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: _counterBloc..dispatch(CounterEvent.error),
              builder: (context, state) {
                return _getRealChild(state);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRealChild(CounterState state) {
    Widget descrip;
    if (state is CounterInitState) {
      descrip = Text("flutter init = ${state.count}");
    } else if (state is CounterIncrementState) {
      descrip = Text("flutter count incrementing = ${state.count}");
    } else if (state is CounterDecrementState) {
      descrip = Text("flutter count Decrementing = ${state.count}");
    } else if (state is CounterErrorState) {
      descrip = Text("flutter error = ${state.error}");
    } else {
      descrip = Text("flutter loading");
    }

    return Stack(
      children: <Widget>[
        Column(children: [
          Container(
              color: FColor.bgMajor,
              height: 50,
              child: Center(
                child: descrip,
              )),
          FlatButton(
            onPressed: () {
              print("increment");
              _counterBloc.dispatch(CounterEvent.increment);
            },
            child: Container(
                width: double.maxFinite, child: Center(child: Text("Plus"))),
          ),
          FlatButton(
            onPressed: () {
              print("decrement");
              _counterBloc.dispatch(CounterEvent.decrement);
            },
            child: Container(
                width: double.maxFinite, child: Center(child: Text("Minus"))),
          )
        ]),
        (state is CounterLoadingState)
            ? Container(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : Container(),
      ],
    );
  }
}

enum CounterEvent { increment, decrement, error }

class CounterState {
  int count = 0;
  String description = "";
}

class CounterInitState extends CounterState {}

class CounterLoadingState extends CounterState {}

class CounterIncrementState extends CounterState {}

class CounterDecrementState extends CounterState {}

class CounterErrorState extends CounterState {
  String error;
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _count = 10;

  @override
  CounterState get initialState {
    CounterInitState currentState = new CounterInitState();
    currentState.count = _count;
    currentState.description = "Init Description";
    return currentState;
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    print(transition);
  }

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield CounterLoadingState();

        await Future.delayed(Duration(seconds: 2));
        CounterIncrementState state = new CounterIncrementState();
        state.count = _count = _count + 1;
        state.description = "Description increment";
        yield state;
        break;
      case CounterEvent.decrement:
        yield CounterLoadingState();
        await Future.delayed(Duration(seconds: 2));
        CounterDecrementState state = new CounterDecrementState();
        state.count = _count = _count - 1;
        state.description = "Description increment";
        yield state;
        break;
      case CounterEvent.error:
        yield CounterLoadingState();

        await Future.delayed(Duration(seconds: 2));
        CounterErrorState state = new CounterErrorState();
        state.error = "CounterErrorState";
        yield state;
        break;
    }
  }
}
