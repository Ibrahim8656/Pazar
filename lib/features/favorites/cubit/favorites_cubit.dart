import 'package:bloc/bloc.dart';
import 'package:SHOPPING/core/models/addfaforite_model.dart';
import 'package:SHOPPING/core/models/favorites_model.dart';
import 'package:SHOPPING/features/favorites/data/favorites_repository/favorites_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository favoritesRepository;
  FavoritesCubit(this.favoritesRepository) : super(FavoritesInitial());
  static FavoritesCubit get(context)=>BlocProvider.of(context);
  Future<void>GetFavorites()async{
    emit(FavoritesLoadingState());
    try{
      final favorites=await favoritesRepository.GetfavoriesData(); 
      emit(FavoritesSuccessState(favorites),);
    }catch(error){
      print(error.toString(),);
      emit(FavoritesErrorState(error.toString(),),);
    }
  }

  Future<void>AddAndRemoveFavorite(String token,data)async{
    emit(CahngingFavoritesLoadingState()); 
    try{
    final responese=await favoritesRepository.AddAndRemoveFavorite(token, data);
    emit(CahngingFavoritesSuccessState(responese));
    }catch (error){
      print(error.toString());
      emit(CahngingFavoritesErrorState(error.toString()));
    }

}
}
