import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/subject_repos.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:firewood/widgets/listview/fwood_list_view.dart';
import 'package:flutter/material.dart';

import 'controller/subject_view_controller.dart';

// ignore: must_be_immutable
class TeleplayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TeleplayPageState();
  }
}

class _TeleplayPageState extends State<TeleplayPage> with AutomaticKeepAliveClientMixin {
  SubjectTeleplayRepos mSubjectTeleplayRepos = SubjectTeleplayRepos();
  List<TypeEntity> list;

  bool isLoading = false;

  @override
  void initState() {
    list = mSubjectTeleplayRepos.getSubjectList();
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
//          separatorBuilder: (BuildContext context, int index) {
//            return FVDivider(
//                height: SizeCompat.pxToDp(50), color: Colors.transparent);
//          },
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
      list.addAll(mSubjectTeleplayRepos.getSubjectLoadMore());
    });
  }

  @override
  bool get wantKeepAlive => true;
}
