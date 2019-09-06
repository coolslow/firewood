import 'dart:ui';

import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/banner_entity.dart';
import 'package:firewood/entity/divider_entity.dart';
import 'package:firewood/entity/subject/subject_move_champion_entity.dart';
import 'package:firewood/entity/subject/subject_move_grid_entity.dart';
import 'package:firewood/entity/subject/subject_move_interest_entity.dart';
import 'package:firewood/entity/subject/subject_move_recommend_entity.dart';
import 'package:firewood/entity/subject/subject_title_tab_entity.dart';
import 'package:firewood/entity/title_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/material.dart';

class SubjectRepos {
  SubjectRepos() {
    Utils.resetAutoIncrement();
  }

  List<TypeEntity> getSubjectList() {
    List<TypeEntity> result = List<TypeEntity>();

//    result.add(getDivider(size: SizeCompat.pxToDp(30), color: Colors.red));

    // Banner
    result.add(getBanner(
        imgUrl:
            "https://img1.doubanio.com/view/dale-online/dale_ad/public/6d576a27b7fc979.jpg",
        router: "",
        ratio: 6.5));

    result.add(getTitleTab(
      tabs: List<String>()..add("影院热映")..add("即将上映"),
      router: "",
      more: "全部 45",
    ));

    result.add(getGridRecommend());

    result.add(getBanner(
        imgUrl:
            "https://img3.doubanio.com/view/dale-online/dale_ad/public/877dfb7ef226f00.jpg",
        router: "",
        ratio: 6.0));

    result.add(getTitle(title: "豆瓣热门", router: "", more: "全部 500"));
    result.add(getGridHot());

    // Banner
    result.add(getBanner(
        imgUrl: "https://img3.doubanio.com/img/files/file-1564477710-0.png",
        router: "",
        ratio: 3.0));

    result.add(getTitle(title: "豆瓣榜单", router: "", more: "全部 10"));
    result.add(getChampion());
    result.add(getTitle(title: "为您推荐", router: "", more: ""));
    result.add(getSubjectRecommend()[0]);
    result.add(getInterest()[0]);
    result.add(getSubjectRecommend()[1]);
    result.add(getInterest()[1]);
    result.add(getSubjectRecommend()[2]);
    result.add(getInterest()[2]);
    result.add(getInterest()[3]);
    result.add(getInterest()[4]);
    result.add(getInterest()[5]);
    result.add(getInterest()[6]);
    result.add(getInterest()[7]);
    result.add(getInterest()[8]);

    return result;
  }


  List<TypeEntity> getLoadMore() {
    List<TypeEntity> result = List<TypeEntity>();
    result.add(getSubjectRecommend()[0]);
    result.add(getInterest()[0]);
    result.add(getSubjectRecommend()[1]);
    result.add(getInterest()[1]);
    result.add(getSubjectRecommend()[2]);
    result.add(getInterest()[2]);
    result.add(getInterest()[3]);
    result.add(getInterest()[4]);
    result.add(getInterest()[5]);
    result.add(getInterest()[6]);
    result.add(getInterest()[7]);
    result.add(getInterest()[8]);
    return result;
  }

  BannerEntity getBanner({String imgUrl, String router, double ratio}) {
    return BannerEntity.create(imgUrl: imgUrl, router: router, ratio: ratio);
  }

  DividerEntity getDivider({double size, Color color}) {
    if (size == null) {
      size = SizeCompat.pxToDp(50);
    }
    return DividerEntity.create(size: size, color: color);
  }

  TitleTabEntity getTitleTab({List<String> tabs, String router, String more}) {
    return TitleTabEntity.create(
      tabs: tabs,
      router: router,
      more: more,
    );
  }

  TitleEntity getTitle({String title, String router, String more}) {
    return TitleEntity.create(title: title, router: router, more: more);
  }

  MoveGridEntity getGridRecommend() {
    List<MoveGridItemEntity> list = List<MoveGridItemEntity>();
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp",
        "哪吒之魔童降世",
        4.5,
        9.1));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561172733.jpg",
        "扫毒2天地对决",
        4.5,
        8.8,
        canPlay: true));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561542272.webp",
        "速度与激情",
        3.5,
        8.9,
        collected: true));
    list.add(MoveGridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2567214398.webp",
        "冷血追击",
        3.5,
        7.7));
    list.add(MoveGridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566313588.webp",
        "李白之天火燎原",
        4.5,
        8.7));

    list.add(MoveGridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566613939.webp",
        "一生只为一事来",
        4,
        7.9));
    return MoveGridEntity.create(list);
  }

  MoveGridEntity getGridBeOn() {
    List<MoveGridItemEntity> list = List<MoveGridItemEntity>();
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566665806.webp",
        "零零后",
        4.5,
        8.8,
        canPlay: true));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2566596680.webp",
        "老师，你会不会回来",
        3.5,
        8.9,
        collected: true));
    list.add(MoveGridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2566598269.webp",
        "徒手攀岩",
        4.5,
        8.9));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567659846.webp",
        "检察方的罪人",
        0.5,
        5.9));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2567382116.webp",
        "花椒之味",
        4.5,
        9.1));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2565416892.webp",
        "最长一枪",
        4.5,
        8.7));

    return MoveGridEntity.create(list);
  }

  MoveGridEntity getGridHot() {
    List<MoveGridItemEntity> list = List<MoveGridItemEntity>();

    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2565751382.webp",
        "送我上青云",
        4.5,
        8.9));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2564170314.webp",
        "上海堡垒",
        0.5,
        5.9));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563751491.webp",
        "使徒行者2",
        4.5,
        8.7));
    list.add(MoveGridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2562090757.webp",
        "冰雪女王4",
        3.5,
        7.7));
    list.add(MoveGridItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563630521.webp",
        "烈火英雄",
        4.5,
        8.7));

    list.add(MoveGridItemEntity.create(
        "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563626309.webp",
        "骡子",
        4,
        7.9));
    return MoveGridEntity.create(list);
  }

  MoveChampionEntity getChampion() {
    List<MoveChampionItemEntity> list = List<MoveChampionItemEntity>();

    list.add(MoveChampionItemEntity.create(
        "https://img1.doubanio.com/view/photo/l/public/p2564849769.webp",
        "一周口碑电影榜",
        "每周五更新~共10部",
        "ff64523D",
        List<MoveChampionItemListEntity>()
          ..add(MoveChampionItemListEntity.create("寄生虫", "8.8", "↑"))
          ..add(MoveChampionItemListEntity.create("疾速备战", "8.5", "↓"))
          ..add(MoveChampionItemListEntity.create("美国工厂", "9.4", "- "))
          ..add(MoveChampionItemListEntity.create("好莱坞往事", "8.1", "↓"))));

    list.add(MoveChampionItemEntity.create(
//        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p616779645.webp",
        "https://img3.doubanio.com/view/photo/l/public/p2214452383.webp",
        "豆瓣电影排行榜",
        "豆瓣榜单~共250部",
        "ff564B4B",
        List<MoveChampionItemListEntity>()
          ..add(MoveChampionItemListEntity.create("教父", "8.8", "↑"))
          ..add(MoveChampionItemListEntity.create("被解救的姜戈", "8.5", "↓"))
          ..add(MoveChampionItemListEntity.create("摔跤吧！爸爸", "9.4", "- "))
          ..add(MoveChampionItemListEntity.create("好莱坞往事", "8.1", "- "))));

    list.add(MoveChampionItemEntity.create(
        "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2554370800.webp",
        "一周热门电影",
        "每周五更新~共10部",
        "ff084852",
        List<MoveChampionItemListEntity>()
          ..add(MoveChampionItemListEntity.create("哥斯拉2", "8.8", "↑"))
          ..add(MoveChampionItemListEntity.create("孟买酒店", "8.5", "↓"))
          ..add(MoveChampionItemListEntity.create("黑衣人2", "9.4", "- "))
          ..add(MoveChampionItemListEntity.create("愤怒的小鸟2", "8.1", "↓"))));

    return MoveChampionEntity.create(list);
  }

  List<MoveRecommendEntity> getSubjectRecommend() {
    List<MoveRecommendEntity> result = List<MoveRecommendEntity>();
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
        "豆瓣片单",
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

  List<MoveInterestEntity> getInterest() {
    List<MoveInterestEntity> list = List<MoveInterestEntity>();

    // 0
    list.add(MoveInterestEntity.create(
        name: "肖申克的救赎",
        beOnTime: "(1994)",
        star: 5.0,
        score: 9.7,
        des:
            "20世纪40年代末，小有成就的青年银行家安迪（蒂姆·罗宾斯 Tim Robbins 饰）因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德（摩根·弗里曼 Morgan Freeman 饰），请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯人中间也渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进。而关于其罪行的真相，似乎更使这一切朝前推进了一步…… ",
        leftImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p480747492.webp"),
        rightImgUrls: List<String>()
          ..add("https://img3.doubanio.com/view/photo/l/public/p490576110.webp")
          ..add("https://img3.doubanio.com/view/photo/l/public/p490574164.webp")
          ..add("https://img3.doubanio.com/view/photo/l/public/p456482220.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2533776776.webp"),
        tags: List<String>()
          ..add("豆瓣Top250")
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
        leftImgUrls: List<String>()
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p2315672647.webp"),
        rightImgUrls: List<String>()
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
        tags: List<String>()..add("克里斯托弗·诺兰 导演")..add("第89届奥斯卡金像奖")));

    // 2
    list.add(MoveInterestEntity.create(
        name: "泰坦尼克号 Titanic",
        beOnTime: "(1997)",
        star: 5.0,
        score: 9.4,
        des:
            "1912年4月10日，号称 “世界工业史上的奇迹”的豪华客轮泰坦尼克号开始了自己的处女航，从英国的南安普顿出发驶往美国纽约。富家少女罗丝（凯特•温丝莱特）与母亲及未婚夫卡尔坐上了头等舱；另一边，放荡不羁的少年画家杰克（莱昂纳多·迪卡普里奥）也在码头的一场赌博中赢得了下等舱的船票。",
        leftImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p457760035.webp"),
        rightImgUrls: List<String>()
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p1482506339.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1482523342.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1482491522.webp"),
        tags: List<String>()
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
        leftImgUrls: List<String>()
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p1312700628.webp"),
        rightImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1694419635.webp")
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p1694422517.webp"),
        tags: List<String>()
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
        leftImgUrls: List<String>()
          ..add(
              "https://img1.doubanio.com/view/photo/l/public/p2180085848.webp"),
        rightImgUrls: List<String>()
          ..add("https://img3.doubanio.com/view/photo/l/public/p595258686.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p442190131.webp"),
        tags: List<String>()
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
        leftImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p492406163.webp"),
        rightImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p492385256.webp"),
        tags: List<String>()..add("第66届奥斯卡金像奖")..add("第47届英国电影学院奖")));

    // 6
    list.add(MoveInterestEntity.create(
        name: "复仇者联盟",
        beOnTime: "(2012)",
        star: 4.0,
        score: 8.2,
        des:
            "一股突如其来的强大邪恶势力对地球造成致命威胁，没有任何一个超级英雄能够单独抵挡。长期致力于保护全球安危的神盾局（SHIELD）感到措手不及，其指挥官“独眼侠”尼克·弗瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）意识到他必须创建一个“史上最强”的联盟组织。",
        leftImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1524904031.webp"),
        rightImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1679956051.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p1679953436.webp"),
        tags: List<String>()..add("第85届奥斯卡金像奖")));

    // 7
    list.add(MoveInterestEntity.create(
        name: "美丽人生",
        beOnTime: "(1997)",
        star: 5.0,
        score: 9.5,
        des:
            "犹太青年圭多（罗伯托·贝尼尼）邂逅美丽的女教师多拉（尼可莱塔·布拉斯基），他彬彬有礼的向多拉鞠躬：“早安！公主！”。历经诸多令人啼笑皆非的周折后，天遂人愿，两人幸福美满的生活在一起。 ",
        leftImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p510861873.webp"),
        rightImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2498749682.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2525275926.webp"),
        tags: List<String>()
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
        leftImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2561305376.webp"),
        rightImgUrls: List<String>()
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2526147573.webp")
          ..add(
              "https://img3.doubanio.com/view/photo/l/public/p2528752253.webp"),
        tags: List<String>()
          ..add("第55届台北金马影展")
          ..add("第38届香港电影金像奖")
          ..add("第13届亚洲电影大奖")));

    return list;
  }
}
