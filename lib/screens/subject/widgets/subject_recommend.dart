import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/color_util.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SubjectRecommend extends StatelessWidget {
  MoveRecommendEntity data;

  SubjectRecommend(this.data);

  @override
  Widget build(BuildContext context) {
    return getItem(context);
  }

  Widget getItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
        BoxShadow(
            color: Color(0xFFBDBDBD),//Color(0xfff7f7f7)
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
            spreadRadius: 5.0)
      ]
      ),
      margin: EdgeInsets.only(
          left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
          right: SizeCompat.pxToDp(Dimens.appEdgeEdge)),
      child: Column(
        children: <Widget>[
          getTop(context),
          getBottom(context),
        ],
      ),
    );
  }

  Widget getTop(BuildContext context) {
    double w = (SizeCompat.width() - SizeCompat.pxToDp(Dimens.appEdgeEdge) * 2);
    double h = w / 1.76;
    return Container(
      height: h,
      child: ClipRRect(
        child: CachedNetworkImage(
          height: h,
          width: w,
          imageUrl: data.imgUrl,
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) {
            return Image.asset("images/default_place_holder.png");
          },
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeCompat.pxToDp(15)),
            topRight: Radius.circular(SizeCompat.pxToDp(15))),
      ),
    );
  }

  Widget getBottom(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
            left: SizeCompat.pxToDp(40),
            right: SizeCompat.pxToDp(40),
            top: SizeCompat.pxToDp(40),
            bottom: SizeCompat.pxToDp(40)),
        decoration: BoxDecoration(
            color: ColorUtil.parse(data.bgColor),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeCompat.pxToDp(15)),
                bottomRight: Radius.circular(SizeCompat.pxToDp(15)))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${data.title}",
              style: TextStyle(
                  color: ColorUtil.parse(data.titleColor),
                  fontSize: SizeCompat.pxToDp(36),
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeCompat.pxToDp(20), bottom: SizeCompat.pxToDp(20)),
              child: Row(
                children: <Widget>[
                  data.canPlay
                      ? Container(
                          margin: EdgeInsets.only(right: SizeCompat.pxToDp(20)),
                          child: Image.asset("images/ic_can_play.png",
                              width: SizeCompat.pxToDp(56),
                              height: SizeCompat.pxToDp(56),
                              color: ColorUtil.parse(data.btnColor),
                              colorBlendMode: BlendMode.srcATop))
                      : Container(),
                  Expanded(
                    child: Text(
                      "${data.subTitle}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorUtil.parse(data.subTitleColor),
                          fontSize: SizeCompat.pxToDp(56)),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${data.des}",
              style: TextStyle(
                  color: ColorUtil.parse(data.desColor),
                  fontSize: SizeCompat.pxToDp(30)),
            ),
          ],
        ));
  }
}
