import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/type_entity.dart';

class MoveGridEntity extends TypeEntity {
  List<MoveGridItemEntity> data;

  MoveGridEntity.create(this.data);

  @override
  getType() {
    return TypeEntity.typeSubjectGrid;
  }
}

class MoveGridItemEntity {
  String id; // 唯一编号
  String imgUrl; // 海报
  String name; // 电影名称
  double star; // 星评
  double score; // 分数
  bool canPlay; // 是否可播放

  bool collected = false; // 是否收藏

  MoveGridItemEntity.create(this.imgUrl, this.name, this.star, this.score,
      {this.collected = false, this.canPlay = false}) {
    id = Utils.autoIncrement().toString();
  }
}
