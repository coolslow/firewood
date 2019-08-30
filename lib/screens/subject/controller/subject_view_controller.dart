import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/bloc/recommend/recommend_toolbar_bloc.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/subject/subject_move_grid_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/widgets/dialog/loading_dialog.dart';
import 'package:firewood/widgets/gradestar/gradestar.dart';
import 'package:firewood/widgets/navigation/tab_bar.dart';
import 'package:firewood/widgets/toast/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectViewController {
  double gridViewHeight = ((SizeCompat.width() -
              2 * SizeCompat.pxToDp(20) -
              2 * SizeCompat.pxToDp(Dimens.appEdgeEdge)) /
          3) /
      0.714;

  Widget getGridView(List<MoveGridEntity> entity) {
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
            MoveGridEntity data = entity[index];

            return Column(
              children: <Widget>[
                ClipRRect(
                  child: Container(
                    height: gridViewHeight,
                    child: CachedNetworkImage(
                      imageUrl: data.imgUrl,
                      fit: BoxFit.fill,
                      placeholder: (BuildContext context, String url) {
                        return Image.asset("images/default_place_holder.png");
                      },
                    ),
                  ),
                  borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
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
                  children: <Widget>[//
                    Container(
                        width: SizeCompat.pxToDp(120),
                        margin: EdgeInsets.only(right: SizeCompat.pxToDp(10)),
                        height: SizeCompat.pxToDp(24),
                        child: GradeStart(data.star, 5,selectColor:Color(0xffFFAC2C),unSelectColor:Color(0xffeE6E6E6) ,
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
