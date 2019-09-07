import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopicWidget extends StatelessWidget {
  final TypeEntity entity;

  TopicWidget(this.entity);

  @override
  Widget build(BuildContext context) {
    return _getTopic(entity);
  }

  Widget _getTopic(TypeEntity entity) {
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    return Row(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                left: SizeCompat.pxToDp(54), right: SizeCompat.pxToDp(54)),
            padding: EdgeInsets.only(
                left: SizeCompat.pxToDp(10), right: SizeCompat.pxToDp(20)),
            height: SizeCompat.pxToDp(70),
            decoration: BoxDecoration(
                color: Color(0xffF7F7F7), //
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeCompat.pxToDp(35)))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  "images/ic_topic.png",
                  height: SizeCompat.pxToDp(40),
                  width: SizeCompat.pxToDp(40),
                ),
                Container(
                    margin: EdgeInsets.only(left: SizeCompat.pxToDp(10)),
                    child: Text(
                      data.topic,
                      maxLines: 1,
                      style: TextStyle(
                          color: FColors.primary,
                          fontSize: SizeCompat.pxToDp(35)),
                    )),
              ],
            )),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}
