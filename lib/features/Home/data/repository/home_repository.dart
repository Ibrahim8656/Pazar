import 'package:SHOPPING/core/models/Homemodel.dart';
import 'package:SHOPPING/features/Home/data/callservices/Home_callservice.dart';

class HomeRepository {
 final HomeCallservice homeCallservice;

  HomeRepository({required this.homeCallservice});
  Future<Homemodel>GetHomedata()async{
    final responsedata=await homeCallservice.GetHomedata();
    Homemodel homedata= Homemodel.fromJson(responsedata);
    return homedata;
  }
}