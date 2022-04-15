import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingView extends StatefulWidget {
  final bool isDismissible;
  bool isLoading;
  final Widget child;

  LoadingView({this.isLoading = false, required this.child, this.isDismissible = true});

  @override
  State<StatefulWidget> createState() {
    return _LoadingViewState();
  }
}

class _LoadingViewState extends State<LoadingView> {
  ///
  Future<bool> _onWillPop() {
    if (widget.isDismissible) {
      if (widget.isLoading) {
        setState(() {
          widget.isLoading = !widget.isLoading;
        });
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } else {
      return Future.value(false);
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isDismissible) {
      setState(() {
        widget.isLoading = !widget.isLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(children: <Widget>[
        widget.child,
        (!widget.isLoading)
            ? Container()
            : GestureDetector(
                onTapUp: _onTapUp,
                child: Container(
                  color: Color(0x99ffffff),
                  child: Center(
                      child: SizedBox(
                          width: 120.0,
                          height: 120.0,
                          child: Container(
                              padding: EdgeInsets.all(40),
                              decoration: ShapeDecoration(
                                color: Color(0xffffffff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                              ),
                              child: new CircularProgressIndicator()))),
                ),
              )
      ]),
    );
  }
}
