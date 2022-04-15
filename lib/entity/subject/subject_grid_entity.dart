import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/type_entity.dart';

class GridEntity extends TypeEntity {
  List<GridItemEntity> data;

  GridEntity.create(this.data);

  @override
  getType() {
    return TypeEntity.typeSubjectGrid;
  }
}

class GridItemEntity {
  late String id; // 唯一编号
  late String imgUrl; // 海报
  late String name; // 电影名称
  late double star; // 星评
  late double score; // 分数
  bool canPlay; // 是否可播放

  bool collected = false; // 是否收藏

  GridItemEntity.create(this.imgUrl, this.name, this.star, this.score,
      {this.collected = false, this.canPlay = false}) {
    id = Utils.autoIncrement().toString();
  }
}
