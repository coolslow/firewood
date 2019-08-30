import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:flutter/material.dart';

///
/// 自定义 App Bar
///
class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double height; // appbar 高度
  // final Color backgroundColor; // appbar 背景颜色
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  const CustomAppbarWidget({
    Key key,
    @required this.height,
    // @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(0),
            // child: AppBar(
            //   title: Container(
            //     color: Colors.white,
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintText: "搜索",
            //         contentPadding: EdgeInsets.all(5),
            //       ),
            //     ),
            //   ),
            //   actions: [
            //     IconButton(
            //       icon: Icon(Icons.verified_user),
            //       onPressed: () => null,
            //     ),
            //   ],
            // ),
            child: FActionSearchBar(
                searchHint: "微单摄影同学会",
                bgColor: Colors.black,
                connerBgColor: Color(0xffF4F4F4),
                mailColor: FColors.iconColorFilter,
                unReadCount: 2),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(this.height);
}
