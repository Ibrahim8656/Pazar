import 'package:dio/dio.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';

class FavoritesCallservice {
  
  Future<Map<String,dynamic>>GetfavoriesData()async{
    Response response=await DioHelper.Getdata(Url: "favoraites");
    return response.data;
  }
  Future<Map<String,dynamic>>AddAndRemoveFavorite(String token,data)async{
      Response response=await DioHelper.postdata(Url: "favorites",token: token, data: data);
      return response.data;
  }
}