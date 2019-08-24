import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/recommend_repos.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => new _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  RecommendRepos mRecommendRepos = RecommendRepos.create();
  List<TypeEntity> mData;

  @override
  void initState() {
    mData = mRecommendRepos.getData(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.all(0),
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return RecommendUIController.create(mData[index]);
          },
          itemCount: mData.length),
    );
  }
}

class RecommendUIController {
  static Widget create(TypeEntity entity) {
    if (entity.getType() == TypeEntity.typeRecommendData) {
      return _createDataItem(entity);
    } else if (entity.getType() == TypeEntity.typeRecommendAD) {
      return _createADItem(entity);
    }
    return Container();
  }

  static Widget _createDataItem(TypeEntity entity) {
    Column result = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getBase(entity),
        getTopic(entity),
        getDescription(entity),
        getImages(entity),
        getToolbar(entity),
        getDivider(),
      ],
    );
    return result;
  }

  static Widget _createADItem(TypeEntity entity) {
    return new Text("");
  }

  static Widget getBase(TypeEntity entity) {
    // 35 + 35 + 80
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    Container result = Container(
      padding: EdgeInsets.only(
          left: SizeCompat.pxToDp(54), right: SizeCompat.pxToDp(54)),
      height: SizeCompat.pxToDp(150),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: SizeCompat.pxToDp(40),
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(data.portrait),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: SizeCompat.pxToDp(32), right: SizeCompat.pxToDp(32)),
              child: Text(
                data.name,
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff191919), fontSize: SizeCompat.pxToDp(38)),
              ),
            ),
          ),
          Container(
            height: SizeCompat.pxToDp(50),
            width: SizeCompat.pxToDp(50),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/ic_more.png"),
              colorFilter:
                  ColorFilter.mode(FColors.iconColorFilter, BlendMode.srcATop),
            )),
          ),
        ],
      ),
    );
    return result;
  }

  static Widget getTopic(TypeEntity entity) {
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    return Row(children: <Widget>[
    Container(
    alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
            left: SizeCompat.pxToDp(54), right: SizeCompat.pxToDp(54)),
        padding: EdgeInsets.only(
            left: SizeCompat.pxToDp(10), right: SizeCompat.pxToDp(20)),
        height: SizeCompat.pxToDp(70),
        decoration: BoxDecoration(
            color: Color(0xffF7F7F7), //
            borderRadius:
            BorderRadius.all(Radius.circular(SizeCompat.pxToDp(35)))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "images/ic_topic.png",
              height: SizeCompat.pxToDp(40),
              width: SizeCompat.pxToDp(40),
            ),
            Container(
                margin: EdgeInsets.only(left: SizeCompat.pxToDp(10)),
                child: Text(
                  data.topic,
                  maxLines: 1,
                  style: TextStyle(
                      color: FColors.primary, fontSize: SizeCompat.pxToDp(35)),
                )),
          ],
        )),
      Expanded(
        child: Container(),
      ),
    ],);




  }

  static Widget getDescription(TypeEntity entity) {
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    return Container(
      margin: EdgeInsets.only(
          left: SizeCompat.pxToDp(54),
          right: SizeCompat.pxToDp(54),
          top: SizeCompat.pxToDp(30),
          bottom: SizeCompat.pxToDp(26)),
      child: Text(
        data.description,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Color(0xff4A4A4A),
            fontSize: SizeCompat.pxToDp(40),
            height: 1),
      ),
    );
  }

  static Widget getImages(TypeEntity entity) {
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;

    if (data.images == null || data.images.length == 0) {
      return Container();
    }

    int length = data.images.length;
    switch (length) {
      case 1:
        return _getImages1(data.images);
      case 4:
        return _getImages4(data.images);
      case 2:
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      default:
        return _getImagesGrid(data.images);
    }
  }

  static Widget _getImages1(List<String> entity) {
    double w = SizeCompat.width() * 0.67;
    double h = w / 1.77;

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(54),
        right: SizeCompat.pxToDp(54),
      ),
      child: ClipRRect(
        child: FadeInImage.assetNetwork(
          placeholder: "images/default_place_holder.png",
          image: entity[0],
          width: w,
          height: h,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
      ),
    );
  }

  static Widget _getImages4(List<String> entity) {
    double itemSize = (SizeCompat.width() - SizeCompat.pxToDp(54.0 * 2)) / 3;

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(54),
      ),
      width: itemSize * 2,
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: SizeCompat.pxToDp(10),
            crossAxisSpacing: SizeCompat.pxToDp(10),
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: FadeInImage.assetNetwork(
                placeholder: "images/default_place_holder.png",
                image: entity[index],
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
            );
          },
          itemCount: entity.length),
    );
  }

  static Widget _getImagesGrid(List<String> entity) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(54),
        right: SizeCompat.pxToDp(54),
      ),
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: SizeCompat.pxToDp(10),
            crossAxisSpacing: SizeCompat.pxToDp(10),
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: FadeInImage.assetNetwork(
                placeholder: "images/default_place_holder.png",
                image: entity[index],
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
            );
          },
          itemCount: entity.length),
    );
  }

  static Widget getToolbar(TypeEntity entity) {
    // 50 58 40
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    return Container(
        padding: EdgeInsets.only(
            left: SizeCompat.pxToDp(54),
            right: SizeCompat.pxToDp(54),
            top: SizeCompat.pxToDp(50),
            bottom: SizeCompat.pxToDp(40)),
        height: SizeCompat.pxToDp(148),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: SizeCompat.pxToDp(8)),
                    height: SizeCompat.pxToDp(50),
                    width: SizeCompat.pxToDp(50),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(data.thumbed
                          ? "images/ic_thumbed_up.png"
                          : "images/ic_thumb_up.png"),
                      colorFilter: ColorFilter.mode(
                          FColors.iconColorFilter, BlendMode.srcATop),
                    )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: SizeCompat.pxToDp(1)),
                      child: Text(
                        "${data.thumbNumber}",
                        maxLines: 1,
                        style: TextStyle(
                            color: FColors.iconColorFilter,
                            fontSize: SizeCompat.pxToDp(30)),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: SizeCompat.pxToDp(8)),
                    height: SizeCompat.pxToDp(50),
                    width: SizeCompat.pxToDp(50),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(data.commented
                          ? "images/ic_commented.png"
                          : "images/ic_comment.png"),
                      colorFilter: ColorFilter.mode(
                          FColors.iconColorFilter, BlendMode.srcATop),
                    )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: SizeCompat.pxToDp(1)),
                      child: Text(
                        "${data.commentNumber}",
                        maxLines: 1,
                        style: TextStyle(
                            color: FColors.iconColorFilter,
                            fontSize: SizeCompat.pxToDp(30)),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: SizeCompat.pxToDp(8)),
                    height: SizeCompat.pxToDp(50),
                    width: SizeCompat.pxToDp(50),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(data.forwarded
                          ? "images/ic_forward.png"
                          : "images/ic_forward.png"),
                      colorFilter: ColorFilter.mode(
                          FColors.iconColorFilter, BlendMode.srcATop),
                    )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: SizeCompat.pxToDp(1)),
                      child: Text(
                        "${data.forwardNumber}",
                        maxLines: 1,
                        style: TextStyle(
                            color: FColors.iconColorFilter,
                            fontSize: SizeCompat.pxToDp(30)),
                      )),
                ],
              ),
            ),
          ],
        ));
  }

  static Widget getDivider() {
    return Container(
      height: SizeCompat.pxToDp(20),
      color: Color(0xffF4F4F4),
    );
  }
}
