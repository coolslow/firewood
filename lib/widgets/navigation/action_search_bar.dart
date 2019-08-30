import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FActionSearchBar extends StatelessWidget {
  final String searchHint;
  final Color bgColor;
  final Color mailColor;
  final Color connerBgColor;
  final int unReadCount;

  final double actionBarHeight = SizeCompat.pxToDp(130);

  FActionSearchBar(
      {@required this.searchHint,
      this.bgColor = FColors.primary,
      this.mailColor = Colors.white,
      this.connerBgColor = Colors.white,
      this.unReadCount = 0});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double statusHeight = mediaQuery.padding.top;
    return Container(
        width: double.infinity,
        color: bgColor,
        padding: EdgeInsets.only(
            left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
            right: SizeCompat.pxToDp(Dimens.appEdgeEdge),
            top: statusHeight),
        height: statusHeight + actionBarHeight,
        child: getSearchBar(context));
  }

  Widget getSearchBar(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: SizeCompat.pxToDp(20)),
            padding: EdgeInsets.only(
              left: SizeCompat.pxToDp(45),
              right: SizeCompat.pxToDp(30),
            ),
            decoration: BoxDecoration(
              color: connerBgColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  SizeCompat.pxToDp(45),
                ),
              ),
            ),
            height: SizeCompat.pxToDp(90),
            child: Row(
              children: [
                Container(
                  width: SizeCompat.pxToDp(50),
                  height: SizeCompat.pxToDp(50),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/ic_search.png"),
                      colorFilter: ColorFilter.mode(
                          Color(0xff7E7E7E), BlendMode.srcATop),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: SizeCompat.pxToDp(25),
                      right: SizeCompat.pxToDp(25),
                    ),
                    child: Text(
                      searchHint,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xffDADADA),
                        fontSize: SizeCompat.pxToDp(40),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: SizeCompat.pxToDp(50),
                  height: SizeCompat.pxToDp(50),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/ic_scan.png"),
                      colorFilter: ColorFilter.mode(
                          Color(0xff7E7E7E), BlendMode.srcATop),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              width: SizeCompat.pxToDp(120),
              height: SizeCompat.pxToDp(100),
              child: Center(
                child: Container(
                  width: SizeCompat.pxToDp(60),
                  height: SizeCompat.pxToDp(60),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/ic_message.png"),
                      colorFilter:
                          ColorFilter.mode(mailColor, BlendMode.srcATop),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Offstage(
                offstage: unReadCount == 0,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: SizeCompat.pxToDp(56),
                    minHeight: SizeCompat.pxToDp(56),
                    maxHeight: SizeCompat.pxToDp(56),
                  ),
                  decoration: BoxDecoration(
                    color: FColors.remind,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        SizeCompat.pxToDp(28),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "$unReadCount",
                      style: TextStyle(
                          fontSize: SizeCompat.pxToDp(24), color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
