import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseInfoWidget extends StatelessWidget {
  final TypeEntity entity;

  BaseInfoWidget(this.entity);

  @override
  Widget build(BuildContext context) {
    return _getBase(entity);
  }

  Widget _getBase(TypeEntity entity) {
    // 35 + 35 + 80
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    Container result = Container(
      padding: EdgeInsets.only(
          left: SizeCompat.pxToDp(54), right: SizeCompat.pxToDp(54)),
      height: SizeCompat.pxToDp(150),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: SizeCompat.pxToDp(40),
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(data.portrait),
//            child: CachedNetworkImage(imageUrl: data.portrait),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: SizeCompat.pxToDp(32), right: SizeCompat.pxToDp(32)),
              child: Text(
                data.name,
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff191919), fontSize: SizeCompat.pxToDp(38)),
              ),
            ),
          ),
          Container(
            height: SizeCompat.pxToDp(50),
            width: SizeCompat.pxToDp(50),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/ic_more.png"),
              colorFilter:
                  ColorFilter.mode(FColors.iconColorFilter, BlendMode.srcATop),
            )),
          ),
        ],
      ),
    );
    return result;
  }
}
