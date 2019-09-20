import 'package:dio/dio.dart';
import 'package:firewood/playground/http/http_settings.dart';

/// HttpUtls 提供统一的网络访问方法
class HttpUtils {
  // BaseOptions 配置
  static BaseOptions _baseOptions = HttpSettings.baseOptions;
  static Dio _dio = Dio(_baseOptions);

  static Future<Response> request(
    String path, {
    String method,
    dynamic data,
    Map<String, dynamic> params,
  }) async {
    String _method = method ?? 'GET';
    Map<String, dynamic> _params = params ?? null;
    dynamic _data = data ?? null;
    Options _options = Options().merge(method: _method);

    print(_options);

    Response response;

    // Dio 拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求被发送之前执行的相关操作
        onRequest: (RequestOptions options) async {
          print('请求发送前执行操作, $options');
          return options;
        },
        // 返回响应数据之前执行的预处理操作
        onResponse: (Response response) async {
          print('返回响应数据之前执行的预处理操作 ' + response.toString());
          return response;
        },
        // 请求失败时执行的预处理操作
        onError: (DioError e) async {
          print('Dio错误 ' + e.toString());
          return e;
        },
      ),
    );

    try {
      response = await _dio.request(
        path,
        data: _data,
        queryParameters: _params,
        options: _options,
      );
      print(response.data);
    } on DioError catch (e) {
      print('响应错误: ' + e.toString());
    }
    return response;
  }
}
