

import 'package:SHOPPING/core/methods/showsnackbaar.dart';
import 'package:SHOPPING/features/Cart/presentation/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Home/presentation/cubit/home_cubit.dart';
import 'package:SHOPPING/core/models/favorites_model.dart';
import 'package:SHOPPING/features/favorites/data/favorites_repository/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  Color? Iconcolor;
  List<ProductDataa> favoriteslist=[];
  final FavoritesRepository favoritesRepository;
  FavoritesCubit(this.favoritesRepository) : super(FavoritesInitial());
  static FavoritesCubit get(context)=>BlocProvider.of(context);
  Future<void>GetFavorites()async{
    emit(FavoritesLoadingState());
    try{
      final favorites=await favoritesRepository.GetfavoriesData(); 
      favoriteslist=favorites.data!.data;
      emit(FavoritesSuccessState(favorites),);
    }catch(error){
      print(error.toString(),);
      emit(FavoritesErrorState(error.toString(),),);
    }
  }
 bool isfave=true;
  Future<void>AddAndRemoveFavorite(String token,int ProductID,context,bool isfavee)async{
    emit(CahngingFavoritesLoadingState()); 
    try{
      isfave=isfavee;
    final responese=await favoritesRepository.AddAndRemoveFavorite(token, ProductID);
   await HomeCubit.get(context)..GetHomedata();
    showSnackbar(context: context, message: responese.message!, color: Colors.grey);
   // HomeCubit.get(context).GetHomedata();
    GetFavorites();
    CartCubit.get(context)..GetCart();
    
    emit(CahngingFavoritesSuccessState());
    }catch (error){
      emit(CahngingFavoritesErrorState(error.toString()));
    }

}


}
