import 'package:firewood/entity/type_entity.dart';

class TitleEntity extends TypeEntity {
  String title;
  String router;
  String more;
  double fontSize;

  TitleEntity.create({required this.title, required this.router, required this.more, this.fontSize = 56});

  @override
  getType() {
    return TypeEntity.typeTitle;
  }
}
