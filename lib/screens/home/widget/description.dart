import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DescriptionWidget extends StatelessWidget {
  final TypeEntity entity;

  DescriptionWidget(this.entity);

  @override
  Widget build(BuildContext context) {
    return _getDescription(entity);
  }

  Widget _getDescription(TypeEntity entity) {
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    return Container(
      margin: EdgeInsets.only(
          left: SizeCompat.pxToDp(54),
          right: SizeCompat.pxToDp(54),
          top: SizeCompat.pxToDp(30),
          bottom: SizeCompat.pxToDp(26)),
      child: Text(
        data.description,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Color(0xff4A4A4A),
            fontSize: SizeCompat.pxToDp(40),
            height: 1),
      ),
    );
  }
}
