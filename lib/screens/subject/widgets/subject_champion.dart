import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/color_util.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/subject/subject_champion_entity.dart';
import 'package:firewood/widgets/divider/h_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SubjectChampion extends StatelessWidget {
  List<ChampionItemEntity> list;

  SubjectChampion(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeCompat.pxToDp(660),
        child: ListView.separated(
          padding: EdgeInsets.only(
              left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
              right: SizeCompat.pxToDp(Dimens.appEdgeEdge)),
          itemBuilder: (BuildContext context, int index) {
            return getItem(context, list[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return FHDivider(width: SizeCompat.pxToDp(20));
          },
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
        ));
  }

  Widget getItem(BuildContext context, ChampionItemEntity entity) {
    return Container(
      width: SizeCompat.pxToDp(660),
      child: Column(
        children: <Widget>[
          getTop(context, entity),
          getBottom(context, entity),
        ],
      ),
    );
  }

  Widget getTop(BuildContext context, ChampionItemEntity entity) {
    return Container(
      height: SizeCompat.pxToDp(330),
      width: SizeCompat.pxToDp(660),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            child: Container(
              child: CachedNetworkImage(
                height: SizeCompat.pxToDp(330),
                width: SizeCompat.pxToDp(660),
                imageUrl: entity.imgUrl,
                fit: BoxFit.cover,
                placeholder: (BuildContext context, String url) {
                  return Image.asset("images/default_place_holder.png",
                      fit: BoxFit.cover,
                      height: SizeCompat.pxToDp(330),
                      width: SizeCompat.pxToDp(660));
                },
              ),
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeCompat.pxToDp(15)),
                topRight: Radius.circular(SizeCompat.pxToDp(15))),
          ),
          Positioned(
            right: SizeCompat.pxToDp(30),
            top: SizeCompat.pxToDp(30),
            child: Text(
              entity.des,
              style: TextStyle(
                  fontSize: SizeCompat.pxToDp(30), color: Colors.white),
            ),
          ),
          Positioned(
            left: SizeCompat.pxToDp(50),
            bottom: SizeCompat.pxToDp(30),
            child: Text(
              entity.name,
              style: TextStyle(
                fontSize: SizeCompat.pxToDp(50),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBottom(BuildContext context, ChampionItemEntity entity) {
    return Container(
      alignment: Alignment.centerRight,
      height: SizeCompat.pxToDp(330),
      width: SizeCompat.pxToDp(660),
      decoration: BoxDecoration(
          color: ColorUtil.parse(entity.bgColor),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeCompat.pxToDp(15)),
              bottomRight: Radius.circular(SizeCompat.pxToDp(15)))),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
            top: SizeCompat.pxToDp(5)),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(
                left: SizeCompat.pxToDp(50),
                right: SizeCompat.pxToDp(50),
                bottom: SizeCompat.pxToDp(15),
                top: SizeCompat.pxToDp(15)),
            child: Row(
              children: <Widget>[
                Text(
                  "${index + 1}.${entity.list[index].name}",
                  style: TextStyle(
                      color: Colors.white, fontSize: SizeCompat.pxToDp(34)),
                ),
                Text(
                  "  ${entity.list[index].score}",
                  style: TextStyle(
                      color: Color(0xffDC982F),
                      fontSize: SizeCompat.pxToDp(34)),
                ),
                Expanded(
                  child: Padding(padding: EdgeInsets.all(0)),
                ),
                Text(
                  "  ${entity.list[index].sort}",
                  style: TextStyle(
                      color: Colors.white, fontSize: SizeCompat.pxToDp(34)),
                ),
              ],
            ),
          );
        },
        itemCount: entity.list.length,
      ),
    );
  }
}
