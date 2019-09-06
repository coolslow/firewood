import 'dart:async';

import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/dynamic_create_entity.dart';
import 'package:firewood/entity/dynamic_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/dynamic_repos.dart';
import 'package:firewood/repositories/subject_repos.dart';
import 'package:firewood/screens/subject/controller/subject_view_controller.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:firewood/widgets/indicator/indicator.dart';
import 'package:firewood/widgets/listview/fwood_list_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReadPageState();
  }
}

class _ReadPageState extends State<ReadPage> with AutomaticKeepAliveClientMixin {
  SubjectMoveRepos mSubjectMoveRepos = SubjectMoveRepos();
  List<TypeEntity> list;

  bool isLoading = false;

  @override
  void initState() {
    list = mSubjectMoveRepos.getSubjectList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FListView.builder(
          padding: EdgeInsets.only(top: SizeCompat.pxToDp(50)),
          isLoadMoreRunning: isLoading,
          onLoadMore: _onLoadMore,
          itemBuilder: (BuildContext context, int index) {
            return SubjectViewController.transform(list[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return FVDivider(
                height: SizeCompat.pxToDp(50), color: Colors.transparent);
          },
          itemCount: list.length,
        ));
  }

  void _onLoadMore() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: Utils.randomTime(2, 4)));

    setState(() {
      isLoading = false;
      list.addAll(mSubjectMoveRepos.getSubjectLoadMore());
    });
  }

  @override
  bool get wantKeepAlive => true;
}
