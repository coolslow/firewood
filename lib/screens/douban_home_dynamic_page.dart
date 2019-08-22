import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/dynamic_create_entity.dart';
import 'package:firewood/entity/dynamic_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/dynamic_repos.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DynamicPage extends StatelessWidget {
  double _vpFraction;

  DynamicUIController _controller = DynamicUIController();

  List<TypeEntity> mData = List<TypeEntity>();

  DynamicRepos mDynamicRepos = DynamicRepos.create();
  double _offset = 145;

  DynamicPage() {
    double width = SizeCompat.width();
    _vpFraction = (width - SizeCompat.pxToDp(_offset * 2)) / width;
    mData = mDynamicRepos.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                left: SizeCompat.pxToDp(_offset),
                right: SizeCompat.pxToDp(40),
                top: SizeCompat.pxToDp(65),
                bottom: SizeCompat.pxToDp(20)),
            child: Text(
              mDynamicRepos.getLabel(),
              style: TextStyle(
                  color: Color(0xff363636), fontSize: SizeCompat.pxToDp(40)),
            ),
          ),
          Expanded(
              child: Container(
                  constraints: BoxConstraints(minHeight: SizeCompat.pxToDp(1000)),
                  margin: EdgeInsets.only(bottom: SizeCompat.pxToDp(200)),
                  child: PageView.builder(
                    controller: PageController(viewportFraction: _vpFraction),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return _controller.create(context, mData[index]);
                    },
                    itemCount: mData.length,
                  ))),
        ],
      ),
      color: Color(0xFFF4F4F4),
    );
  }
}

class DynamicUIController {
  Widget create(BuildContext context, TypeEntity entity) {
    if (entity.getType() == TypeEntity.typeDynamicCreate) {
      return _createCreateItem(entity);
    } else if (entity.getType() == TypeEntity.typeDynamicData) {
      return _createDataItem(entity);
    }
    return Container();
  }

  Widget _createCreateItem(TypeEntity entity) {
    return Stack(children: <Widget>[
      Container(
          margin: EdgeInsets.only(
              left: SizeCompat.pxToDp(0), right: SizeCompat.pxToDp(40)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: new Border.all(color: Color(0xFFf7f7f7), width: 1), //
            borderRadius: BorderRadius.circular(SizeCompat.pxToDp(40)),
          )),
      Positioned(
        right: SizeCompat.pxToDp(40),
        bottom: SizeCompat.pxToDp(180),
        child: Image.asset(
          "images/bg_compose_artwork.png",
          height: SizeCompat.pxToDp(200),
          width: SizeCompat.pxToDp(200) * 2.11,
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: SizeCompat.pxToDp(40)),
        padding: EdgeInsets.only(
          top: SizeCompat.pxToDp(65),
          left: SizeCompat.pxToDp(54),
          right: SizeCompat.pxToDp(54),
          bottom: SizeCompat.pxToDp(100),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _getCreateDate(entity),
            _getCreateTitle(entity),
            _getCreateDescription(entity),
            _getPlaceholder(),
            _getJoin("写点什么"),
          ],
        ),
      )
    ]);
  }

  Widget _createDataItem(TypeEntity entity) {
    return Stack(children: <Widget>[
      Container(
          margin: EdgeInsets.only(right: SizeCompat.pxToDp(40)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: new Border.all(color: Color(0xFFf7f7f7), width: 1), //
            borderRadius: BorderRadius.circular(SizeCompat.pxToDp(40)),
          )),
      Positioned(
        right: SizeCompat.pxToDp(60),
        bottom: SizeCompat.pxToDp(80),
        child: Image.asset(
          "images/ic_topic.png",
          height: SizeCompat.pxToDp(280),
          width: SizeCompat.pxToDp(280),
          fit: BoxFit.fill,
          color: Color(0xffF0FCF1),
          colorBlendMode: BlendMode.srcATop,
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: SizeCompat.pxToDp(40)),
        padding: EdgeInsets.only(
          top: SizeCompat.pxToDp(65),
          left: SizeCompat.pxToDp(54),
          right: SizeCompat.pxToDp(54),
          bottom: SizeCompat.pxToDp(80),
        ),
        child: Column(
          children: <Widget>[
            _getBaseInfo(entity),
            _getDataTopic(entity),
            _getDataDescription(entity),
            _getPlaceholder(),
            _getJoin("参与话题"),
          ],
        ),
      )
    ]);
  }

  Widget _getBaseInfo(TypeEntity entity) {
    // 35 + 35 + 80
    if (!(entity is DynamicEntity)) {
      return Container();
    }
    DynamicEntity data = entity as DynamicEntity;

    Widget avatar;
    if (data.sponsor == DynamicEntity.personalSponsor) {
      avatar = CircleAvatar(
        radius: SizeCompat.pxToDp(35),
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(data.portrait),
      );
    } else if (data.sponsor == DynamicEntity.doubanSponsor) {
      avatar = Image(
        image: AssetImage("images/ic_topic.png"),
        width: SizeCompat.pxToDp(70),
        height: SizeCompat.pxToDp(70),
      );
    } else {
      avatar = Container();
    }

    Container result = Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatar,
          Container(
            margin: EdgeInsets.only(left: SizeCompat.pxToDp(20)),
            child: Text(
              data.name,
              maxLines: 1,
              style: TextStyle(
                  color: Color(0xff0e0e0e), fontSize: SizeCompat.pxToDp(38)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: SizeCompat.pxToDp(25)),
            child: Text(
              "发起",
              maxLines: 1,
              style: TextStyle(
                  color: Color(0xff858585), fontSize: SizeCompat.pxToDp(38)),
            ),
          ),
        ],
      ),
    );
    return result;
  }

  Widget _getDataTopic(TypeEntity entity) {
    if (!(entity is DynamicEntity)) {
      return Container();
    }
    DynamicEntity data = entity as DynamicEntity;
    return Container(
      margin: EdgeInsets.only(top: SizeCompat.pxToDp(25)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: SizeCompat.pxToDp(15)),
            child: Image.asset(
              "images/ic_topic.png",
              height: SizeCompat.pxToDp(54),
              width: SizeCompat.pxToDp(54),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: SizeCompat.pxToDp(10)),
                child: Text(
                  data.topic,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                      color: Color(0xff191919),
                      fontSize: SizeCompat.pxToDp(58),
                      fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
    );
  }

  Widget _getDataDescription(TypeEntity entity) {
    if (!(entity is DynamicEntity)) {
      return Container();
    }
    DynamicEntity data = entity as DynamicEntity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: SizeCompat.pxToDp(58)),
          child: Text(
            data.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
                color: Color(0xff606060),
                fontSize: SizeCompat.pxToDp(40),
                height: 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: SizeCompat.pxToDp(38)),
          child: Text(
            _converter(data.viewNumber),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
                color: Color(0xff959595),
                fontSize: SizeCompat.pxToDp(30),
                height: 1),
          ),
        ),
      ],
    );
  }

  Widget _getPlaceholder() {
    return Expanded(
      child: Container(),
    );
  }

  Widget _getJoin(String doc) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: FColors.primary,
              borderRadius: BorderRadius.circular(SizeCompat.pxToDp(20))),
          padding: EdgeInsets.only(
              top: SizeCompat.pxToDp(30),
              bottom: SizeCompat.pxToDp(30),
              left: SizeCompat.pxToDp(80),
              right: SizeCompat.pxToDp(80)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: SizeCompat.pxToDp(10)),
                width: SizeCompat.pxToDp(40),
                height: SizeCompat.pxToDp(40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/ic_compose.png"),
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcATop)),
                ),
              ),
              Text(
                doc,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeCompat.pxToDp(40),
                    height: 1),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  String _converter(int number) {
    if (number ~/ 10000 >= 1) {
      return "${number / 10000}万次浏览";
    } else {
      return "${number.toDouble()}次浏览";
    }
  }

  Widget _getCreateDate(TypeEntity entity) {
    if (!(entity is DynamicCreateEntity)) {
      return Container();
    }
    DynamicCreateEntity data = entity as DynamicCreateEntity;
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: SizeCompat.pxToDp(25)),
      child: Text(
        data.date,
        maxLines: 1,
        style: TextStyle(
            color: Color(0xff858585), fontSize: SizeCompat.pxToDp(38)),
      ),
    );
  }

  Widget _getCreateTitle(TypeEntity entity) {
    if (!(entity is DynamicCreateEntity)) {
      return Container();
    }
    DynamicCreateEntity data = entity as DynamicCreateEntity;
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: SizeCompat.pxToDp(25)),
      child: Container(
          margin: EdgeInsets.only(left: SizeCompat.pxToDp(10)),
          child: Text(
            data.topic,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(
                color: Color(0xff191919),
                fontSize: SizeCompat.pxToDp(58),
                fontWeight: FontWeight.w600),
          )),
    );
  }

  Widget _getCreateDescription(TypeEntity entity) {
    if (!(entity is DynamicCreateEntity)) {
      return Container();
    }
    DynamicCreateEntity data = entity as DynamicCreateEntity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: SizeCompat.pxToDp(58)),
          child: Text(
            data.description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
                color: Color(0xff606060),
                fontSize: SizeCompat.pxToDp(40),
                height: 1),
          ),
        ),
      ],
    );
  }
}
