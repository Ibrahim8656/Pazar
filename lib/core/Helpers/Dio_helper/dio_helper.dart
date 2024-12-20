import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/sheared/constatnts.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      'Content-Type': 'application/json',
      'lang': 'en',
    }));
  }

  static Future<Response> Getdata(
      {required String Url, required String token}) async {
    dio.options.headers = {
      'Authorization': token,
      'lang': 'en',
    };
    return dio.get(Url);
  }

  static Future<Response> postdata({
    required String Url,
    String? token,
    required data
  }) async{
    dio.options.headers={
       'Authorization': token,
      'lang': 'en',
    };
   return dio.post(Url,data: data );
 
  }
}
