import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/repositories/recommend_repos.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => new _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  RecommendRepos mRecommendRepos = RecommendRepos.create();
  List<RecommendEntity> mData;

  @override
  void initState() {
    mData = mRecommendRepos.getData(0, 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Text(mData[index].description);
          },
          itemCount: mData.length),
    );
  }
}
