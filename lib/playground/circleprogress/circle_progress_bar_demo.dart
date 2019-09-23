import 'package:bloc/bloc.dart';
import 'package:firewood/playground/circleprogress/progress_text.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'circle_progress_bar_widget.dart';

class CircleProgressBarDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CircleProgressBarDemoState();
  }
}

class _CircleProgressBarDemoState extends State<CircleProgressBarDemoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("进度条"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[getBody(context)],
        ),
      ),
    );
  }

  ProgressBloc progressBloc = ProgressBloc();

  Widget getBody(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<ProgressBloc, ProgressState>(
          bloc: progressBloc,
          builder: (context, state) {
            bool startAnim = false;
            if (state.startAnim) {
              startAnim = true;
            }
            return Column(children: <Widget>[
              Container(
                  child: CircleProgressBarWidget(state.progress,
                      supportGesture: supportGesture,
                      startAnim: startAnim, callback: (double progress) {
                progressBloc.dispatch(ProgressChangeEvent(progress));
              })),
              ProgressText(state.progress),
            ]);
          },
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.grey,
              child: FlatButton(
                  onPressed: () {
                    progressBloc.dispatch(ProgressAnimEvent(0.8));
                  },
                  child: Text("动画展示")),
            )),
            Container(width: 1, color: Colors.white),
            Expanded(
                child: Container(
              color: Colors.grey,
              child: FlatButton(
                  onPressed: () {
                    supportGesture = !supportGesture;
                    setState(() {});
                  },
                  child: Text(supportGesture ? "屏蔽手势" : "支持手势")),
            )),
          ],
        ),
      ],
    );
  }

  bool supportGesture = true;
}

class ProgressEvent {
  double progress = 0;
}

class ProgressAnimEvent extends ProgressEvent {
  ProgressAnimEvent(double p) {
    progress = p;
  }
}

class ProgressChangeEvent extends ProgressEvent {
  ProgressChangeEvent(double p) {
    progress = p;
  }
}

class ProgressState {
  double progress = 0;
  bool startAnim = false;
}

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  @override
  ProgressState get initialState {
    ProgressState currentState = new ProgressState();
    currentState.progress = 0;
    return currentState;
  }

  @override
  Stream<ProgressState> mapEventToState(ProgressEvent event) async* {
    if (event is ProgressChangeEvent) {
      ProgressState state = new ProgressState();
      state.progress = event.progress;
      state.startAnim = false;
      yield state;
    } else if (event is ProgressAnimEvent) {
      ProgressState state = new ProgressState();
      state.progress = event.progress;
      state.startAnim = true;
      yield state;
    }
  }
}
