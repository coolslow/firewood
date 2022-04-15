import 'package:firewood/entity/banner_entity.dart';
import 'package:firewood/entity/divider_entity.dart';
import 'package:firewood/entity/subject/subject_champion_entity.dart';
import 'package:firewood/entity/subject/subject_grid_entity.dart';
import 'package:firewood/entity/subject/subject_move_interest_entity.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';
import 'package:firewood/entity/subject/subject_teleplay_recommend_entity.dart';
import 'package:firewood/entity/subject/subject_title_tab_entity.dart';
import 'package:firewood/entity/title_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/screens/subject/widgets/subject_banner.dart';
import 'package:firewood/screens/subject/widgets/subject_champion.dart';
import 'package:firewood/screens/subject/widgets/subject_grid_view.dart';
import 'package:firewood/screens/subject/widgets/subject_interest.dart';
import 'package:firewood/screens/subject/widgets/subject_recommend.dart';
import 'package:firewood/screens/subject/widgets/subject_teleplay_recommend.dart';
import 'package:firewood/screens/subject/widgets/subject_title.dart';
import 'package:firewood/screens/subject/widgets/subject_title_tab.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:flutter/widgets.dart';

class SubjectViewController {

  static Widget transform(TypeEntity entity) {
    if (entity.getType() == TypeEntity.typeDivider) {
      // 分割线
      DividerEntity data = entity as DividerEntity;
      return FVDivider(height: data.size, color: data.color);
    } else if (entity.getType() == TypeEntity.typeTitle) {
      // title
      TitleEntity data = entity as TitleEntity;
      return SubjectTitle(
          title: data.title, des: data.more, fontSize: data.fontSize);
    } else if (entity.getType() == TypeEntity.typeSubjectTitleTab) {
      // TitleTab
      TitleTabEntity data = entity as TitleTabEntity;
      return SubjectTitleTab(data.tabs, data.more,
          fontSize: data.fontSize,
          horSpace: data.horSpace,
          verSpace: data.verSpace);
    } else if (entity.getType() == TypeEntity.typeBanner) {
      // Banner
      BannerEntity data = entity as BannerEntity;
      return SubjectBanner([]..add(data.imgUrl), ratio: data.ratio);
    } else if (entity.getType() == TypeEntity.typeSubjectGrid) {
      // 九宫格布局
      GridEntity data = entity as GridEntity;
      return SubjectGridView(data.data);
    } else if (entity.getType() == TypeEntity.typeSubjectChampion) {
      // 榜单
      ChampionEntity data = entity as ChampionEntity;
      return SubjectChampion(data.data);
    } else if (entity.getType() == TypeEntity.typeSubjectMoveRecommend) {
      // 电影推荐
      MoveRecommendEntity data = entity as MoveRecommendEntity;
      return SubjectRecommend(data);
    } else if (entity.getType() == TypeEntity.typeSubjectInterest) {
      // 电影菜你喜欢
      MoveInterestEntity data = entity as MoveInterestEntity;
      return SubjectInterest(data);
    } else if (entity.getType() == TypeEntity.typeSubjectTeleplayRecommend) {
      // 电视剧推荐
      TeleplayRecommendEntity data = entity as TeleplayRecommendEntity;
      return SubjectTeleplayRecommend(data);
    }
    return Container();
  }
}
