import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/subject/subject_move_champion_entity.dart';
import 'package:firewood/entity/subject/subject_move_grid_entity.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';

class SubjectRepos {
  SubjectRepos() {
    Utils.resetAutoIncrement();
  }

  List<MoveGridEntity> getGridHot() {
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
        8.9,
        collected: true));
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

  List<MoveGridEntity> getGridBeOn() {
    List<MoveGridEntity> list = List<MoveGridEntity>();
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566665806.webp",
        "零零后",
        4.5,
        8.8,
        canPlay: true));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566596680.webp",
        "老师，你会不会回来",
        3.5,
        8.9,
        collected: true));
    list.add(MoveGridEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566598269.webp",
        "徒手攀岩",
        4.5,
        8.9));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567659846.webp",
        "检察方的罪人",
        0.5,
        5.9));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567382116.webp",
        "花椒之味",
        4.5,
        9.1));
    list.add(MoveGridEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2565416892.webp",
        "最长一枪",
        4.5,
        8.7));
    list.add(MoveGridEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2567214398.webp",
        "冷血追击",
        3.5,
        7.7));
    list.add(MoveGridEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566313588.webp",
        "李白之天火燎原",
        4.5,
        8.7));

    list.add(MoveGridEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566613939.webp",
        "一生只为一事来",
        4,
        7.9));
    return list;
  }

  List<MoveChampionEntity> getChampionData() {
    List<MoveChampionEntity> list = List<MoveChampionEntity>();

    list.add(MoveChampionEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p2564849769.webp",
        "一周口碑电影榜",
        "每周五更新~共10部",
        "ff64523D",
        List<SubjectChampion>()
          ..add(SubjectChampion.create("寄生虫", "8.8", "↑"))
          ..add(SubjectChampion.create("疾速备战", "8.5", "↓"))
          ..add(SubjectChampion.create("美国工厂", "9.4", "- "))
          ..add(SubjectChampion.create("好莱坞往事", "8.1", "↓"))));

    list.add(MoveChampionEntity.create(
//        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p616779645.webp",
        "https://img3.doubanio.com/view/photo/l/public/p2214452383.webp",
        "豆瓣电影排行榜",
        "豆瓣榜单~共250部",
        "ff564B4B",
        List<SubjectChampion>()
          ..add(SubjectChampion.create("教父", "8.8", "↑"))
          ..add(SubjectChampion.create("被解救的姜戈", "8.5", "↓"))
          ..add(SubjectChampion.create("摔跤吧！爸爸", "9.4", "- "))
          ..add(SubjectChampion.create("好莱坞往事", "8.1", "- "))));

    list.add(MoveChampionEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554370800.webp",
        "一周热门电影",
        "每周五更新~共10部",
        "ff084852",
        List<SubjectChampion>()
          ..add(SubjectChampion.create("哥斯拉2", "8.8", "↑"))
          ..add(SubjectChampion.create("孟买酒店", "8.5", "↓"))
          ..add(SubjectChampion.create("黑衣人2", "9.4", "- "))
          ..add(SubjectChampion.create("愤怒的小鸟2", "8.1", "↓"))));

    return list;
  }

  MoveRecommendEntity getSubjectRecommend1() {
    return MoveRecommendEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p858079649.webp",
        "专题",
        "一周可播推荐",
        "共10部片",
        bgColor: "ff162A4C",
        titleColor: "ffffffff",
        subTitleColor: "ffffffff",
        desColor: "ffffffff",
        canPlay: true);
  }

  MoveRecommendEntity getSubjectRecommend2() {
    return MoveRecommendEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p2553071917.webp",
        "豆瓣片单",
        "有什么很安静的电影，看完以后却又回味无穷",
        "求推荐的博物馆创建/共489部",
        bgColor: "ffffffff",
        canPlay: false);
  }

  MoveRecommendEntity getSubjectRecommend3() {
    return MoveRecommendEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p2565381508.webp",
        "最佳剧情/惊悚/犯罪推荐",
        "When we empathize with a psychopath, we actually negate the self. We deny our own beliefs about decency and humanity. ",
        "共100部片",
        bgColor: "ff64523D",
        canPlay: false);
  }
}
