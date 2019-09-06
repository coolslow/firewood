import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/color_util.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/subject/subject_move_interest_entity.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';
import 'package:firewood/entity/subject/subject_teleplay_recommend_entity.dart';
import 'package:firewood/widgets/divider/h_divider.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:firewood/widgets/gradestar/gradestar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SubjectTeleplayRecommend extends StatelessWidget {
  TeleplayRecommendEntity data;

  SubjectTeleplayRecommend(this.data);

  @override
  Widget build(BuildContext context) {
    return getItem(context);
  }

  Widget getItem(BuildContext context) {
    return Container(
      height: SizeCompat.pxToDp(470),
      margin: EdgeInsets.only(
          left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
          right: SizeCompat.pxToDp(Dimens.appEdgeEdge)),
      child: Column(
        children: <Widget>[
          FVDivider(height: SizeCompat.pxToDp(50)),
          getTop(context),
          getBottom(context),
        ],
      ),
    );
  }

  Widget getTop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getImage(),
        FHDivider(
          width: SizeCompat.pxToDp(40),
        ),
        Expanded(child: getDescription()),
//        Expanded(child: getHint()),
      ],
    );
  }

  /// 图片
  Widget getImage() {
    double w = SizeCompat.pxToDp(210);
    double h = SizeCompat.pxToDp(300);
    return Container(
      width: w,
      height: h,
      child: ClipRRect(
          child: CachedNetworkImage(
            width: w,
            height: h,
            imageUrl: data.imgUrl,
            fit: BoxFit.cover,
            placeholder: (BuildContext context, String url) {
              return Image.asset(
                "images/default_place_holder.png",
                fit: BoxFit.cover,
                width: w,
                height: h,
              );
            },
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(SizeCompat.pxToDp(15)))),
    );
  }

  /// 描述
  Widget getDescription() {
    return Stack(
      children: <Widget>[
        Container(color: Colors.white, height: SizeCompat.pxToDp(370)),
        Positioned(
          ///想看
          right: 0,
          top: 0,
          width: SizeCompat.pxToDp(158),
          height: SizeCompat.pxToDp(230),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: getWantSee(),
          ),
        ),
        Positioned(
          ///分割线
          right: SizeCompat.pxToDp(158),
          top: 0,
          width: SizeCompat.pxToDp(2),
          height: SizeCompat.pxToDp(230),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: FColors.divider,
          ),
        ),
        Positioned(
          /// 基本信息
          top: 0,
          left: 0,
          width: SizeCompat.width() -
              SizeCompat.pxToDp(250 + 160.0 + 40) -
              SizeCompat.pxToDp(Dimens.appEdgeEdge) * 2,
          height: SizeCompat.pxToDp(230),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: getBase(),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          width: SizeCompat.width() -
              SizeCompat.pxToDp(250) -
              SizeCompat.pxToDp(Dimens.appEdgeEdge) * 2,
          child: getHint(),
        ),
      ],
    );
  }

  Widget getHint() {
    return Container(
      alignment: Alignment.centerLeft,
      height: SizeCompat.pxToDp(110),
      width: double.infinity,
      padding: EdgeInsets.only(left: SizeCompat.pxToDp(30)),
      decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius:
              BorderRadius.all(Radius.circular(SizeCompat.pxToDp(10)))),
      child: Text(
        data.hint,
        style: TextStyle(
            fontSize: SizeCompat.pxToDp(34), color: Color(0xff707070)),
      ),
    );
  }

  Widget getBase() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            data.canPlay
                ? Container(
                    margin: EdgeInsets.only(right: SizeCompat.pxToDp(10)),
                    child: Image.asset(
                      "images/ic_can_play.png",
                      width: SizeCompat.pxToDp(50),
                      height: SizeCompat.pxToDp(50),
                    ),
                  )
                : Container(),
            Expanded(
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: data.name,
                    style: TextStyle(
                        color: Color(0xff111111),
                        fontSize: SizeCompat.pxToDp(50),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                          text: data.beOnTime,
                          style: TextStyle(
                              color: Color(0xff797979),
                              fontSize: SizeCompat.pxToDp(50),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w200))
                    ]),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
              top: SizeCompat.pxToDp(10), bottom: SizeCompat.pxToDp(10)),
          child: Row(
            children: <Widget>[
              Container(
                  width: SizeCompat.pxToDp(150),
                  margin: EdgeInsets.only(right: SizeCompat.pxToDp(10)),
                  child: GradeStart(data.star, 5,
                      selectColor: Color(0xffFFAC2C),
                      unSelectColor: Color(0xffeE6E6E6),
                      size: SizeCompat.pxToDp(30))),
              Expanded(
                child: Text(data.score.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xff7c7c7c),
                        fontSize: SizeCompat.pxToDp(24),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w200)),
              ),
            ],
          ),
        ),
        Text(
          data.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: SizeCompat.pxToDp(34),
              color: Color(0xff707070),
              height: 1.1),
        )
      ],
    );
  }

//  Widget getTop(BuildContext context) {
//    double w = (SizeCompat.width() - SizeCompat.pxToDp(Dimens.appEdgeEdge) * 2);
//    double h = w / 2.5;
//    return Container(
//        height: h,
//        child: Row(
//          children: <Widget>[
//            Expanded(
//                flex: 2,
//                child: Container(
//                  decoration: BoxDecoration(boxShadow: [
//                    BoxShadow(
//                        color: FColors.shadow, //Color(0xfff7f7f7)
//                        offset: Offset(1.0, 1.0),
//                        blurRadius: 10.0,
//                        spreadRadius: 5.0)
//                  ]),
//                  child: ClipRRect(
//                    child: CachedNetworkImage(
//                      width: w,
//                      height: h,
//                      imageUrl: data.leftImgUrls[0],
//                      fit: BoxFit.cover,
//                      placeholder: (BuildContext context, String url) {
//                        return Image.asset(
//                          "images/default_place_holder.png",
//                          fit: BoxFit.cover,
//                          width: w,
//                          height: h,
//                        );
//                      },
//                    ),
//                    borderRadius: BorderRadius.all(
//                        Radius.circular(SizeCompat.pxToDp(15))),
//                  ),
//                )),
//            VerticalDivider(
//              width: SizeCompat.pxToDp(15),
//              color: Colors.transparent,
//            ),
//            Expanded(
//              flex: 5,
//              child: Container(
//                decoration: BoxDecoration(boxShadow: [
//                  BoxShadow(
//                      color: FColors.shadow, //Color(0xfff7f7f7)
//                      offset: Offset(1.0, 1.0),
//                      blurRadius: 10.0,
//                      spreadRadius: 5.0)
//                ]),
//                child: ClipRRect(
//                  child: CachedNetworkImage(
//                    height: h,
//                    width: w,
//                    imageUrl: data.rightImgUrls[0],
//                    fit: BoxFit.cover,
//                    placeholder: (BuildContext context, String url) {
//                      return Image.asset(
//                        "images/default_place_holder.png",
//                        fit: BoxFit.cover,
//                      );
//                    },
//                  ),
//                  borderRadius:
//                      BorderRadius.all(Radius.circular(SizeCompat.pxToDp(15))),
//                ),
//              ),
//            ),
//          ],
//        ));
//  }

  Widget getBottom(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: FColors.divider))),
      height: SizeCompat.pxToDp(50),
    );

//      Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        getBase(),
//        Padding(
//            padding: EdgeInsets.only(
//                top: SizeCompat.pxToDp(20), bottom: SizeCompat.pxToDp(20)),
//            child: Text(
//              "${data.des}",
//              maxLines: 3,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                  color: Color(0xff868686), fontSize: SizeCompat.pxToDp(32)),
//            )),
//        Wrap(
//          alignment: WrapAlignment.start,
//          spacing: SizeCompat.pxToDp(30),
//          runSpacing: SizeCompat.pxToDp(20),
//          children: getWraps(),
//        ),
//      ],
//    );
  }

  Widget getWantSee() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "images/ic_collecte.png",
            width: SizeCompat.pxToDp(50),
            height: SizeCompat.pxToDp(50),
            color: Color(0xffFFB33E),
            colorBlendMode: BlendMode.srcATop,
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeCompat.pxToDp(20)),
            child: Text(
              "想看",
              style: TextStyle(
                  color: Color(0xffFFB33E), fontSize: SizeCompat.pxToDp(36)),
            ),
          ),
        ],
    );
  }

//  Widget getBase() {
//    return Container(
//      padding: EdgeInsets.only(
//        top: SizeCompat.pxToDp(40),
//      ),
//      child: Row(
//        children: <Widget>[
//          Expanded(
//            child: Column(
//              children: <Widget>[
//                Row(
//                  children: <Widget>[
//                    Text(data.name,
//                        overflow: TextOverflow.ellipsis,
//                        style: TextStyle(
//                            color: Color(0xff111111),
//                            fontSize: SizeCompat.pxToDp(50),
//                            decoration: TextDecoration.none,
//                            fontWeight: FontWeight.w400)),
//                    Text(data.beOnTime,
//                        overflow: TextOverflow.ellipsis,
//                        style: TextStyle(
//                            color: Color(0xff797979),
//                            fontSize: SizeCompat.pxToDp(50),
//                            decoration: TextDecoration.none,
//                            fontWeight: FontWeight.w200)),
//                  ],
//                ),
//                Row(
//                  children: <Widget>[
//                    Container(
//                        width: SizeCompat.pxToDp(120),
//                        margin: EdgeInsets.only(right: SizeCompat.pxToDp(10)),
//                        height: SizeCompat.pxToDp(28),
//                        child: GradeStart(data.star, 5,
//                            selectColor: Color(0xffFFAC2C),
//                            unSelectColor: Color(0xffeE6E6E6),
//                            size: SizeCompat.pxToDp(24))),
//                    Expanded(
//                      child: Text(data.score.toString(),
//                          overflow: TextOverflow.ellipsis,
//                          style: TextStyle(
//                              color: Color(0xff7c7c7c),
//                              fontSize: SizeCompat.pxToDp(28),
//                              decoration: TextDecoration.none,
//                              fontWeight: FontWeight.w200)),
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ),
//          Container(
//            width: SizeCompat.pxToDp(2),
//            height: SizeCompat.pxToDp(85),
//            decoration: BoxDecoration(color: Color(0xffDADADA)),
//          ),
//
//        ],
//      ),
//    );
//  }
}
