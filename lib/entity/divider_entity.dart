import 'dart:ui';

import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/material.dart';

class DividerEntity extends TypeEntity {
  double size;
  Color color;

  DividerEntity.create({this.size = 0, this.color = Colors.transparent});

  @override
  getType() {
    return TypeEntity.typeDivider;
  }
}
