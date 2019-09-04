import 'package:firewood/entity/type_entity.dart';

class BannerEntity extends TypeEntity {
  String imgUrl;
  String router;
  double ratio;

  BannerEntity.create({this.imgUrl, this.router, this.ratio = 3});

  @override
  getType() {
    return TypeEntity.typeBanner;
  }
}
