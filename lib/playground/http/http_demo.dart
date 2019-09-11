import 'package:firewood/playground/http/http_service.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:firewood/widgets/dialog/loading_dialog.dart';
import 'package:flutter/material.dart';

class HttpDemoPage extends StatefulWidget {
  @override
  _HttpDemoState createState() => new _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemoPage> {
  var ts = TextStyle(color: FColor.textMajor);
  String responseData = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ActionBarWidget("网络服务"),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                      color: FColor.bgMajor,
                      onPressed: onClickGet,
                      child: Text("GET请求", style: ts)),
                ),
                Container(
                  color: Colors.white,
                  width: 1,
                ),
                Expanded(
                  child: FlatButton(
                      color: FColor.bgMajor,
                      onPressed: onClickPost,
                      child: Text("POST请求", style: ts)),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(responseData),
            ),
          ),
        ],
      ),
    );
  }

  void onClickGet() {
    setState(() {
      responseData = "";
    });
    Future<String> content = HttpService.getInstance().get("music.md");
    LoadingDialog.show(context, color: Colors.transparent);
    content.then((data) {
      LoadingDialog.hide(context);
      setState(() {
        responseData = data;
      });
    });
  }

  void onClickPost() {
    setState(() {
      responseData = "";
    });
    Future<String> content = HttpService.getInstance().get("music.md");
    LoadingDialog.show(context, color: Colors.transparent);
    content.then((data) {
      LoadingDialog.hide(context);
      setState(() {
        responseData = data;
      });
    });
  }
}
