import 'package:flutter/widgets.dart';

class ProgressText extends StatefulWidget {

  final double progress;

  ProgressText(this.progress);

  @override
  State<StatefulWidget> createState() {
    return _ProgressTextState();
  }
}

class _ProgressTextState extends State<ProgressText> {
  @override
  Widget build(BuildContext context) {

    print("===ProgressTextState build ");

    return new Text(
      "当前进度：${widget.progress}",
    );
  }
}
