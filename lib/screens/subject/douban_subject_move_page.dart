import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/banner_entity.dart';
import 'package:firewood/entity/divider_entity.dart';
import 'package:firewood/entity/subject/subject_move_champion_entity.dart';
import 'package:firewood/entity/subject/subject_move_grid_entity.dart';
import 'package:firewood/entity/subject/subject_move_interest_entity.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';
import 'package:firewood/entity/subject/subject_title_tab_entity.dart';
import 'package:firewood/entity/title_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/subject_repos.dart';
import 'package:firewood/screens/subject/widgets/subject_banner.dart';
import 'package:firewood/screens/subject/widgets/subject_champion.dart';
import 'package:firewood/screens/subject/widgets/subject_grid_view.dart';
import 'package:firewood/screens/subject/widgets/subject_interest.dart';
import 'package:firewood/screens/subject/widgets/subject_recommend.dart';
import 'package:firewood/screens/subject/widgets/subject_title.dart';
import 'package:firewood/screens/subject/widgets/subject_title_tab.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:firewood/widgets/listview/fwood_list_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovePageState();
  }
}

class _MovePageState extends State<MovePage> {
  SubjectRepos mSubjectRepos = SubjectRepos();
  List<TypeEntity> list;

  bool isLoading = false;

  @override
  void initState() {
    list = mSubjectRepos.getSubjectList();
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
            return getItem(list[index]);
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

    print("1==========>onLoadMore ${DateTime.now()} ");
    await Future.delayed(Duration(seconds: Utils.randomTime(2, 5)));
    print("2==========>onLoadMore ${DateTime.now()} ");

    setState(() {
      isLoading = false;
      list.addAll(mSubjectRepos.getLoadMore());
    });
  }

  Widget getItem(TypeEntity entity) {
    if (entity.getType() == TypeEntity.typeDivider) {
      // 分割线
      DividerEntity data = entity as DividerEntity;
      return FVDivider(height: data.size, color: data.color);
    } else if (entity.getType() == TypeEntity.typeTitle) {
      // title
      TitleEntity data = entity as TitleEntity;
      return SubjectTitle(title: data.title, des: data.more);
    } else if (entity.getType() == TypeEntity.typeSubjectTitleTab) {
      // TitleTab
      TitleTabEntity data = entity as TitleTabEntity;
      return SubjectTitleTab(data.tabs, data.more);
    } else if (entity.getType() == TypeEntity.typeBanner) {
      // Banner
      BannerEntity data = entity as BannerEntity;
      return SubjectBanner(List()..add(data.imgUrl), ratio: data.ratio);
    } else if (entity.getType() == TypeEntity.typeSubjectGrid) {
      // 九宫格布局
      MoveGridEntity data = entity as MoveGridEntity;
      return SubjectGridView(data.data);
    } else if (entity.getType() == TypeEntity.typeSubjectChampion) {
      // 榜单
      MoveChampionEntity data = entity as MoveChampionEntity;
      return SubjectChampion(data.data);
    } else if (entity.getType() == TypeEntity.typeSubjectRecommend) {
      // 推荐
      MoveRecommendEntity data = entity as MoveRecommendEntity;
      return SubjectRecommend(data);
    } else if (entity.getType() == TypeEntity.typeSubjectInterest) {
      // 喜欢
      MoveInterestEntity data = entity as MoveInterestEntity;
      return SubjectInterest(data);
    }
    return Container();
  }
}
