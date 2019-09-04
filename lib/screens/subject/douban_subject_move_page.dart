import 'package:firewood/common/utils/size_compat.dart';
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
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovePage extends StatelessWidget {
  SubjectRepos mSubjectRepos = SubjectRepos();

  double interval = SizeCompat.pxToDp(50);
  List<TypeEntity> list;

  MovePage() {
    list = mSubjectRepos.getSubjectList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView.separated(
          padding: EdgeInsets.only(top: SizeCompat.pxToDp(50)),
          itemBuilder: (BuildContext context, int index) {
            TypeEntity entity = list[index];
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
          },
          separatorBuilder: (BuildContext context, int index) {
            return FVDivider(height: interval, color: Colors.transparent);
          },
          itemCount: list.length,
        ));
  }

}
