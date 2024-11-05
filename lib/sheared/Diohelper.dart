import 'package:dio/dio.dart';
import 'package:flutter_application_4/sheared/Constants.dart';
class Diohelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: BaseUrl, receiveDataWhenStatusError: true, headers: {
        'Content-Type': 'application/json',
        'lang': 'en',
      }),
    );
  }

  static Future<Response> getdata(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {
      'Authorization': token,
      'lang': 'en',
    };
    return dio.get(url, queryParameters: query);
  }

  static Future<Response> Postdata(
      {required String url,
      Map<String, dynamic>? query,
      required data,
      String? token}) async {
    dio.options.headers = {
      'Authorization': token,
      'lang': 'en',
    };
    return dio.post(url, queryParameters: query, data: data);
  }
}
