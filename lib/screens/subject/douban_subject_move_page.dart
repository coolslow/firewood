import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/repositories/subject_repos.dart';
import 'package:firewood/screens/subject/widgets/subject_banner.dart';
import 'package:firewood/screens/subject/widgets/subject_champion.dart';
import 'package:firewood/screens/subject/widgets/subject_change_title.dart';
import 'package:firewood/screens/subject/widgets/subject_grid_view.dart';
import 'package:firewood/screens/subject/widgets/subject_recommend.dart';
import 'package:firewood/screens/subject/widgets/subject_title.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovePage extends StatelessWidget {
  SubjectRepos mSubjectRepos = SubjectRepos();

  double interval = SizeCompat.pxToDp(50);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[

        Divider(height: interval, color: Colors.transparent),
        SubjectBanner(
            List()
              ..add(
                  "https://img1.doubanio.com/view/dale-online/dale_ad/public/6d576a27b7fc979.jpg"),
            ratio: 6.5),
        Divider(height: interval, color: Colors.transparent),
        SubjectChangeTitle(),
        Divider(height: interval, color: Colors.transparent),
        SubjectGridView(mSubjectRepos.getGridHot()),
        Divider(height: interval, color: Colors.transparent),
        SubjectBanner(
            List()
              ..add(
                  "https://img3.doubanio.com/view/dale-online/dale_ad/public/877dfb7ef226f00.jpg"),
            ratio: 6.0),
        Divider(height: interval, color: Colors.transparent),
        SubjectTitle(title: "豆瓣热门", des: "全部 500"),
        Divider(height: interval, color: Colors.transparent),
        SubjectGridView(mSubjectRepos.getGridBeOn()),
        Divider(height: interval, color: Colors.transparent),
        SubjectBanner(
            List()
              ..add(
                  "https://img3.doubanio.com/img/files/file-1564477710-0.png"),
            ratio: 3.0),
        Divider(height: interval * 1.5, color: Colors.transparent),
        SubjectTitle(title: "豆瓣榜单", des: "全部 10"),
        Divider(height: interval, color: Colors.transparent),
        SubjectChampion(mSubjectRepos.getChampionData()),
        Divider(height: interval, color: Colors.transparent),
        SubjectTitle(title: "为你推进"),
        Divider(height: interval, color: Colors.transparent),
        SubjectRecommend(mSubjectRepos.getSubjectRecommend1()),
        Divider(height: interval, color: Colors.transparent),
        SubjectRecommend(mSubjectRepos.getSubjectRecommend2()),
        Divider(height: interval, color: Colors.transparent),
        SubjectRecommend(mSubjectRepos.getSubjectRecommend3()),
        Divider(height: interval, color: Colors.transparent),
        SubjectTitle(title: "猜你喜欢"),

      ],
    ));
  }
}
//https://img3.doubanio.com/img/files/file-1564477710-5.png
//https://img3.doubanio.com/img/files/file-1564477710-2.png
//https://img1.doubanio.com/img/files/file-1564477710-7.png
