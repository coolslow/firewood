import 'package:firewood/common/utils/utils.dart';

import '../type_entity.dart';

class MoveChampionEntity extends TypeEntity {
  List<MoveChampionItemEntity> data;

  MoveChampionEntity.create(this.data);

  @override
  getType() {
    return TypeEntity.typeSubjectChampion;
  }
}

class MoveChampionItemEntity {
  String id; // 唯一编号
  String imgUrl; // 海报
  String name; // 名称
  String des; // 名称

  String bgColor; //底色
  List<MoveChampionItemListEntity> list; // 榜单清单

  MoveChampionItemEntity.create(
      this.imgUrl, this.name, this.des, this.bgColor, this.list) {
    id = Utils.autoIncrement().toString();
  }
}

class MoveChampionItemListEntity {
  String name; //
  String score; //
  String sort;

  MoveChampionItemListEntity.create(this.name, this.score, this.sort);
}
