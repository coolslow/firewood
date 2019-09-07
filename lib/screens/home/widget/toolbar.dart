import 'package:firewood/bloc/recommend/recommend_toolbar_bloc.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/widgets/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ToolbarWidget extends StatelessWidget {
  final TypeEntity entity;
  RecommendToolbarBloc _toolbarBloc;

  ToolbarWidget(this.entity) {
    _toolbarBloc = RecommendToolbarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return _getToolbar(context, entity);
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
