import 'package:firewood/entity/type_entity.dart';

class DynamicEntity extends TypeEntity {
  static const int personalSponsor = 0;
  static const int doubanSponsor = 1;

  String portrait; // 头像
  String name; // 名称
  String topic; // 话题
  String description; // 描述
  int viewNumber; //浏览数

  int sponsor = doubanSponsor;// 发起者

  DynamicEntity.create(
      this.portrait, this.name, this.topic, this.description, this.viewNumber,
      {this.sponsor = personalSponsor});

  @override
  getType() {
    return TypeEntity.typeDynamicData;
  }
}
