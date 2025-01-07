import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:dio/dio.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';

class CategoriesCallservice {

Future<Map<String,dynamic>>GetCategories()async{
  
    Response response=await DioHelper.Getdata(Url: 'categories');
return response.data;
  
}

}