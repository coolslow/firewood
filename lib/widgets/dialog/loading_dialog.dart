import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends StatefulWidget {
  static LoadingDialog _loadingDialog;
  static bool _barrierDismissible;

  static void show(BuildContext context, {barrierDismissible: true}) {
    print("show     $_loadingDialog ");
    if (_loadingDialog == null) {
      _loadingDialog = LoadingDialog();
      _barrierDismissible = barrierDismissible;
      showDialog(
          context: context,
          barrierDismissible: _barrierDismissible,
          builder: (BuildContext context) {
            return _loadingDialog;
          });
    }
  }

  static void hide(BuildContext context) {
    print("hide     $_loadingDialog ");
    if (_loadingDialog != null) {
      Navigator.of(context, rootNavigator: true).pop();
      _loadingDialog = null;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _LoadingDialogState();
  }
}

class _LoadingDialogState extends State<LoadingDialog> {
  ///
  Future<bool> _onWillPop() {
//    Future.value(false); 表示不退出. Future.value(true); 表示退出.
    if (LoadingDialog._barrierDismissible) {
      LoadingDialog._loadingDialog = null;
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (LoadingDialog._barrierDismissible) {
      LoadingDialog.hide(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: GestureDetector(
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
        ));
  }
}
