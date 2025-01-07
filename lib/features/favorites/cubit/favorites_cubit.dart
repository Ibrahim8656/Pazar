import 'dart:ui';

import 'package:SHOPPING/core/methods/showsnackbaar.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:SHOPPING/core/models/addfaforite_model.dart';
import 'package:SHOPPING/core/models/favorites_model.dart';
import 'package:SHOPPING/features/favorites/data/favorites_repository/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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

  Future<void>AddAndRemoveFavorite(String token,int ProductID,context)async{
    emit(CahngingFavoritesLoadingState()); 
    try{
    final responese=await favoritesRepository.AddAndRemoveFavorite(token, ProductID);
    HomeCubit.get(context)..GetHomedata();
    CartCubit.get(context)..GetCart();
    showSnackbar(context: context, message: responese.message!, color: Colors.grey);
    GetFavorites();
    print(responese.message);
    emit(CahngingFavoritesSuccessState(responese));
    }catch (error){
      print(error.toString());
      emit(CahngingFavoritesErrorState(error.toString()));
    }

}

}
