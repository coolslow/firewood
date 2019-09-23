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

  CounterBloc _counterBloc = new CounterBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("状态管理"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BlocBuilder<CounterBloc, CounterState>(
              bloc: _counterBloc..dispatch(CounterEvent.increment),
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
      descrip = Text("Init = ${state.count}");
    } else if (state is CounterIncrementState) {
      descrip = Text("Count Incrementing = ${state.count}");
    } else if (state is CounterDecrementState) {
      descrip = Text("Count Decrementing = ${state.count}");
    } else if (state is CounterErrorState) {
      descrip = Text("Error = ${state.error}");
    } else {
      descrip = Text("Loading");
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
              print("Increment");
              _counterBloc.dispatch(CounterEvent.increment);
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
              _counterBloc.dispatch(CounterEvent.decrement);
            },
            child: Container(
                height: 40,
                color: Colors.orange,
                width: double.maxFinite,
                child: Center(child: Text("Minus"))),
          )
        ]),
        (state is CounterLoadingState)
            ? Container(
                margin: EdgeInsets.only(top: 5),
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
  int _count = 0;

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
        state.description = "Description Increment";
        yield state;
        break;
      case CounterEvent.decrement:
        yield CounterLoadingState();
        await Future.delayed(Duration(seconds: 2));
        CounterDecrementState state = new CounterDecrementState();
        state.count = _count = _count - 1;
        state.description = "Description Decrement";
        yield state;
        break;
      case CounterEvent.error:
        yield CounterLoadingState();

        await Future.delayed(Duration(seconds: 2));
        CounterErrorState state = new CounterErrorState();
        state.error = "ErrorState";
        yield state;
        break;
    }
  }
}
