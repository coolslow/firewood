import 'package:firewood/entity/type_entity.dart';

class DynamicCreateEntity extends TypeEntity {

  String date; //日期
  String topic; // 话题
  String description; // 描述

  DynamicCreateEntity.create(this.date, this.topic, this.description);

  @override
  getType() {
    return TypeEntity.typeDynamicCreate;
  }
}
