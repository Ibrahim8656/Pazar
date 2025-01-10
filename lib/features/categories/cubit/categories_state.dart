part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesCuccessState extends CategoriesState {
  final CategoryModel categoryModel;

  CategoriesCuccessState(this.categoryModel);
}

class CategoriesErrorState extends CategoriesState {
  final String Error;

  CategoriesErrorState(this.Error);
}

class GetCategoriesDetailsLoadingState extends CategoriesState {}

class GetCategoriesDetailsCuccessState extends CategoriesState {
  final Categorisdetailedmodel categorisdetailedmodel;

  GetCategoriesDetailsCuccessState(this.categorisdetailedmodel);
}

class GetCategoriesDetailsErrorState extends CategoriesState {
  final String Error;

  GetCategoriesDetailsErrorState(this.Error);
}
