import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/screens/home/widget/base_info.dart';
import 'package:firewood/screens/home/widget/description.dart';
import 'package:firewood/screens/home/widget/images.dart';
import 'package:firewood/screens/home/widget/toolbar.dart';
import 'package:firewood/screens/home/widget/topic.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecommendViewController {
  Widget create(BuildContext context, TypeEntity entity) {
    if (entity.getType() == TypeEntity.typeRecommendData) {
      return _createDataItem(context, entity);
    } else if (entity.getType() == TypeEntity.typeRecommendAD) {
      return _createADItem(entity);
    }
    return Container();
  }

  Widget _createDataItem(BuildContext context, TypeEntity entity) {
    Column result = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseInfoWidget(entity),
        TopicWidget(entity),
        DescriptionWidget(entity),
        ImageWidget(entity),
        ToolbarWidget(entity),
        FVDivider(height: SizeCompat.pxToDp(20), color: Color(0xffF4F4F4)),
      ],
    );
    return result;
  }

  Widget _createADItem(TypeEntity entity) {
    return new Text("");
  }
}
