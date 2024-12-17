import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_4/features/authentication/data/Dio_helper/dio_helper.dart';
import 'package:http_parser/http_parser.dart';

class AutheticationWebservices {
  Future<Map<String, dynamic>> Register({
    required String name,
    required String phone,
    required String email,
    required String password
  }) async {
    try {
      Response response = await DioHelper.postdata(Url: "register", data: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
       
      });

      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
  Future<Map<String, dynamic>> Login({
    required String email,
    required String password
  }) async {
    try {
      Response response = await DioHelper.postdata(Url: "login", data: {
        "email": email,
        "password": password,
       
      });

      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
