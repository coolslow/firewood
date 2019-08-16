import 'package:firewood/playground/demo_page.dart';
import 'package:firewood/widgets/navigation/FBottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<FBottomData> bottomData;

  @override
  void initState() {
    super.initState();

    bottomData = new List();
    bottomData.add(FBottomData(
      title: "首页",
      selectIcon: Image.asset("images/ic_tab_home_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_home_normal.png"),
    ));
    bottomData.add(FBottomData(
      title: "书影音",
      selectIcon: Image.asset("images/ic_tab_subject_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_subject_normal.png"),
    ));
    bottomData.add(FBottomData(
      title: "小组",
      selectIcon: Image.asset("images/ic_tab_group_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_group_normal.png"),
    ));
    bottomData.add(FBottomData(
      title: "市集",
      selectIcon: Image.asset("images/ic_tab_shiji_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_shiji_normal.png"),
    ));
    bottomData.add(FBottomData(
      title: "我的",
      selectIcon: Image.asset("images/ic_tab_profile_active.png"),
      unSelectIcon: Image.asset("images/ic_tab_profile_normal.png"),
    ));
  }

  void onPageChange(val) {
//    setState(() {
//      index = val;
//    });
    print("onPageChange=$val");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: DemoPage(),
          ),
          Container(
              height: 60,
              color: Colors.white,
              child: FBottomNavigationBar(
                bottomData: bottomData,
                callback: onPageChange,
              )),
        ],
      ),
    );
  }
}
