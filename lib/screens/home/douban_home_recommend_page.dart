import 'package:firewood/bloc/recommend/recommend_data_bloc.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/screens/home/controller/recommend_view_controller.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:firewood/widgets/listview/fwood_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage>   {
  // late RecommendDataBloc mRecommendDataBloc;
  RecommendViewController mRecommendViewController = RecommendViewController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecommendDataBloc>(context).add(RecommendFetchEvent(isRefresh: true));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<RecommendDataBloc, RecommendDataState>(
        builder: (BuildContext context, RecommendDataState state) {
          bool isLoading = false;
          if (state is RecommendLoadingState) {
            isLoading = true;
          } else if (state is RecommendLoadedState) {
            isLoading = false;
          }
          int itemCount = state.data == null ? 0 : state.data.length;
          return
//            LoadingView(
//            isLoading:isLoading,
//            child:
              FListView.builder(
                  padding: EdgeInsets.only(top: SizeCompat.pxToDp(50)),
                  onRefresh: _onRefresh,
                  onLoadMore: _onLoadMore,
                  isLoadMoreRunning: isLoading,
                  itemBuilder: (BuildContext context, int index) {
                    return mRecommendViewController.create(
                        context, state.data[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return FVDivider(
                        height: SizeCompat.pxToDp(50), color: Colors.transparent);
                  },
                  itemCount: itemCount);
//          );
        },
      ),
    );
  }

  void _onRefresh() {
//    print("==========>_onRefresh");
    BlocProvider.of<RecommendDataBloc>(context).add(RecommendFetchEvent(isRefresh: true));
  }

  void _onLoadMore() {
//    print("1==========>onLoadMore ${DateTime.now()} ");
    BlocProvider.of<RecommendDataBloc>(context).add(RecommendFetchEvent());
//    print("2==========>onLoadMore ${DateTime.now()} ");
  }

  // @override
  // bool get wantKeepAlive => true;
}
