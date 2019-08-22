import 'package:firewood/entity/type_entity.dart';

class RecommendEntity extends TypeEntity {
  String portrait; // 头像
  String name; // 名称
  String topic; // 话题
  String description; // 描述
  List<String> images; // 图片
  int thumbNumber; // 赞数
  int commentNumber; // 评论数
  int forwardNumber; // 转发数
  int collectNumber; // 收藏数

  bool thumbed = false; // 自己是否赞过
  bool commented = false; // 自己是否评论过
  bool forwarded = false; // 自己是否转发过
  bool collected = false; // 自己是否收藏过

  RecommendEntity.create(
      this.portrait,
      this.name,
      this.topic,
      this.description,
      this.images,
      this.thumbNumber,
      this.commentNumber,
      this.forwardNumber,
      this.collectNumber,
      {bool thumbed = false,
      bool commented = false,
      bool forwarded = false,
      bool collected = false});

  @override
  getType() {
    return TypeEntity.typeRecommendData;
  }
}
