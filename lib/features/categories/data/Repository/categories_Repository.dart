import 'package:SHOPPING/core/models/categories_model.dart';
import 'package:SHOPPING/features/categories/data/callServices/categories_callService.dart';

class CategoriesRepository {
final CategoriesCallservice categoriesCallservice;

  CategoriesRepository(this.categoriesCallservice);
  Future<CategoryModel>GetCategories()async{
   final Category=await categoriesCallservice.GetCategories();
   CategoryModel categoryModel=CategoryModel.fromJson(Category);
   return categoryModel;
  }
 

}