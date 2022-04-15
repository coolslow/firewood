import 'package:firewood/entity/type_entity.dart';

class TitleTabEntity extends TypeEntity {
  List<String> tabs = <String>[];
  String router;
  String more;
  double fontSize;
  double horSpace;
  double verSpace;

  TitleTabEntity.create(
      {required this.tabs,
      required this.router,
      required this.more,
      required this.fontSize,
      required this.horSpace,
      required this.verSpace});

  @override
  getType() {
    return TypeEntity.typeSubjectTitleTab;
  }
}
