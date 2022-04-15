import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/type_entity.dart';

class TeleplayRecommendEntity extends TypeEntity {

  late String id; // 唯一编号
  late String imgUrl; // 海报
  late String name; // 电影名称
  late String beOnTime; // 上映时间
  late double star; // 星评
  late double score; // 分数
  bool canPlay; // 是否可播放

  late String description; // 描述
  String hint; // 提示

  bool collected = false; // 是否收藏

  TeleplayRecommendEntity.create(this.imgUrl, this.name, this.beOnTime,
      this.star, this.score, this.description,
      {this.canPlay = true, this.hint = "您可能感兴趣"}) {
    id = Utils.autoIncrement().toString();
  }

  @override
  getType() {
    return TypeEntity.typeSubjectTeleplayRecommend;
  }
}
