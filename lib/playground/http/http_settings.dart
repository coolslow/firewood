import 'dart:io';
import 'package:dio/dio.dart';

/// Http 相关配置信息类
class HttpSettings {
  static const _apiBaseUrl = 'http://www.yuque.com/api/v2/';
  // todo you need to add the yuque auth token here ...
  static const _authToken = '';
  static const _connectTimeout = 5000;
  static const _receiveTimeout = 5000;

  /// 基础请求设置，包含 [baseUrl], [headers], [contentType], [responseType]等
  static BaseOptions baseOptions = BaseOptions(
    method: 'GET',
    baseUrl: _apiBaseUrl,
    contentType: ContentType.json,
    responseType: ResponseType.json,
    headers: {
      "X-Auth-Token": _authToken,
    },
    connectTimeout: _connectTimeout,
    receiveTimeout: _receiveTimeout,
  );
}
