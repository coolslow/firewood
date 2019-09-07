import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/color_util.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/subject/subject_move_interest_entity.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';
import 'package:firewood/widgets/divider/dashed_divider.dart';
import 'package:firewood/widgets/gradestar/gradestar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SubjectInterest extends StatelessWidget {
  MoveInterestEntity data;

  SubjectInterest(this.data);

  @override
  Widget build(BuildContext context) {
    return getItem(context);
  }

//  decoration: BoxDecoration(
//  boxShadow: [
//  BoxShadow(
//  color: Color(0xFFBDBDBD),//Color(0xfff7f7f7)
//  offset: Offset(1.0, 1.0),
//  blurRadius: 10.0,
//  spreadRadius: 5.0)
//  ]
//  ),

  Widget getItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
          bottom: SizeCompat.pxToDp(Dimens.appEdgeEdge),
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
    double h = w / 2.5;
    return Container(
        height: h,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: FColors.shadow, //Color(0xfff7f7f7)
                        offset: Offset(1.0, 1.0),
                        blurRadius: 10.0,
                        spreadRadius: 5.0)
                  ]),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      width: w,
                      height: h,
                      imageUrl: data.leftImgUrls[0],
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
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeCompat.pxToDp(15))),
                  ),
                )),
            VerticalDivider(
              width: SizeCompat.pxToDp(15),
              color: Colors.transparent,
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: FColors.shadow, //Color(0xfff7f7f7)
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,
                      spreadRadius: 5.0)
                ]),
                child: ClipRRect(
                  child: CachedNetworkImage(
                    height: h,
                    width: w,
                    imageUrl: data.rightImgUrls[0],
                    fit: BoxFit.cover,
                    placeholder: (BuildContext context, String url) {
                      return Image.asset(
                        "images/default_place_holder.png",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeCompat.pxToDp(15))),
                ),
              ),
            ),
          ],
        ));
  }

  Widget getBottom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getBase(),
        Padding(
            padding: EdgeInsets.only(
                top: SizeCompat.pxToDp(20), bottom: SizeCompat.pxToDp(20)),
            child: Text(
              "${data.des}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color(0xff868686), fontSize: SizeCompat.pxToDp(32)),
            )),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: SizeCompat.pxToDp(30),
          runSpacing: SizeCompat.pxToDp(20),
          children: getWraps(),
        ),
      ],
    );
  }

  List<Widget> getWraps() {
    List<Widget> list = List<Widget>();
    data.tags?.forEach((source) {
      list.add(Container(
          padding: EdgeInsets.only(
              top: SizeCompat.pxToDp(10),
              bottom: SizeCompat.pxToDp(10),
              left: SizeCompat.pxToDp(30),
              right: SizeCompat.pxToDp(20)),
          decoration: BoxDecoration(
              color: Color(0xffF7EFE4),
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeCompat.pxToDp(60)))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "$source ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xff84642F), fontSize: SizeCompat.pxToDp(30)),
              ),
              Image.asset(
                "images/ic_arrow_forward.png",
                width: SizeCompat.pxToDp(30),
                height: SizeCompat.pxToDp(30),
                color: Color(0xff84642F),
                colorBlendMode: BlendMode.srcATop,
              )
            ],
          )));
    });

    return list;
  }

  Widget getBase() {
    return Container(
      padding: EdgeInsets.only(
        top: SizeCompat.pxToDp(40),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(data.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff111111),
                            fontSize: SizeCompat.pxToDp(50),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400)),
                    Text(data.beOnTime,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff797979),
                            fontSize: SizeCompat.pxToDp(50),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w200)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                        width: SizeCompat.pxToDp(120),
                        margin: EdgeInsets.only(right: SizeCompat.pxToDp(10)),
                        height: SizeCompat.pxToDp(28),
                        child: GradeStart(data.star, 5,
                            selectColor: Color(0xffFFAC2C),
                            unSelectColor: Color(0xffeE6E6E6),
                            size: SizeCompat.pxToDp(24))),
                    Expanded(
                      child: Text(data.score.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xff7c7c7c),
                              fontSize: SizeCompat.pxToDp(28),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w200)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: SizeCompat.pxToDp(2),
            height: SizeCompat.pxToDp(85),
            child: DashedDivider(),
//            decoration: BoxDecoration(color: Color(0xffDADADA)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeCompat.pxToDp(40), right: SizeCompat.pxToDp(40)),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "images/ic_collecte.png",
                  width: SizeCompat.pxToDp(50),
                  height: SizeCompat.pxToDp(50),
                  color: Color(0xffFFB33E),
                  colorBlendMode: BlendMode.srcATop,
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeCompat.pxToDp(5)),
                  child: Text(
                    "想看",
                    style: TextStyle(
                        color: Color(0xffFFB33E),
                        fontSize: SizeCompat.pxToDp(30)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
