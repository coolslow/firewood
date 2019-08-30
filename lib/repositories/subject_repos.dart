import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/subject/subject_move_grid_entity.dart';

class SubjectRepos {
  SubjectRepos() {
    Utils.resetAutoIncrement();
  }

  List<MoveGridEntity> getGrid() {
    List<MoveGridEntity> list = List<MoveGridEntity>();
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561172733.jpg",
        "扫毒2天地对决",
        4.5,
        8.8,
        canPlay: true));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561542272.webp",
        "速度与激情",
        3.5,
        8.9));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2565751382.webp",
        "送我上青云",
        4.5,
        8.9));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2564170314.webp",
        "上海堡垒",
        0.5,
        5.9));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp",
        "哪吒之魔童降世",
        4.5,
        9.1));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563751491.webp",
        "使徒行者2",
        4.5,
        8.7));
    list.add(MoveGridEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2562090757.webp",
        "冰雪女王4",
        3.5,
        7.7));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563630521.webp",
        "烈火英雄",
        4.5,
        8.7));

    list.add(MoveGridEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563626309.webp",
        "骡子",
        4,
        7.9));
    return list;
  }
}
