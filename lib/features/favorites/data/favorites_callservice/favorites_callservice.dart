import 'package:dio/dio.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';

class FavoritesCallservice {
  
  Future<Map<String,dynamic>>GetfavoriesData()async{
    Response response=await DioHelper.Getdata(Url: "favorites",token:CashHelper.Getdata("token") );
    return response.data;
  }
 Future<Map<String, dynamic>> AddAndRemoveFavorite(String token, int ProductID) async {
  // Create FormData instance
  FormData formData = FormData.fromMap({
    'product_id': ProductID, // Replace 'product_id' with the actual key expected by the API
  });

  // Make the POST request
  Response response = await DioHelper.postdata(
    Url: "favorites",
    token: CashHelper.Getdata("token"),
    data: formData,
  );

  return response.data;
}

}