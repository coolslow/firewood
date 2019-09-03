import 'package:firewood/common/utils/utils.dart';

class MoveChampionEntity {
  String id; // 唯一编号
  String imgUrl; // 海报
  String name; // 名称
  String des; // 名称

  String bgColor; //底色
  List<SubjectChampion> list; // 榜单清单

  MoveChampionEntity.create(
      this.imgUrl, this.name, this.des, this.bgColor, this.list) {
    id = Utils.autoIncrement().toString();
  }
}


class SubjectChampion{

  String name; //
  String score; //
  String sort;

  SubjectChampion.create(this.name,this.score,this.sort);
}