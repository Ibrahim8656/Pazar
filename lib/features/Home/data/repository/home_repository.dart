import 'package:flutter_application_4/core/models/Homemodel.dart';
import 'package:flutter_application_4/features/Home/data/callservices/Home_callservice.dart';

class HomeRepository {
 final HomeCallservice homeCallservice;

  HomeRepository({required this.homeCallservice});
  Future<Homemodel>GetHomedata()async{
    final responsedata=await homeCallservice.GetHomedata();
    Homemodel homedata= Homemodel.fromJson(responsedata);
    return homedata;
  }
}