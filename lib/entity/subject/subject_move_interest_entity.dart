import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/type_entity.dart';

class MoveInterestEntity extends TypeEntity{
  late String id; // 唯一编号

  String name; // 电影名称
  String beOnTime; // 上映时间
  double star; // 星评
  double score; // 分数
  String des; // 名称

  bool collected = false;

  List<String> leftImgUrls; //  海报
  List<String> rightImgUrls; //  海报

  List<String> tags;

  MoveInterestEntity.create(
      {required this.name,
      required this.beOnTime,
      required this.star,
      required this.score,
      required this.des,
      required this.leftImgUrls,
      required this.rightImgUrls,
      this.collected = false,
      required this.tags}) {
    id = Utils.autoIncrement().toString();
  }

  @override
  getType() {
    return TypeEntity.typeSubjectInterest;
  }
}
