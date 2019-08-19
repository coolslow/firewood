class RecommendEntity {
  String portrait;// 头像
  String name;// 名称
  String topic;// 话题
  String description;// 描述
  List<String> images;// 图片
  int thumbNumber; // 赞数
  int commentNumber; // 评论数
  int forwardNumber; // 转发数
  int collectNumber; // 收藏数

  RecommendEntity.create(
      this.portrait,
      this.name,
      this.topic,
      this.description,
      this.images,
      this.thumbNumber,
      this.commentNumber,
      this.forwardNumber,
      this.collectNumber);

}
