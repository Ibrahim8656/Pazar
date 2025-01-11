import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:dio/dio.dart';

class Profilecallserver {

  Future <Map<String,dynamic>>GetProfile()async{
    Response response=await DioHelper.Getdata(Url: "profile",token: CashHelper.Getdata("token"));
    return response.data;
  }
}