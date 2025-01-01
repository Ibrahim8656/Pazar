import 'package:dio/dio.dart';
import 'package:SHOPPING/core/models/addfaforite_model.dart';
import 'package:SHOPPING/core/models/favorites_model.dart';
import 'package:SHOPPING/features/favorites/data/favorites_callservice/favorites_callservice.dart';

class FavoritesRepository {
  final FavoritesCallservice favoritesCallservice;

  FavoritesRepository(this.favoritesCallservice);
  Future<FavoritesModel>GetfavoriesData()async{
    final favoritesdata=await favoritesCallservice.GetfavoriesData();
    FavoritesModel favoritesModel=FavoritesModel.fromJson(favoritesdata);
    return favoritesModel;
  }
   Future<AddfaforiteModel>AddAndRemoveFavorite(String token,data)async{
    final response=await favoritesCallservice.AddAndRemoveFavorite(token, data);
     AddfaforiteModel addfaforiteModel =AddfaforiteModel.fromJson(response);
     return addfaforiteModel;
   }
}