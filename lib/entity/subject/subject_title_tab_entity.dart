import 'package:firewood/entity/type_entity.dart';

class TitleTabEntity extends TypeEntity {

  List<String> tabs = List<String>();
  String router;
  String more;

  TitleTabEntity.create({this.tabs, this.router, this.more});

  @override
  getType() {
    return TypeEntity.typeSubjectTitleTab;
  }
}
