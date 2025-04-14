part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesLoadingState extends FavoritesState {}
final class FavoritesSuccessState extends FavoritesState {
  final FavoritesModel favoritesModel;

  FavoritesSuccessState(this.favoritesModel);
}
final class FavoritesErrorState extends FavoritesState {
  final String Error;

  FavoritesErrorState(this.Error);
}
final class CahngingFavoritesLoadingState extends FavoritesState {}
final class CahngingFavoritesSuccessState extends FavoritesState {
 // final AddfaforiteModel addfaforiteModel;

  CahngingFavoritesSuccessState();
}
final class CahngingFavoritesErrorState extends FavoritesState {
  final String Error;

 CahngingFavoritesErrorState(this.Error);
}
final class CHangingIconColorstate extends FavoritesState {}
