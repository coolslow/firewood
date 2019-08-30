import 'dart:async';

import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/dynamic_create_entity.dart';
import 'package:firewood/entity/dynamic_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/dynamic_repos.dart';
import 'package:firewood/widgets/indicator/indicator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FictionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("小说"),
      ),
      color: Color(0xFFF4F4F4),
    );
  }
}
