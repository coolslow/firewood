import 'package:firewood/entity/type_entity.dart';

class TitleEntity extends TypeEntity {

  String title;
  String router;
  String more;

  TitleEntity.create({this.title, this.router, this.more});

  @override
  getType() {
    return TypeEntity.typeTitle;
  }
}
