import 'package:bloc/bloc.dart';
import 'package:SHOPPING/core/models/categories_model.dart';
import 'package:SHOPPING/features/categories/data/Repository/categories_Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesCubit(this.categoriesRepository) : super(CategoriesInitial());
   static CategoriesCubit get(context) => BlocProvider.of(context);
   
   List<Category>? Categorys=[];
  Future<void> GetCategories() async {
    emit(CategoriesLoadingState());
    try {
      final Category = await categoriesRepository.GetCategories();
       Categorys= await Category.data!.categories;
      emit(CategoriesCuccessState(Category));  
    } catch (error) {
      print(
        error.toString(),
      );
      emit(
        CategoriesErrorState(
          error.toString(),
        ),
      );
    }
  }
}
