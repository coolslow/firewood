import 'dart:ui';

import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/banner_entity.dart';
import 'package:firewood/entity/divider_entity.dart';
import 'package:firewood/entity/subject/subject_champion_entity.dart';
import 'package:firewood/entity/subject/subject_grid_entity.dart';
import 'package:firewood/entity/subject/subject_move_interest_entity.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';
import 'package:firewood/entity/subject/subject_teleplay_recommend_entity.dart';
import 'package:firewood/entity/subject/subject_title_tab_entity.dart';
import 'package:firewood/entity/title_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/material.dart';

class SubjectRepos {
//  SubjectMoveRepos mMoveRepos = SubjectMoveRepos();
//  SubjectTeleplayRepos mTeleplayRepos = SubjectTeleplayRepos();

  SubjectRepos() {
    Utils.resetAutoIncrement();
  }

  BannerEntity getBanner(
      {required String imgUrl, required String router, required double ratio}) {
    return BannerEntity.create(imgUrl: imgUrl, router: router, ratio: ratio);
  }

  DividerEntity getDivider(
      {required double size, Color color = Colors.transparent}) {
    if (size == null) {
      size = SizeCompat.pxToDp(50);
    } else {
      size = SizeCompat.pxToDp(size);
    }
    return DividerEntity.create(size: size, color: color);
  }

  TitleEntity getTitle(
      {required String title,
      required String router,
      required String more,
      double fontSize = 56}) {
    return TitleEntity.create(
        title: title, router: router, more: more, fontSize: fontSize);
  }

  TitleTabEntity getTitleTab(
      {required List<String> tabs,
      required String router,
      required String more,
      double fontSize = 56,
      double horSpace = 50,
      double verSpace = 50}) {
    return TitleTabEntity.create(
        tabs: tabs,
        router: router,
        more: more,
        fontSize: fontSize,
        horSpace: horSpace,
        verSpace: verSpace);
  }
}

/// 电影相关仓库
class SubjectMoveRepos extends SubjectRepos {
  List<TypeEntity> getSubjectList() {
    List<TypeEntity> result = <TypeEntity>[];

    // Banner
    result.add(getBanner(
        imgUrl:
            "https://img1.doubanio.com/view/dale-online/dale_ad/public/6d576a27b7fc979.jpg",
        router: "",
        ratio: 6.5));

    result.add(getTitleTab(
      tabs: <String>[]
        ..add("影院热映")
        ..add("即将上映"),
      router: "",
      more: "",
    ));

    result.add(getMoveGridRecommend());

    result.add(getBanner(
        imgUrl:
            "https://img3.doubanio.com/view/dale-online/dale_ad/public/877dfb7ef226f00.jpg",
        router: "",
        ratio: 6.0));

    result.add(getTitle(title: "热门", router: "", more: "全部 500"));
    result.add(getMoveGridHot());

    // Banner
    result.add(getBanner(
        imgUrl: "https://img3.doubanio.com/img/files/file-1564477710-0.png",
        router: "",
        ratio: 3.0));

    result.add(getTitle(title: "榜单", router: "", more: "全部 10"));
    result.add(getMoveChampion());
    result.add(getTitle(title: "为您推荐", router: "", more: ""));
    result.add(getMoveRecommend()[0]);
    result.add(getMoveInterest()[0]);
    result.add(getMoveRecommend()[1]);
    result.add(getMoveInterest()[1]);
    result.add(getMoveRecommend()[2]);
    result.add(getMoveInterest()[2]);
    result.add(getMoveInterest()[3]);
    result.add(getMoveInterest()[4]);
    result.add(getMoveInterest()[5]);
    result.add(getMoveInterest()[6]);
    result.add(getMoveInterest()[7]);
    result.add(getMoveInterest()[8]);

    return result;
  }

  List<TypeEntity> getSubjectLoadMore() {
    List<TypeEntity> result = <TypeEntity>[];
    result.add(getMoveRecommend()[0]);
    result.add(getMoveInterest()[0]);
    result.add(getMoveRecommend()[1]);
    result.add(getMoveInterest()[1]);
    result.add(getMoveRecommend()[2]);
    result.add(getMoveInterest()[2]);
    result.add(getMoveInterest()[3]);
    result.add(getMoveInterest()[4]);
    result.add(getMoveInterest()[5]);
    result.add(getMoveInterest()[6]);
    result.add(getMoveInterest()[7]);
    result.add(getMoveInterest()[8]);
    return result;
  }

  GridEntity getMoveGridRecommend() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp",
        "哪吒之魔童降世",
        4.5,
        9.1));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561172733.jpg",
        "扫毒2天地对决",
        4.5,
        8.8,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561542272.webp",
        "速度与激情",
        3.5,
        8.9,
        collected: true));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2567214398.webp",
        "冷血追击",
        3.5,
        7.7));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566313588.webp",
        "李白之天火燎原",
        4.5,
        8.7));

    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566613939.webp",
        "一生只为一事来",
        4,
        7.9));
    return GridEntity.create(list);
  }

  GridEntity getMoveGridBeOn() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566665806.webp",
        "零零后",
        4.5,
        8.8,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566596680.webp",
        "老师，你会不会回来",
        3.5,
        8.9,
        collected: true));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566598269.webp",
        "徒手攀岩",
        4.5,
        8.9));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567659846.webp",
        "检察方的罪人",
        0.5,
        5.9));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567382116.webp",
        "花椒之味",
        4.5,
        9.1));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2565416892.webp",
        "最长一枪",
        4.5,
        8.7));

    return GridEntity.create(list);
  }

  GridEntity getMoveGridHot() {
    List<GridItemEntity> list = <GridItemEntity>[];

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2565751382.webp",
        "送我上青云",
        4.5,
        8.9));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2564170314.webp",
        "上海堡垒",
        0.5,
        5.9));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563751491.webp",
        "使徒行者2",
        4.5,
        8.7));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2562090757.webp",
        "冰雪女王4",
        3.5,
        7.7));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563630521.webp",
        "烈火英雄",
        4.5,
        8.7));

    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563626309.webp",
        "骡子",
        4,
        7.9));
    return GridEntity.create(list);
  }

  ChampionEntity getMoveChampion() {
    List<ChampionItemEntity> list = <ChampionItemEntity>[];

    list.add(ChampionItemEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p2564849769.webp",
        "一周口碑电影榜",
        "每周五更新~共10部",
        "ff64523D",
        <ChampionItemListEntity>[]
          ..add(ChampionItemListEntity.create("寄生虫", "8.8", "↑"))
          ..add(ChampionItemListEntity.create("疾速备战", "8.5", "↓"))
          ..add(ChampionItemListEntity.create("美国工厂", "9.4", "- "))
          ..add(ChampionItemListEntity.create("好莱坞往事", "8.1", "↓"))));

    list.add(ChampionItemEntity.create(
//        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p616779645.webp",
        "https://img3.doubanio.com/view/photo/l/public/p2214452383.webp",
        "电影排行榜",
        "共250部",
        "ff564B4B",
        <ChampionItemListEntity>[]
          ..add(ChampionItemListEntity.create("教父", "8.8", "↑"))
          ..add(ChampionItemListEntity.create("被解救的姜戈", "8.5", "↓"))
          ..add(ChampionItemListEntity.create("摔跤吧！爸爸", "9.4", "- "))
          ..add(ChampionItemListEntity.create("好莱坞往事", "8.1", "- "))));

    list.add(ChampionItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554370800.webp",
        "一周热门电影",
        "每周五更新~共10部",
        "ff084852",
        <ChampionItemListEntity>[]
          ..add(ChampionItemListEntity.create("哥斯拉2", "8.8", "↑"))
          ..add(ChampionItemListEntity.create("孟买酒店", "8.5", "↓"))
          ..add(ChampionItemListEntity.create("黑衣人2", "9.4", "- "))
          ..add(ChampionItemListEntity.create("愤怒的小鸟2", "8.1", "↓"))));

    return ChampionEntity.create(list);
  }

  List<MoveRecommendEntity> getMoveRecommend() {
    List<MoveRecommendEntity> result = <MoveRecommendEntity>[];
    result.add(MoveRecommendEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p858079649.webp",
        "专题",
        "一周可播推荐",
        "共10部片",
        bgColor: "ff162A4C",
        titleColor: "ffffffff",
        subTitleColor: "ffffffff",
        desColor: "ffffffff",
        canPlay: true));
    result.add(MoveRecommendEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p2553071917.webp",
        "片单",
        "有什么很安静的电影，看完以后却又回味无穷",
        "求推荐的博物馆创建/共489部",
        bgColor: "ffffffff",
        canPlay: false));

    result.add(MoveRecommendEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p2565381508.webp",
        "最佳剧情/惊悚/犯罪推荐",
        "When we empathize with a psychopath, we actually negate the self. We deny our own beliefs about decency and humanity. ",
        "共100部片",
        bgColor: "ff64523D",
        canPlay: false));

    return result;
  }

  List<MoveInterestEntity> getMoveInterest() {
    List<MoveInterestEntity> list = <MoveInterestEntity>[];

    // 0
    list.add(MoveInterestEntity.create(
        name: "肖申克的救赎",
        beOnTime: "(1994)",
        star: 5.0,
        score: 9.7,
        des:
            "20世纪40年代末，小有成就的青年银行家安迪（蒂姆·罗宾斯 Tim Robbins 饰）因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德（摩根·弗里曼 Morgan Freeman 饰），请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯人中间也渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进。而关于其罪行的真相，似乎更使这一切朝前推进了一步…… ",
        leftImgUrls: <String>[]..add(
            "https://img3.doubanio.com/view/photo/l/public/p480747492.webp"),
        rightImgUrls: <String>[]
          ..add("https://img3.doubanio.com/view/photo/l/public/p490576110.webp")
          ..add("https://img3.doubanio.com/view/photo/l/public/p490574164.webp")
          ..add("https://img3.doubanio.com/view/photo/l/public/p456482220.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2533776776.webp"),
        tags: <String>[]
          ..add("Top250")
          ..add("第68届金像奖")
          ..add("第67届奥斯卡金像奖")
          ..add("第20届报知映画赏")
          ..add("弗兰克·德拉邦特 导演")));

    // 1
    list.add(MoveInterestEntity.create(
        name: "疯狂动物城",
        beOnTime: "(2016)",
        star: 4.5,
        score: 9.2,
        des:
            "故事发生在一个所有哺乳类动物和谐共存的美好世界中，兔子朱迪（金妮弗·古德温 Ginnifer Goodwin 配音）从小就梦想着能够成为一名惩恶扬善的刑警，凭借着智慧和努力，朱迪成功的从警校中毕业进入了疯狂动物城警察局，殊不知这里是大型肉食类动物的领地，作为第一只，也是唯一的小型食草类动物，朱迪会遇到怎样的故事呢？",
        leftImgUrls: <String>[]..add(
            "https://img1.doubanio.com/view/photo/l/public/p2315672647.webp"),
        rightImgUrls: <String>[]
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p2277484017.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2323579586.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2277484016.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2277484015.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2277484013.webp"),
        tags: <String>[]
          ..add("克里斯托弗·诺兰 导演")
          ..add("第89届奥斯卡金像奖")));

    // 2
    list.add(MoveInterestEntity.create(
        name: "泰坦尼克号 Titanic",
        beOnTime: "(1997)",
        star: 5.0,
        score: 9.4,
        des:
            "1912年4月10日，号称 “世界工业史上的奇迹”的豪华客轮泰坦尼克号开始了自己的处女航，从英国的南安普顿出发驶往美国纽约。富家少女罗丝（凯特•温丝莱特）与母亲及未婚夫卡尔坐上了头等舱；另一边，放荡不羁的少年画家杰克（莱昂纳多·迪卡普里奥）也在码头的一场赌博中赢得了下等舱的船票。",
        leftImgUrls: <String>[]..add(
            "https://img3.doubanio.com/view/photo/l/public/p457760035.webp"),
        rightImgUrls: <String>[]
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p1482506339.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1482523342.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1482491522.webp"),
        tags: <String>[]
          ..add("第70届奥斯卡金像奖")
          ..add("最佳影片")
          ..add("最佳导演")
          ..add("最佳摄影")
          ..add("最佳剪辑")
          ..add("最佳视觉效果")
          ..add("剧情片最佳原创配乐")));

    // 3
    list.add(MoveInterestEntity.create(
        name: "当幸福来敲门",
        beOnTime: "(2016)",
        star: 4.5,
        score: 9.1,
        des:
            "克里斯•加纳（威尔·史密斯 Will Smith 饰）用尽全部积蓄买下了高科技治疗仪，到处向医院推销，可是价格高昂，接受的人不多。就算他多努力都无法提供一个良好的生活环境给妻儿，妻子（桑迪·牛顿 Thandie Newton 饰）最终选择离开家。从此他带着儿子克里斯托夫（贾登·史密斯 Jaden Smith 饰）相依为命。",
        leftImgUrls: <String>[]..add(
            "https://img1.doubanio.com/view/photo/l/public/p1312700628.webp"),
        rightImgUrls: <String>[]
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1694419635.webp")
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p1694422517.webp"),
        tags: <String>[]
          ..add("第16届MTV电影奖")
          ..add("第64届金球奖")
          ..add("第79届奥斯卡金像奖")
          ..add("剧情片最佳原创配乐")));

    // 4
    list.add(MoveInterestEntity.create(
        name: "阿凡达 Avatar",
        beOnTime: "(2009)",
        star: 4.5,
        score: 8.7,
        des:
            "战斗中负伤而下身瘫痪的前海军战士杰克•萨利（萨姆•沃辛顿 Sam Worthington 饰）决定替死去的同胞哥哥来到潘多拉星操纵格蕾丝博士（西格妮•韦弗 Sigourney Weaver 饰）用人类基因与当地纳美部族基因结合创造出的 “阿凡达” 混血生物。",
        leftImgUrls: <String>[]..add(
            "https://img1.doubanio.com/view/photo/l/public/p2180085848.webp"),
        rightImgUrls: <String>[]
          ..add("https://img3.doubanio.com/view/photo/l/public/p595258686.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p442190131.webp"),
        tags: <String>[]
          ..add("第82届奥斯卡金像奖")
          ..add("第67届威尼斯电影节")
          ..add("第67届金球奖")));

    // 5
    list.add(MoveInterestEntity.create(
        name: "辛德勒的名单 Schindler's List",
        beOnTime: "(1993)",
        star: 4.5,
        score: 9.5,
        des:
            "1939年，波兰在纳粹德国的统治下，党卫军对犹太人进行了隔离统治。德国商人奥斯卡·辛德勒（连姆·尼森 Liam Neeson 饰）来到德军统治下的克拉科夫，开设了一间搪瓷厂，生产军需用品。凭着出众的社交能力和大量的金钱，辛德勒和德军建立了良好的关系，他的工厂雇用犹太人工作，大发战争财。 ",
        leftImgUrls: <String>[]..add(
            "https://img3.doubanio.com/view/photo/l/public/p492406163.webp"),
        rightImgUrls: <String>[]..add(
            "https://img3.doubanio.com/view/photo/l/public/p492385256.webp"),
        tags: <String>[]
          ..add("第66届奥斯卡金像奖")
          ..add("第47届英国电影学院奖")));

    // 6
    list.add(MoveInterestEntity.create(
        name: "复仇者联盟",
        beOnTime: "(2012)",
        star: 4.0,
        score: 8.2,
        des:
            "一股突如其来的强大邪恶势力对地球造成致命威胁，没有任何一个超级英雄能够单独抵挡。长期致力于保护全球安危的神盾局（SHIELD）感到措手不及，其指挥官“独眼侠”尼克·弗瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）意识到他必须创建一个“史上最强”的联盟组织。",
        leftImgUrls: <String>[]..add(
            "https://img3.doubanio.com/view/photo/l/public/p1524904031.webp"),
        rightImgUrls: <String>[]
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1679956051.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1679953436.webp"),
        tags: <String>[]..add("第85届奥斯卡金像奖")));

    // 7
    list.add(MoveInterestEntity.create(
        name: "美丽人生",
        beOnTime: "(1997)",
        star: 5.0,
        score: 9.5,
        des:
            "犹太青年圭多（罗伯托·贝尼尼）邂逅美丽的女教师多拉（尼可莱塔·布拉斯基），他彬彬有礼的向多拉鞠躬：“早安！公主！”。历经诸多令人啼笑皆非的周折后，天遂人愿，两人幸福美满的生活在一起。 ",
        leftImgUrls: <String>[]..add(
            "https://img3.doubanio.com/view/photo/l/public/p510861873.webp"),
        rightImgUrls: <String>[]
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2498749682.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2525275926.webp"),
        tags: <String>[]
          ..add("第71届奥斯卡金像奖")
          ..add("第51届戛纳电影节")
          ..add("第23届日本电影学院奖")));

    // 8
    list.add(MoveInterestEntity.create(
        name: "我不是药神 ",
        beOnTime: "(2018)",
        star: 4.5,
        score: 9.0,
        des:
            "普通中年男子程勇（徐峥 饰）经营着一家保健品店，失意又失婚。不速之客吕受益（王传君 饰）的到来，让他开辟了一条去印度买药做“代购”的新事业，虽然困难重重，但他在这条“买药之路”上发现了商机，一发不可收拾地做起了治疗慢粒白血病的印度仿制药独家代理商。",
        leftImgUrls: <String>[]..add(
            "https://img3.doubanio.com/view/photo/l/public/p2561305376.webp"),
        rightImgUrls: <String>[]
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2526147573.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2528752253.webp"),
        tags: <String>[]
          ..add("第55届台北金马影展")
          ..add("第38届香港电影金像奖")
          ..add("第13届亚洲电影大奖")));

    return list;
  }
}

class SubjectTeleplayRepos extends SubjectRepos {
  List<TypeEntity> getSubjectList() {
    List<TypeEntity> result = <TypeEntity>[];

    result.add(getBanner(
        imgUrl: "https://img3.doubanio.com/view/note/l/public/p57441816.webp",
        router: "",
        ratio: 5.0));

    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getTitle(title: "热播新剧", router: "", more: "全部 271"));

    result.add(getTitleTab(
        tabs: <String>[]
          ..add("综合")
          ..add("国产")
          ..add("美剧")
          ..add("韩剧")
          ..add("动漫"),
        router: "",
        more: "",
        fontSize: 40,
        horSpace: 50,
        verSpace: 32));

    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getGridHot());
    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getTitle(title: "热播综艺", router: "", more: "全部 59"));

    result.add(getTitleTab(
        tabs: <String>[]
          ..add("综合")
          ..add("国内")
          ..add("国外"),
        router: "",
        more: "",
        fontSize: 40,
        horSpace: 50,
        verSpace: 32));

    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getGridVarietySynthesize());

    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getTitle(title: "榜单", router: "", more: "全部 8"));

    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getChampion());

    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getBanner(
        imgUrl: "https://img3.doubanio.com/view/status/l/public/1hLNrZ.webp",
        router: "",
        ratio: 4.0));

    result.add(getDivider(size: SizeCompat.pxToDp(50)));

    result.add(getTitle(title: "分类浏览", router: "", more: "全部"));

    result.add(getDivider(size: 40));

    result.add(getTitle(title: "美剧", router: "", more: "更多", fontSize: 45));
    result.add(getDivider(size: 40));
    result.add(getGridClassifyAmerican());
    result.add(getDivider(size: 40));
    result.add(getTitle(title: "日剧", router: "", more: "更多", fontSize: 45));
    result.add(getDivider(size: 40));
    result.add(getGridClassifyJapanese());
    result.add(getDivider(size : SizeCompat.pxToDp(50)));
//    result.add(getTitle(title: "即将播出剧集", router: "", more: "全部 340"));
//    result.add(getDivider());

    result.add(getTitle(title: "为您推荐", router: "", more: ""));
    result.add(getDivider(size : SizeCompat.pxToDp(50)));
    result.addAll(getTeleplayRecommend());

    return result;
  }

  List<TypeEntity> getSubjectLoadMore() {
    List<TypeEntity> result = <TypeEntity>[];
    result.addAll(getTeleplayRecommend());
    return result;
  }

  GridEntity getGridHot() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2562953341.jpg",
        "长安十二时辰",
        4.5,
        8.4,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566967861.jpg",
        "致命女人",
        4.5,
        9.4,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2564832427.jpg",
        "小欢喜",
        4.5,
        8.4));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567808903.jpg",
        "老酒馆",
        3.5,
        8.3,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561475660.jpg",
        "凸变英雄BABA",
        4.0,
        7.8,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566909746.jpg",
        "一路成年",
        3.0,
        8.0,
        canPlay: true));
    return GridEntity.create(list);
  }

  GridEntity getGridChinese() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2555641009.jpg",
        "加油，你是最棒的",
        3.5,
        7.3));

    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563437048.jpg",
        "全职高手",
        4.0,
        7.3));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2564980520.jpg",
        "烈火军校",
        3.5,
        6.7));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2562677270.jpg",
        "九州缥缈录",
        3.0,
        6.3));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2559266281.jpg",
        "大宋少年志",
        3.5,
        8.2));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2529398939.jpg",
        "香蜜沉沉烬如霜",
        3.0,
        7.7));
    return GridEntity.create(list);
  }

  GridEntity getGridAmerican() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558596736.jpg",
        "狂欢命案 第一季",
        4.5,
        7.3));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558544696.jpg",
        "大小谎言 第二季",
        3.5,
        9.0));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2543065068.jpg",
        "真探 第三季",
        4.5,
        8.2));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2552503815.jpg",
        "权力的游戏 第八季",
        4.0,
        6.1));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2187822907.jpg",
        "老友记 第十季",
        4.0,
        9.8));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2559470557.jpg",
        "使女的故事 第三季",
        3.5,
        8.6));
    return GridEntity.create(list);
  }

  GridEntity getGridKorea() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2520568437.jpg",
        "我的大叔",
        4.5,
        9.4));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2399168592.jpg",
        "孤单又灿烂的神：鬼怪",
        4.0,
        8.6));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2272563445.jpg",
        "请回答1988",
        4.5,
        9.7));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2304228229.jpg",
        "信号",
        4.0,
        9.2));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2460119184.jpg",
        "秘密森林",
        4.5,
        9.2));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2539477971.jpg",
        "天空之城",
        4.0,
        8.8));
    return GridEntity.create(list);
  }

  GridEntity getGridAnim() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2564646167.jpg",
        "魔道祖师 第二季",
        4.5,
        9.1));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2496903956.jpg",
        "罗小黑战记",
        4.5,
        9.6));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561727696.jpg",
        "斗破苍穹 第三季",
        4.0,
        8.4));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2361266484.jpg",
        "火影忍者",
        4.0,
        8.9));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2445459194.jpg",
        "灌篮高手",
        5.0,
        9.6));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2234184583.jpg",
        "一拳超人",
        4.0,
        9.4));
    return GridEntity.create(list);
  }

  GridEntity getGridVarietySynthesize() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2264809475.jpg",
        "极限挑战 第一季",
        4.0,
        9.1,
        canPlay: true));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/l/public/p2557684694.webp",
        "非正式会谈 第五季",
        4.0,
        8.8,
        canPlay: true));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563220463.jpg",
        "粉雄救兵 第四季",
        4.0,
        9.2,
        canPlay: true));

    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551985157.jpg",
        "新职员诞生记：好人",
        4.0,
        9.5,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2537774816.jpg",
        "声入人心 第一季",
        4.5,
        9.3,
        canPlay: true));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2500329741.jpg",
        "明星大侦探 第三季",
        4.0,
        9.1,
        canPlay: true));
    return GridEntity.create(list);
  }

  GridEntity getGridVarietyChinese() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2552553650.jpg",
        "这！就是街舞 第二季",
        4.0,
        8.9));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2562011953.jpg",
        "国乐大典 第二季",
        3.5,
        7.5));

    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2553367338.jpg",
        "向往的生活 第三季",
        3.0,
        7.4));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556109024.jpg",
        "中国新说唱 第二季",
        2.0,
        5.3));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2390929081.jpg",
        "圆桌派 第一季",
        4.0,
        8.9));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2533929218.jpg",
        "奇遇人生",
        4.0,
        8.9));
    return GridEntity.create(list);
  }

  GridEntity getGridVarietyForeign() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2552553650.jpg",
        "这！就是街舞 第二季",
        4.0,
        8.9));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2562011953.jpg",
        "国乐大典 第二季",
        3.5,
        7.5));

    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2553367338.jpg",
        "向往的生活 第三季",
        3.0,
        7.4));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2556109024.jpg",
        "中国新说唱 第二季",
        2.0,
        5.3));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2390929081.jpg",
        "圆桌派 第一季",
        4.0,
        8.9));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2533929218.jpg",
        "奇遇人生",
        4.0,
        8.9));
    return GridEntity.create(list);
  }

  ChampionEntity getChampion() {
    List<ChampionItemEntity> list = <ChampionItemEntity>[];

    list.add(ChampionItemEntity.create(
        "https://img3.doubanio.com/view/photo/l/public/p2555677726.webp",
        "华语口碑剧集榜",
        "每周三更新~共10部",
        "ff4C4333",
        <ChampionItemListEntity>[]
          ..add(ChampionItemListEntity.create("小欢喜", "8.8", "↑"))
          ..add(ChampionItemListEntity.create("他乡的童年", "8.5", "↓"))
          ..add(ChampionItemListEntity.create("魔道祖师 第二季", "9.4", "- "))
          ..add(ChampionItemListEntity.create("手术两百年", "9.4", "↓"))));

    list.add(ChampionItemEntity.create(
        "https://img3.doubanio.com/view/photo/l/public/p2560892181.webp",
        "全球口碑剧集榜",
        "榜单~共250部",
        "ff4C2D28",
        <ChampionItemListEntity>[]
          ..add(ChampionItemListEntity.create("致命女人", "8.8", "↑"))
          ..add(ChampionItemListEntity.create("黄石 第二季", "8.5", "↓"))
          ..add(ChampionItemListEntity.create("风的新生活", "9.4", "- "))
          ..add(ChampionItemListEntity.create("心灵猎人 第二季", "8.1", "- "))));

    list.add(ChampionItemEntity.create(
        "https://img3.doubanio.com/view/photo/l/public/p2566446505.webp",
        "国内口碑综艺榜",
        "每周一更新~共10部",
        "ff4C4333",
        <ChampionItemListEntity>[]
          ..add(ChampionItemListEntity.create("邻家诗话", "8.8", "↑"))
          ..add(ChampionItemListEntity.create("圆桌派 第四季", "8.5", "↓"))
          ..add(ChampionItemListEntity.create("极限青春", "9.4", "- "))
          ..add(ChampionItemListEntity.create("一千零一夜", "8.1", "↓"))));

    list.add(ChampionItemEntity.create(
        "https://img3.doubanio.com/view/photo/l/public/p2560718306.webp",
        "国外口碑综艺榜",
        "每周一更新~共10部",
        "ff4C2D28",
        <ChampionItemListEntity>[]
          ..add(ChampionItemListEntity.create("姜食堂 第三季", "8.8", "↑"))
          ..add(ChampionItemListEntity.create("再次出发", "8.5", "↓"))
          ..add(ChampionItemListEntity.create("三时三餐 山村篇", "9.4", "- "))
          ..add(ChampionItemListEntity.create("露营俱乐部", "8.1", "↓"))));

    return ChampionEntity.create(list);
  }

  GridEntity getGridClassifyAmerican() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2426595773.jpg",
        "破产姐妹 第六季",
        4.5,
        8.1));

    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1579021082.jpg",
        "绝命毒师  第五季",
        4.5,
        9.6));
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2517077652.jpg",
        "西部世界 第二季",
        4.0,
        8.9));
    return GridEntity.create(list);
  }

  GridEntity getGridClassifyJapanese() {
    List<GridItemEntity> list = <GridItemEntity>[];
    list.add(GridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2411814194.jpg",
        "半泽直树",
        4.5,
        9.1));

    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2518837167.jpg",
        "行骗天下JP",
        3.5,
        8.4));
    list.add(GridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2199638898.jpg",
        "白色巨塔",
        4.5,
        9.6));
    return GridEntity.create(list);
  }

  List<TeleplayRecommendEntity> getTeleplayRecommend() {
    List<TeleplayRecommendEntity> result = <TeleplayRecommendEntity>[];

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2562677270.jpg",
        "九州缥缈录",
        "(2019)",
        3.0,
        6.3,
        "《九州缥缈录》改编自江南同名小说，由张晓波执导，江南担任总编剧。 "));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566615972.jpg",
        "优雅的家",
        "(2019)",
        3.5,
        7.7,
        "该剧是一部悬疑爱情剧，围绕着财阀家隐藏的秘密和业主风险管理展开剧情，讲述因为15年前的杀人案而痛失母亲的财阀继承女和三流律师相遇后寻找事件真相的故事。值得一提的是，该剧是首次真实描写业主风险管理TOP团队的电视剧。"));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563460881.jpg",
        "归还世界给你",
        "(2019)",
        3.5,
        8.6,
        "2019 / 中国大陆 / 爱情 悬疑 /导演: 蒋家骏 / 主演: 杨烁 / 古力娜扎 "));

    result.add(TeleplayRecommendEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2567028069.jpg",
        "他人即地狱",
        "(2019)",
        4.0,
        8.3,
        "故事根据金容基的网络漫画《惊悚考试院》改编，以考试院为背景，描述从乡村来到首尔生活的一位少年发生的一连串奇怪的事件，而且身旁的每个人也都怪怪的……"));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558596736.jpg",
        "狂欢命案 第一季",
        "(2019)",
        3.5,
        7.3,
        "奥兰多·布鲁姆领衔出演亚马逊新剧《狂欢命案》，这也是他首次以常规角色亮相小荧屏。这部黑暗奇幻题材剧集共8集。在一个具有维多利亚风格的新兴城市，各色神秘生物因逃难而齐聚在此。故事围绕一宗狂欢之夜发生的命案展开，奥兰多·布鲁姆饰警探莱克弗特·菲勒斯特雷。"));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566991162.jpg",
        "他乡的童年",
        "(2019)",
        4.5,
        9.1,
        "教育，是中国各个阶层共同焦虑的话题，无数家庭穷尽所有把孩子送去国外，都是希望自己的孩子得到更好的教育。身为两个孩子的母亲，常年报道国际新闻的记者周轶君感受到同样的焦虑。轶君走访芬兰、日本、印度、以色列及英国等五个国家，最后回到中国，踏上一趟关于教育哲学的思考之旅。"));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567329686.jpg",
        "浴血黑帮 第五季",
        "(2019)",
        4.5,
        9.5,
        "《浴血黑帮》一次性获得第四季和第五季续订。"));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563910544.jpg",
        "特赦1959",
        "(2019)",
        3.5,
        7.0,
        "、开国大典之后，百忙之中的毛泽东开始关注在押的国民党战犯的情况。根据各方面意见，毛泽东确定了对战犯的总体政策：不审不判不杀，给予人道主义待遇，组织政治学习和参加劳动改造，待时机成熟后，再酌情提出处理办法。 "));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2564451036.jpg",
        "女子监狱 第七季",
        "(2019)",
        4.5,
        9.5,
        "Netflix宣布一口气续订《女子监狱》第5﹑6﹑7季。"));

    result.add(TeleplayRecommendEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2558948000.jpg",
        "黑袍纠察队 第一季",
        "(2019)",
        4.0,
        8.6,
        "《黑袍纠察队》（英语：The Boys）是一部超级英雄类型的美国网路电视影集，根据加斯·恩尼斯和达里克·罗伯逊的同名漫画改编，由埃里克·克里普基、伊凡·戈博和塞斯·罗根开创，预定于2019年7月26日在亚马逊影片首播。2019年7月，在剧集首播之前，亚马逊影片宣布预订第二季。 "));

    return result;
  }
}
