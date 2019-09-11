import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:flutter/material.dart';

class RefreshListDemoPage extends StatefulWidget {
  @override
  _RefreshListDemoState createState() => _RefreshListDemoState();
}

class _RefreshListDemoState extends State<RefreshListDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ActionBarWidget("下拉刷新"),
          Expanded(
            child: RefreshIndicator(
                child: ListView.builder(
//                scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(0.0),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                        leading: Icon(Icons.list),
                        title: Text("顾名思义=$index"),
                        subtitle: Text("属性详细介绍"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                ),
                onRefresh: _onRefresh),
          ),
        ],
      ),
    );
  }

  Future<void> _onRefresh()async {
    print("====");
//    await new Future.delayed(new Duration(seconds: 5));
//    setState(() {});
    return null;
  }
}
