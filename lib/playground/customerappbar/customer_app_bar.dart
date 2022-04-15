import 'package:firewood/common/constants.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:flutter/material.dart';

///
/// 自定义 App Bar
///
class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double height; // appbar 高度
  final Color bgColor; // appbar 背景颜色

  const CustomAppbarWidget({
    required this.height,
    required this.bgColor,
  }) : super();

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Container(
    //       // color: Colors.black,
    //       child: Padding(
    //         padding: EdgeInsets.all(0),
    //         child: FActionSearchBar(
    //             searchHint: "微单摄影同学会",
    //             bgColor: this.bgColor,
    //             connerBgColor: Color(0xffF4F4F4),
    //             mailColor: FColors.iconColorFilter,
    //             unReadCount: 2),
    //       ),
    //     ),
    //   ],
    // );
    return FActionSearchBar(
      searchHint: "微单摄影同学会",
      bgColor: this.bgColor,
      connerBgColor: Color(0xffF4F4F4),
      mailColor: FColors.iconColorFilter,
      unReadCount: 2,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(this.height);
}
