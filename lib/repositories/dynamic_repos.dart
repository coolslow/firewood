import 'dart:math';

import 'package:firewood/entity/dynamic_create_entity.dart';
import 'package:firewood/entity/dynamic_entity.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';

class DynamicRepos {
  List<TypeEntity> repositories = List<TypeEntity>();

  DynamicRepos.create() {

    repositories
        .add(DynamicCreateEntity.create("8月22日，周三", "开始记录", """这里很安静，暂时没有认识的人
记录此刻的心情...
或是印象深刻的电影、书籍、音乐
平凡，但重要...
        """));

    repositories.add(DynamicEntity.create(
      "https://img3.doubanio.com/icon/up36814583-2.jpg",
      "马文先生",
      "当代社畜话术",
      """作为当代社畜，你有哪些运用自如的话术？或一眼识破过哪些“鸽王”的话术？一起来分享“鸽”经验吧：）""",
      8715000,
    ));

    repositories.add(DynamicEntity.create(
        "https://img3.doubanio.com/icon/up69658283-22.jpg",
        "Whatever",
        "7日自制便当计划",
        """7日计划第一弹 ｜“重复的日子里，我坚持下来的一件小事。” 要求： 1、每天用镜头（图片、视频皆可）记录你用心制作的便当，标注日期，并用简短的文字介绍制作原料和制作过程 \n2、活动期间累积参与话题 7 次即有机会获得精美奖品（详情见置顶广播）""",
        45));

    repositories.add(DynamicEntity.create(
        "https://img3.doubanio.com/icon/up180055214-15.jpg",
        "因为我是tyt",
        "是什么让你发现自己已经不再年轻了？",
        """是两鬓新添的白发？是日渐长大的儿女？还是不敢长熬的夜？还是日渐脆弱的身体？""",
        73));

    repositories.add(DynamicEntity.create(
        "https://img1.doubanio.com/icon/up125141205-7.jpg",
        "鹧鸪 4",
        "日剧教给我的恋爱观",
        """在表现恋爱上，相比于打磨浪漫细节、铺张美好气氛的偶像剧、韩剧等等，日剧似乎更倾向于直抵恋爱的残酷真相，唤起我们普通人的共鸣。看日剧让你对爱情有了什么样的新看法？""",
        187));

    repositories.add(DynamicEntity.create(
      "https://img3.doubanio.com/icon/up4448539-32.jpg",
      "夜第七章",
      "我的365天摄影日记",
      """每天一张最能说明你当日生活的摄影作品，一段不啰嗦的文字描述，用文字和影像简单记录你的生活。可以琐碎，但务必真实。 
要求： 
 1、不许发自拍 
 2、精选一张你的摄影作品即可，请忍住不要发九宫格 
3、不鼓励无意义的打卡，请记录你真正想记录的内容""",
      705,
    ));

    repositories.add(DynamicEntity.create(
        "",
        "运动",
        "FIRE运动践行计划",
        """FIRE（Financial independence,Retire early）生活——即以“尽早实现经济独立，提前过上退休生活”为目标的一种生活方式。为了过上 FIRE 生活，人们放弃对财富和事业的追求，改为对自身和时间的提炼与向往，即真正为了自己而活。聊聊你理想中的 FIRE 生活，以及为了过上这样的生活，你正在付出怎样的努力？""",
        314,
        sponsor: DynamicEntity.doubanSponsor));

    repositories.add(DynamicEntity.create(
        "https://img3.doubanio.com/icon/up171923998-2.jpg",
        "April Queen",
        "充实清晨1小时计划",
        """早睡早起的道理，每个人都懂。但熬夜睡懒觉的理由，每个人都有。最重要的就是，是不是有计划，能不能坚持。希望大家都能做好起床第1个小时的计划哦！""",
        314));

    repositories.add(DynamicEntity.create(
        "https://img3.doubanio.com/icon/up75627328-13.jpg",
        "穿普拉达的老王",
        "你理想中的“小窝”是什么样子的",
        """艾瑞巴蒂都有自己心中最最舒服的小窝的模样，有的人想要有大大的庭院，有的人希望有个可以看到夕阳的阳台，有的人喜欢有浴缸的浴室，有的人更爱装个吊床惬意的享受~说出你梦想中小窝的样子吧~让我们一起为了未来的小窝加油＾０＾~""",
        43050));

    repositories.add(DynamicEntity.create(
        "https://img1.doubanio.com/icon/up38190418-17.jpg",
        "七荞",
        "我的电影启蒙",
        """有哪些诞生于你出生时代的电影，给你留下了深刻的影响""",
        1807));

    repositories.add(DynamicEntity.create(
        "https://img3.doubanio.com/icon/up41105044-80.jpg",
        "Lottie",
        "你镜头下的决定性瞬间",
        """那些精彩的、不可复制的抓拍，也许是等待多时的美景，也许是令人捧腹的瞬间，又或许有着背后的故事，可以分享出来吗？""",
        4305));
  }

  List<TypeEntity> getData() {
    return repositories;
  }

  String getLabel() {
    return "写点什么吧...";
  }
}
