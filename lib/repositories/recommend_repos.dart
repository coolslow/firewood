import 'dart:math';
import 'dart:ui';

import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/utils.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/foundation.dart';

class RecommendRepos {

  RecommendRepos(){
    Utils.resetAutoIncrement();
  }

  List<TypeEntity> _getData() {
    int mode = 10;
    List<TypeEntity> repositories = List<TypeEntity>();
    for (int i = 0; i < PageConstant.size; i++) {
      if (i % mode == 0) {
        repositories.add(RecommendEntity.create(
            "https://img3.doubanio.com/icon/up36814583-2.jpg",
            "马文先生",
            "《美国往事》13岁的詹妮弗．康纳利惊为天人",
            """1933年的一个夜晚，在鸦片馆准备吸鸦片的面条（1）读到报纸上“三名私酒犯被通缉枪杀”的新闻，随鸦片沈进恍惚状态，断断续续回忆一些前尘往事，后来黑社会的匪徒追杀至鸦片馆来，面条追到了胖摩（Fat Moe）的酒馆，拿走了一把纽约火车站储物柜的钥匙，但到了那里，箱内的钱竟变成了废报纸。一无所有的面条遂决定买车票离开前往水牛城。""",
            List()
              ..add(
                  "https://img1.doubanio.com/view/status/raw/public/69713081-4320121e4393be7.jpg"),
            8715,
            975,
            2366,
            0,
            thumbed: true));
      } else if (i % mode == 1) {
        repositories.add(RecommendEntity.create(
            "https://img3.doubanio.com/icon/up69658283-22.jpg",
            "Whatever",
            "你有哪些怀旧的情结与习惯？",
            """中学的时候，曾经开过一段时间的打字课。(2)从那时候起，对打字机就有了一种直觉般的迷恋。第一次感到文字会随着自己的手指发出声音，仿佛是思绪奏响的旋律。空气中散发着淡淡的油墨气息，一串串字符随着跳动的指尖排列整洁有序，到了末格，会有清脆的换行提示音。喜欢那种空白被一点点填满的感觉，然后愉悦地打完了整篇的""",
            List()
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52000213.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p51297633.jpg"),
            45,
            25,
            6,
            0));
      } else if (i % mode == 2) {
        repositories.add(RecommendEntity.create(
            "https://img3.doubanio.com/icon/up180055214-15.jpg",
            "因为我是tyt",
            "服装搭配指南",
            """“汉服”的魅力不仅在于承载了华夏礼仪文化，(3)这种区别于其他民族的传统服装和配饰体系同时也记录了历代汉族染织绣等杰出的工艺和美学。 我对“汉服”的喜爱虽尚未如痴如醉，但也沉迷于其精美的设计和精良的制作。穿上古装之后，就像拥有了一段短暂又奇妙的穿越之旅，所以就用古风写真的形式记录了下来。 🌿「瑞鹤」 忽闻鹤音""",
            List()
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52469582.webp")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52469814.webp")
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p52469957.webp"),
            1160,
            73,
            38,
            10));
      } else if (i % mode == 3) {
        repositories.add(RecommendEntity.create(
            "https://img1.doubanio.com/icon/up125141205-7.jpg",
            "鹧鸪 4",
            "石趣",
            """《石趣1》，(4) 在 这 里。 《石趣3》，在 这 里。 《明代的石头》，在 这 里。 文艺复兴时期的德国大画家丢勒，曾经制作过一幅名为《犀牛》的木刻版画： 我们会发现，画中犀牛的身上，凭空多了一些有趣的细节：腿上的鳞片，脖子末端的小角，疑似盔甲的皮肤，以及皮肤上的花纹……这是有原因的。丢勒创作这幅版画时，只有一幅草""",
            List()
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p60161943.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p60162054.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p60162135.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p60162094.jpg"),
            187,
            54,
            21,
            0));
      } else if (i % mode == 4) {
        repositories.add(RecommendEntity.create(
            "https://img3.doubanio.com/icon/up4448539-32.jpg",
            "夜第七章",
            "你看过哪位导演的全部作品？",
            """一 作为一个悬疑片爱好者，(5)在豆瓣上标记看过的上千部影片里至少一半是悬疑片。可在悬疑片发展中有着煌煌大名的希区柯克，却让我一度望而却步，因为眼睛早已习惯斑斓色彩，总觉得黑白画面少了视觉上的刺激。 所以直到研一，我才第一次观看希区柯克的电影。分析《后窗》，是《电影建筑学》课程的要求。这位大导演似乎很受建""",
            List()
              ..add(
                  "https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2563626309.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p53288894.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p53288912.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p53288890.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p53288924.jpg"),
            705,
            535,
            98,
            0));
      } else if (i % mode == 5) {
        repositories.add(RecommendEntity.create(
            "https://img1.doubanio.com/icon/up153914094-8.jpg",
            "IDKAboutYou",
            "2018年上半年私人音乐报告",
            """今年上半年总共诞生了十三张A。(6)这里，我将会挑选出今年上半年个人最喜欢的50张专辑，最后再附上50张Honorable Mention，有排名。Top 30是Best of the Best 50 Uneven Paths: Deviant Pop From Europe 1980-1991 —— Various Artists Best Tracks：Pictures of Depature，Listen Over the Ocean，Cada Dia 受到70年代""",
            List()
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52337862.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52338055.jpg")
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p52338219.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52338236.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52338395.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52337985.jpg"),
            314,
            29,
            38,
            0));
      } else if (i % mode == 6) {
        repositories.add(RecommendEntity.create(
            "https://img3.doubanio.com/icon/up171923998-2.jpg",
            "April Queen",
            "2018年下半年私人音乐报告",
            """今年下半年总共诞生了十三张A。(7)这里，我将会挑选出今年上半年个人最喜欢的50张专辑，最后再附上50张Honorable Mention，有排名。Top 30是Best of the Best 50 Uneven Paths: Deviant Pop From Europe 1980-1991 —— Various Artists Best Tracks：Pictures of Depature，Listen Over the Ocean，Cada Dia 受到70年代""",
            List()
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p52338908.jpg")
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p52339477.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52339736.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52339612.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52339736.jpg")
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p52339838.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p52338910.jpg"),
            314,
            29,
            38,
            0));
      } else if (i % mode == 7) {
        repositories.add(RecommendEntity.create(
            "https://img3.doubanio.com/icon/up75627328-13.jpg",
            "穿普拉达的老王",
            "我的电影启蒙",
            """【不小心把原来的删了，重发一次无配图版以做存档】 (8)一、 我看第一部电影的具体时间已经不可考，但肯定是很早的。在我来成都读小学之前，父亲基本上都在一家电视报工作，工作虽不能说多么轻松，但时不时就会有的福利确实令不少人羡慕，免费看电影，便是其中之一。因为当时没有网络，影讯之类大部分只能通过报刊登载，而登""",
            List()
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p479682972.webp")
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1363250216.webp")
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2555084871.jpg")
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.webp")
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2549177902.jpg")
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2545472803.jpg")
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2542973862.jpg")
              ..add(
                  "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551393832.jpg"),
            43050,
            50000,
            308000,
            10000));
      } else if (i % mode == 8) {
        repositories.add(RecommendEntity.create(
            "https://img1.doubanio.com/icon/up38190418-17.jpg",
            "七荞",
            "旅游时遇到的奇特体验",
            """朋友的老公是瑞典斯德哥尔摩人，(0)在中国生活有二三十年了，眼看着耳顺了，忽然突发奇想拉老婆回国，开着房车载着老婆豪情壮志的说我带你看看瑞典！ 没想到瑞典空气实在是太好了，老婆醉氧，从头睡到尾。老公生气了，说你都不能抬头看看瑞典的景色吗！老婆说，我看了呀，一路都是天很蓝，云很白，树很绿，你看那群小洋房好看的。 为了让老婆好好的感受一下瑞典的美，老公找了个小镇，在大森""",
            List(),
            1807,
            5,
            211,
            9));
      } else if (i % mode == 9) {
        repositories.add(RecommendEntity.create(
            "https://img3.doubanio.com/icon/up41105044-80.jpg",
            "Lottie",
            "上一辈的困境",
            """只看了手稿的一部分，以后还有时间再来更新。 (9)（封面的字问过外婆，外婆说外公写的是“乱杂无章”，而非“乱杂世事”，谢谢网友指出） 我对外公没有任何记忆，他在我出生的前一年就因为哮喘去世了。仅有的一些了解都是从妈妈和外婆的口中得知的。 外公生于上世纪三十年代初，祖籍安徽。他性格沉默寡言，不喜名利，做了半辈子文""",
            List()
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p55532858.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p55532901.jpg")
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p55532909.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p55532910.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p55532942.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p55532955.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p55532972.jpg")
              ..add(
                  "https://img1.doubanio.com/view/note/l/public/p55532988.jpg")
              ..add(
                  "https://img3.doubanio.com/view/note/l/public/p55532871.jpg"),
            4305,
            500,
            308,
            0));
      }
    }

    return repositories;
  }

  Future<List<TypeEntity>> getData(int start) async {
    await Future.delayed(Duration(seconds: Utils.randomTime(2, 5)));
    return _getData();
  }

//  Future<bool> requestThumb(String id, bool thumb) async {
  void requestThumb(RecommendEntity data,
      NetworkValueChanged<RecommendEntity, bool> callback) {
    Future.delayed(Duration(seconds: Utils.randomTime(2, 5))).then((_) {
      if (data.id.endsWith("1")) {
        callback(data, false);
      } else {
        callback(data, true);
      }
    });
  }

//  Future<bool> requestComment(String id, bool thumb) async {
//    await Future.delayed(Duration(seconds: Utils.randomTime(2, 5)));
//    return true;
//  }
}

typedef NetworkValueChanged<T, E> = void Function(T value1, E value2);
