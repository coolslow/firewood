import 'package:firewood/playground/http/http_service.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fcolor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ActionBarWidget("HttpDemo"),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        color: FColor.bgMajor,
                        onPressed: onClickGet,
                        child: Text("GET", style: ts)),
                  ),
                  Container(
                    color: Colors.white,
                    width: 1,
                  ),
                  Expanded(
                    child: FlatButton(
                        color: FColor.bgMajor,
                        onPressed: onClickPost,
                        child: Text("POST", style: ts)),
                  )
                ],
              ),
            ),
            Text(responseData),
          ],
        ),
      ),
    );
  }

  Future onClickGet() {
    print("get========>");
    Future<String> content = HttpService.getInstance().get("music.md");
    content.then((data) {
      setState(() {
        responseData = data;
      });
    });
  }

  void onClickPost() {
    print("post========>");

    Fluttertoast.showToast(msg: "post 方法空实现");
  }

}
