import 'package:dio/dio.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';

class CategoriesCallservice {

Future<Map<String,dynamic>>GetCategories()async{
  
    Response response=await DioHelper.Getdata(Url: 'categories');
return response.data;
  
}
}