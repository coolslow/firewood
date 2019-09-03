import 'package:firewood/common/utils/utils.dart';

class MoveRecommendEntity {
  String id; // 唯一编号
  String imgUrl; // 海报
  String title; // 名称
  String subTitle; // 名称
  String des; // 名称

  final String bgColor; //底色
  final String titleColor; //底色
  final String subTitleColor; //底色
  final String desColor; //底色
  final String btnColor; //底色
  final bool canPlay; //播放

  MoveRecommendEntity.create(this.imgUrl, this.title, this.subTitle, this.des,
      {this.bgColor = "ffffffff",
      this.canPlay = false,
      this.titleColor = "ffBFBFBF",
      this.subTitleColor = "ff191919",
      this.desColor = "ff878787",
      this.btnColor = "ffffffff"}) {
    id = Utils.autoIncrement().toString();
  }
}
