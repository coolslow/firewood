import 'package:bloc/bloc.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/repositories/recommend_repos.dart';
import 'package:firewood/widgets/toast/toast.dart';

/// event
class RecommendToolbarEvent {}

/// 点赞
class RecommendThumbLocalEvent extends RecommendToolbarEvent {
  RecommendEntity data;

  RecommendThumbLocalEvent(this.data);
}

class RecommendThumbNetworkEvent extends RecommendToolbarEvent {
  String msg;

  RecommendThumbNetworkEvent(this.msg);
}

/// state
class RecommendToolbarState {
  RecommendToolbarState();
}

/// bloc
class RecommendToolbarBloc
    extends Bloc<RecommendToolbarEvent, RecommendToolbarState> {
  RecommendRepos mRecommendRepos = RecommendRepos();

  @override
  RecommendToolbarState get initialState {
    return RecommendToolbarState();
  }

  int count = 1;

  @override
  Stream<RecommendToolbarState> mapEventToState(
      RecommendToolbarEvent event) async* {
    if (event is RecommendThumbLocalEvent) {
      RecommendEntity data = event.data;

      if (data.thumbed) {
        data.thumbNumber = data.thumbNumber - 1;
      } else {
        data.thumbNumber = data.thumbNumber + 1;
      }
      data.thumbed = !data.thumbed;
      yield RecommendToolbarState();

      mRecommendRepos.requestThumb(data,
          (RecommendEntity result, bool isSuccess) {
        if (!isSuccess) {
          if (result.thumbed) {
            result.thumbNumber = result.thumbNumber - 1;
          } else {
            result.thumbNumber = result.thumbNumber + 1;
          }
          result.thumbed = !result.thumbed;
          dispatch(RecommendThumbNetworkEvent("此文章无法点赞"));
        }
      });
    } else if (event is RecommendThumbNetworkEvent) {
      FToast.show(event.msg);
      yield RecommendToolbarState();
    }
  }
}
