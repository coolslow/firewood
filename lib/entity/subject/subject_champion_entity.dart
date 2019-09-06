import 'package:firewood/common/utils/utils.dart';

import '../type_entity.dart';

class ChampionEntity extends TypeEntity {
  List<ChampionItemEntity> data;

  ChampionEntity.create(this.data);

  @override
  getType() {
    return TypeEntity.typeSubjectChampion;
  }
}

class ChampionItemEntity {
  String id; // 唯一编号
  String imgUrl; // 海报
  String name; // 名称
  String des; // 名称

  String bgColor; //底色
  List<ChampionItemListEntity> list; // 榜单清单

  ChampionItemEntity.create(
      this.imgUrl, this.name, this.des, this.bgColor, this.list) {
    id = Utils.autoIncrement().toString();
  }
}

class ChampionItemListEntity {
  String name; //
  String score; //
  String sort;

  ChampionItemListEntity.create(this.name, this.score, this.sort);
}
