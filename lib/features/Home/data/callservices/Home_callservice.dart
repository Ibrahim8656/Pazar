import 'package:dio/dio.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';

class HomeCallservice {
  Future<Map<String,dynamic>>GetHomedata()async{
    Response response= await DioHelper.Getdata( Url: "home", token: CashHelper.Getdata("token"));
    return response.data;
  }
}