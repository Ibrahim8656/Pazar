import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:dio/dio.dart';

class CartCallservice {
  Future<Map<String,dynamic>>GetCart()async{
    Response response=await DioHelper.Getdata(Url: "carts",token: CashHelper.Getdata("token"),);
    return response.data;
  }
  Future<Map<String,dynamic>>AddAndRemoveCart(int product_id)async{
Response response=await DioHelper.postdata(Url: "carts", data: {
  "product_id": product_id
},token: CashHelper.Getdata("token"));
return response.data;
  }
}