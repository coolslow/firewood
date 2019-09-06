import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/subject/subject_grid_entity.dart';
import 'package:firewood/widgets/gradestar/gradestar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubjectGridView extends StatelessWidget {
  final double gridViewHeight = ((SizeCompat.width() -
              2 * SizeCompat.pxToDp(20) -
              2 * SizeCompat.pxToDp(Dimens.appEdgeEdge)) /
          3) /
      0.714;

  final List<GridItemEntity> entity;

  SubjectGridView(this.entity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
        right: SizeCompat.pxToDp(Dimens.appEdgeEdge),
      ),
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: SizeCompat.pxToDp(20),
            crossAxisSpacing: SizeCompat.pxToDp(20),
            childAspectRatio: 0.56,
          ),
          itemBuilder: (BuildContext context, int index) {
            GridItemEntity data = entity[index];

            return Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        height: gridViewHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(SizeCompat.pxToDp(10))),
                            border: Border.all(
                              color: Color(0xFFf7f8f9),
                              width: 0.5,
                            )),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(SizeCompat.pxToDp(10)),
                            child: CachedNetworkImage(
                              imageUrl: data.imgUrl,
                              fit: BoxFit.fill,
                              placeholder: (BuildContext context, String url) {
                                return Image.asset(
                                  "images/default_place_holder.png",
                                  fit: BoxFit.cover,
                                );
                              },
                            ))),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: data.collected
                            ? Container(
                                width: SizeCompat.pxToDp(70),
                                height: SizeCompat.pxToDp(70),
                                decoration: BoxDecoration(
                                    color: Color(0xffE5A034),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            SizeCompat.pxToDp(10)),
                                        bottomRight: Radius.circular(
                                            SizeCompat.pxToDp(10)))),
                                child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Image.asset(
                                    "images/ic_collected.png",
                                    color: Colors.white,
                                    colorBlendMode: BlendMode.srcATop,
                                    height: SizeCompat.pxToDp(65),
                                    width: SizeCompat.pxToDp(65),
                                  ),
                                ),
                              )
                            : Container(
                                width: SizeCompat.pxToDp(70),
                                height: SizeCompat.pxToDp(70),
                                decoration: BoxDecoration(
                                    color: Color(0xaa616161),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            SizeCompat.pxToDp(10)),
                                        bottomRight: Radius.circular(
                                            SizeCompat.pxToDp(10)))),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "images/ic_collecte.png",
                                    height: SizeCompat.pxToDp(60),
                                    width: SizeCompat.pxToDp(60),
                                    color: Colors.white,
                                    colorBlendMode: BlendMode.srcATop,
                                  ),
                                ),
                              ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeCompat.pxToDp(2),
                      top: SizeCompat.pxToDp(20),
                      bottom: SizeCompat.pxToDp(15)),
                  child: Row(
                    children: <Widget>[
                      data.canPlay
                          ? Container(
                              margin:
                                  EdgeInsets.only(right: SizeCompat.pxToDp(10)),
                              child: Image.asset(
                                "images/ic_can_play.png",
                                width: SizeCompat.pxToDp(34),
                                height: SizeCompat.pxToDp(34),
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Text(data.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff171717),
                                fontSize: SizeCompat.pxToDp(34),
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    //
                    Container(
                        width: SizeCompat.pxToDp(120),
                        margin: EdgeInsets.only(right: SizeCompat.pxToDp(10)),
                        height: SizeCompat.pxToDp(24),
                        child: GradeStart(data.star, 5,
                            selectColor: Color(0xffFFAC2C),
                            unSelectColor: Color(0xffeE6E6E6),
                            size: SizeCompat.pxToDp(24))),
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
              ],
            );
          },
          itemCount: entity.length),
    );
  }
}
