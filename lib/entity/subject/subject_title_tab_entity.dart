import 'package:firewood/entity/type_entity.dart';

class TitleTabEntity extends TypeEntity {
  List<String> tabs = List<String>();
  String router;
  String more;
  double fontSize;
  double horSpace;
  double verSpace;

  TitleTabEntity.create(
      {this.tabs,
      this.router,
      this.more,
      this.fontSize,
      this.horSpace,
      this.verSpace});

  @override
  getType() {
    return TypeEntity.typeSubjectTitleTab;
  }
}
