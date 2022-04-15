import 'dart:async';

import 'package:firewood/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class FListView extends StatefulWidget {
  @required
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final PageStateFactory pageState;
  bool isLoadMoreRunning = false;

  VoidCallback onRefresh;
  VoidCallback onLoadMore;
  EdgeInsets padding;

  FListView.builder(
      {required this.itemCount,
      required this.itemBuilder,
      required this.separatorBuilder,
      required this.onRefresh,
      required this.onLoadMore,
      this.isLoadMoreRunning = false,
      required this.padding,
      this.pageState = const PageStateFactory()})
      : assert(itemBuilder != null),
        assert(itemCount != null && itemCount >= 0) {
  }

  @override
  State<StatefulWidget> createState() {
    return _FListViewState();
  }
}

class _FListViewState extends State<FListView> {
  PageState pageState = PageState.Empty;
  Completer<Null> _refreshCompleter = Completer<Null>();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getBuilder();
  }

  Widget getBuilder() {
    if (widget.itemCount == 0) {
      if (widget.isLoadMoreRunning) {
        pageState = PageState.Loading;
      } else {
        pageState = PageState.Empty;
      }
    } else {
      pageState = PageState.Data;
    }

    if (pageState == PageState.Data) {
      return getListView();
    } else if (pageState == PageState.Empty) {
      // 数据空
      return widget.pageState.getEmpty();
    } else if (pageState == PageState.NoNetwork) {
      // 无网络
      return widget.pageState.getNoNetwork();
    } else if (pageState == PageState.Error) {
      // 错误
      return widget.pageState.getEmpty();
    } else if (pageState == PageState.Loading) {
      // 骨架
      return widget.pageState.getSkeleton();
    }
    return Container();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 0 && widget.onLoadMore != null) {
      _handleLoadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Null> _handleRefresh() async {
    if (widget.onRefresh != null) {
      widget.onRefresh();
    }
    return _refreshCompleter.future;
  }

  void _handleLoadMore() {
    if (widget.onLoadMore != null && !widget.isLoadMoreRunning) {
      widget.isLoadMoreRunning = true;
      widget.onLoadMore();
    }
  }

  Widget _getLoading() {
    return Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        height: 50,
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(FColors.iconColorFilter)),
          ),
        ));
  }

  Widget getListView() {
    if (widget.onRefresh != null) {
      // 支持下拉刷新
      _refreshCompleter.complete();
      _refreshCompleter = Completer();

      if (widget.separatorBuilder == null) {
        return RefreshIndicator(
          child: ListView.builder(
              padding: widget.padding,
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                if (widget.isLoadMoreRunning && widget.itemCount == index) {
                  return _getLoading();
                } else {
                  return widget.itemBuilder(context, index);
                }
              },
              itemCount: widget.isLoadMoreRunning == true
                  ? widget.itemCount + 1
                  : widget.itemCount),
          onRefresh: _handleRefresh,
        );
      } else {
        return RefreshIndicator(
          child: ListView.separated(
              padding: widget.padding,
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              separatorBuilder: (BuildContext context, int index) {
                return widget.separatorBuilder(context, index);
              },
              itemBuilder: (BuildContext context, int index) {
                if (widget.isLoadMoreRunning && widget.itemCount == index) {
                  return _getLoading();
                } else {
                  return widget.itemBuilder(context, index);
                }
              },
              itemCount: widget.isLoadMoreRunning == true
                  ? widget.itemCount + 1
                  : widget.itemCount),
          onRefresh: _handleRefresh,
        );
      }
    } else {
      // 不支持下拉刷新
      if (widget.separatorBuilder == null) {
        return ListView.builder(
            padding: widget.padding,
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (widget.isLoadMoreRunning && widget.itemCount == index) {
                return _getLoading();
              } else {
                return widget.itemBuilder(context, index);
              }
            },
            itemCount: widget.isLoadMoreRunning == true
                ? widget.itemCount + 1
                : widget.itemCount);
      } else {
        return ListView.separated(
            padding: widget.padding,
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            separatorBuilder: (BuildContext context, int index) {
              return widget.separatorBuilder(context, index);
            },
            itemBuilder: (BuildContext context, int index) {
              if (widget.isLoadMoreRunning && widget.itemCount == index) {
                return _getLoading();
              } else {
                return widget.itemBuilder(context, index);
              }
            },
            itemCount: widget.isLoadMoreRunning == true
                ? widget.itemCount + 1
                : widget.itemCount);
      }
    }
  }
}

enum PageState { Loading, Empty, NoNetwork, Error, Data }

class PageStateFactory {
  const PageStateFactory();

  Widget getSkeleton() {
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.white,
      child: Image.asset(
        "images/bg_skeleton_default.png",
//          color: Color(0xff7E7E7E),
//          colorBlendMode: BlendMode.srcATop,
      ),
    );
  }

  Widget getEmpty() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "images/ic_default_empty.png",
          width: 150,
          height: 150,
        ),
      ),
    );
  }

  Widget getNoNetwork() {
    return Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            "images/ic_default_network.png",
            width: 150,
            height: 150,
          ),
        ));
  }

  Widget getError() {
    return Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            "images/ic_default_error.png",
            width: 150,
            height: 150,
          ),
        ));
  }
}

//typedef LoadMoreCallback<T> = Future<T> Function();
