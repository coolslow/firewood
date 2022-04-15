import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupPageViewSection extends StatefulWidget {
  @override
  _GroupPageViewSectionState createState() => _GroupPageViewSectionState();
}

class _GroupPageViewSectionState extends State<GroupPageViewSection> {
  PageController controller = PageController(
    viewportFraction: 0.80,
  );

  double currentPage = 1.0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      height: SizeCompat.pxToDp(460.0),
      child: PageView(
        controller: this.controller,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: SizeCompat.pxToDp(10.0),
              // top: SizeCompat.pxToDp(5.0),
            ),

            // color: Colors.red,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeCompat.pxToDp(10.0))),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffd7d8d9), //Color(0xfff7f7f7)
                  offset: Offset(0, 2),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                // header 部分
                Container(
                  height: SizeCompat.pxToDp(100.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6), // 设置容器的背景颜色
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        SizeCompat.pxToDp(10.0),
                      ),
                      topRight: Radius.circular(
                        SizeCompat.pxToDp(10.0),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '喵～喵喵喵？喵喵！',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeCompat.pxToDp(42.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: SizeCompat.pxToDp(350.0),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: SizeCompat.pxToDp(25.0),
                      // bottom: SizeCompat.pxToDp(25.0),
                    ),
                    child: ListView.separated(
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: SizeCompat.pxToDp(100),
                          padding: EdgeInsets.only(
                            left: SizeCompat.pxToDp(10.0),
                            right: SizeCompat.pxToDp(10.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  left: SizeCompat.pxToDp(10.0),
                                  right: SizeCompat.pxToDp(10.0),
                                ),
                                height: SizeCompat.pxToDp(70),
                                width: SizeCompat.pxToDp(70),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://img3.doubanio.com/icon/u66102211-55.jpg"),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 100,
                                child: Text(
                                  '宇宙画画最烂小组',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: SizeCompat.pxToDp(30.0),
                                    // color:
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Text(
                                '4156成员',
                                style: TextStyle(
                                  fontSize: SizeCompat.pxToDp(24.0),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 1.0,
                          color: Colors.grey[300],
                          indent: SizeCompat.pxToDp(100.0),
                          endIndent: SizeCompat.pxToDp(10.0),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.yellow,
            child: Column(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
