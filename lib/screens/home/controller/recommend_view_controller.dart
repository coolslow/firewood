import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/bloc/recommend/recommend_toolbar_bloc.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/widgets/dialog/loading_dialog.dart';
import 'package:firewood/widgets/toast/Toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendViewController {
  RecommendToolbarBloc _toolbarBloc;

  RecommendViewController() {
    _toolbarBloc = RecommendToolbarBloc();
  }

  Widget create(BuildContext context, TypeEntity entity) {
    if (entity.getType() == TypeEntity.typeRecommendData) {
      return _createDataItem(context, entity);
    } else if (entity.getType() == TypeEntity.typeRecommendAD) {
      return _createADItem(entity);
    }
    return Container();
  }

  Widget _createDataItem(BuildContext context, TypeEntity entity) {
    Column result = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getBase(entity),
        _getTopic(entity),
        _getDescription(entity),
        _getImages(entity),
        _getToolbar(context, entity),
        _getDivider(),
      ],
    );
    return result;
  }

  Widget _createADItem(TypeEntity entity) {
    return new Text("");
  }

  Widget _getBase(TypeEntity entity) {
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
//            child: CachedNetworkImage(imageUrl: data.portrait),
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

  Widget _getTopic(TypeEntity entity) {
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;
    return Row(
      children: <Widget>[
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
                          color: FColors.primary,
                          fontSize: SizeCompat.pxToDp(35)),
                    )),
              ],
            )),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }

  Widget _getDescription(TypeEntity entity) {
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

  Widget _getImages(TypeEntity entity) {
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

  Widget _getImages1(List<String> entity) {
    double w = SizeCompat.width() * 0.67;
    double h = w / 1.77;

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(54),
        right: SizeCompat.pxToDp(54),
      ),
      width: SizeCompat.pxToDp(54) * 2 + w,
      height: h,
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: entity[0],
          width: w,
          height: h,
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) {
            return Image.asset("images/default_place_holder.png");
          },
        ),
//        child :FadeInImage.assetNetwork(
//          placeholder: "images/default_place_holder.png",
//          image: entity[0],
//          width: w,
//          height: h,
//          fit: BoxFit.cover,
//        ),
        borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
      ),
    );
  }

  Widget _getImages4(List<String> entity) {
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
              child: CachedNetworkImage(
                imageUrl: entity[index],
                fit: BoxFit.cover,
                placeholder: (BuildContext context, String url) {
                  return Image.asset("images/default_place_holder.png");
                },
              ),
//              child: FadeInImage.assetNetwork(
//                placeholder: "images/default_place_holder.png",
//                image: entity[index],
//                fit: BoxFit.cover,
//              ),
              borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
            );
          },
          itemCount: entity.length),
    );
  }

  Widget _getImagesGrid(List<String> entity) {
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
              child: CachedNetworkImage(
                imageUrl: entity[index],
                fit: BoxFit.cover,
                placeholder: (BuildContext context, String url) {
                  return Image.asset("images/default_place_holder.png");
                },
              ),
//             child:  FadeInImage.assetNetwork(
//                placeholder: "images/default_place_holder.png",
//                image: entity[index],
//                fit: BoxFit.cover,
//              ),
              borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
            );
          },
          itemCount: entity.length),
    );
  }

  Widget _getToolbar(BuildContext context, TypeEntity entity) {
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
        child: BlocBuilder<RecommendToolbarBloc, RecommendToolbarState>(
            bloc: _toolbarBloc,
            builder: (BuildContext context, RecommendToolbarState state) {
              return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          _clickThumb(context, data);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(top: SizeCompat.pxToDp(8)),
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
                                margin:
                                    EdgeInsets.only(left: SizeCompat.pxToDp(1)),
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
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          _clickComment(data);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(top: SizeCompat.pxToDp(8)),
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
                                margin:
                                    EdgeInsets.only(left: SizeCompat.pxToDp(1)),
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
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            onTap: () {
                              _clickForward(data);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      top: SizeCompat.pxToDp(8)),
                                  height: SizeCompat.pxToDp(50),
                                  width: SizeCompat.pxToDp(50),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(data.forwarded
                                        ? "images/ic_forward.png"
                                        : "images/ic_forward.png"),
                                    colorFilter: ColorFilter.mode(
                                        FColors.iconColorFilter,
                                        BlendMode.srcATop),
                                  )),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: SizeCompat.pxToDp(1)),
                                    child: Text(
                                      "${data.forwardNumber}",
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: FColors.iconColorFilter,
                                          fontSize: SizeCompat.pxToDp(30)),
                                    )),
                              ],
                            )))
                  ]);
            }));
  }

  Widget _getDivider() {
    return Container(
      height: SizeCompat.pxToDp(20),
      color: Color(0xffF4F4F4),
    );
  }

  void _clickThumb(BuildContext context, RecommendEntity data) {
    _toolbarBloc.dispatch(RecommendThumbLocalEvent(data));
  }

  void _clickComment(RecommendEntity data) {
    FToast.show("clickComment ${data.id}");
  }

  void _clickForward(RecommendEntity data) {
    FToast.show("clickForward ${data.id}");
  }
}
