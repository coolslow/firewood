import 'dart:io';

import 'package:dio/dio.dart';

class HttpService {
  static Dio _dio = new Dio();

//  static var _baseURL = "http://172.16.41.131:8080/";
  static var _baseURL = "https://github.com/xsbailong/douban-api/blob/master/";

  static late HttpService _instance;

  static HttpService getInstance() {
    if (_instance == null) {
      _instance = new HttpService._();
    }
    return _instance;
  }

  HttpService._() {
    BaseOptions options = new BaseOptions(
        baseUrl: _baseURL,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {HttpHeaders.acceptHeader: "accept: application/json"});

    _dio.options = options;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print("=========>onRequest");
//          _dio.resolve("aaaaaaaaa");
        },
        onResponse: (Response e, ResponseInterceptorHandler handler) {
          print("=========>onResponse");
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
          print("=========>onError ${e.message}");
        },
      ),
    );

//    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//        (client) {
//      client.findProxy = (uri) {
//        return 'PROXY 172.16.41.131:8888';
//      };
//
//      client.badCertificateCallback =
//          (X509Certificate cert, String host, int port) {
//        print(
//            "=========>X509Certificate  cert=$cert      host=$host      port=$port");
//        return true;
//      };
//    };
  }

  Future<String> get(String path,
      {required Map<String, dynamic> parameters}) async {
    Response<String> response;
    try {
      response = await _dio.get<String>(path, queryParameters: parameters);

      print(response.data.toString());

      return response.data.toString();
    } catch (e) {
      print("====get===catch===> $e");
    }
    return "";
  }
}
