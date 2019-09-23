import 'package:dio/dio.dart';
import 'package:firewood/playground/http/http_utils.dart';

class Apis {
  /// 获取用户Auth验证信息
  static Future<Response> userAuthValidation(String path) {
    return HttpUtils.request(path);
  }

  /// 获取语雀用户登录信息
  static Future<Response> getUserInfoById(String path) {
    Map<String, dynamic> _params = {
      'name': 'ming',
      'userId': 123,
      'age': 23,
      'company': 'www.danke.life',
    };

    print(_params is Map);
    return HttpUtils.request(path);
  }

  /// 在用户账户下创建新的知识库
  static Future<Response> createKnowledgeRepo(
    String path,
    dynamic data,
    // Map<String, dynamic> params,
  ) {
    return HttpUtils.request(path, method: 'POST', data: data);
  }
}
