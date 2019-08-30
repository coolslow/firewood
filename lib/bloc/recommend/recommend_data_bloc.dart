import 'package:bloc/bloc.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:firewood/repositories/recommend_repos.dart';

/// event
class RecommendDataEvent {}

class RecommendFetchEvent extends RecommendDataEvent {
//  int pageStart = PageConstant.start;
//  int pageSize = PageConstant.size;
  bool isRefresh;

  RecommendFetchEvent({this.isRefresh = false});
}

/// state
class RecommendDataState {
  List<TypeEntity> data;
}

class RecommendInitState extends RecommendDataState {}

class RecommendLoadedState extends RecommendDataState {}

class RecommendLoadingState extends RecommendDataState {}

class RecommendThumbState extends RecommendDataState {}

/// bloc
class RecommendDataBloc extends Bloc<RecommendDataEvent, RecommendDataState> {
  int currPage = PageConstant.start;
  RecommendRepos mRecommendRepos = RecommendRepos();
  List<TypeEntity> mData = List<TypeEntity>();

  @override
  RecommendDataState get initialState {
//    print("initialState===");
    return RecommendInitState();
  }

  @override
  Stream<RecommendDataState> mapEventToState(RecommendDataEvent event) async* {
//    print("mapEventToState===$event");

    if (event is RecommendFetchEvent) {
      if (event.isRefresh) {
        currPage = PageConstant.start;
        Utils.resetAutoIncrement();
        mData.clear();
      } else {
        RecommendLoadingState loadingState = RecommendLoadingState();
        loadingState.data = mData;
        yield loadingState;
      }

      List<TypeEntity> data = await mRecommendRepos.getData(currPage);
      mData.addAll(data);
      currPage++;
      RecommendLoadedState loadedState = RecommendLoadedState();
      loadedState.data = mData;
      yield loadedState;
    }
  }
}
