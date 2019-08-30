import 'dart:async';

import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/dynamic_create_entity.dart';
import 'package:firewood/entity/dynamic_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/dynamic_repos.dart';
import 'package:firewood/repositories/subject_repos.dart';
import 'package:firewood/screens/subject/controller/subject_view_controller.dart';
import 'package:firewood/widgets/indicator/indicator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovePage extends StatelessWidget {
  SubjectViewController mSubjectViewController = SubjectViewController();
  SubjectRepos mSubjectRepos = SubjectRepos();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: mSubjectViewController.getGridView(mSubjectRepos.getGrid()),
      color: Color(0xFFF4F4F4),
    );
  }
}
