import 'package:SHOPPING/features/Cart/presentation/screens/cart_Screen.dart';
import 'package:SHOPPING/features/profile/presentation/screens/Profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/models/Homemodel.dart';
import 'package:SHOPPING/features/Home/data/repository/home_repository.dart';
import 'package:SHOPPING/features/Home/presentation/screens/home_screen.dart';
import 'package:SHOPPING/features/categories/presentation/screens/categories_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> Screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(
      Address: '',
    ),
    Profilescreen()
  ];

  List<String> AppBarTitle = ["Products", "Categories", "favorites"];
  void ontaponbottomnavigationbar(int index) {
    currentIndex = index; // Update the currentIndex
    emit(HomeCurrentIndexChangedState());
  }

  bool isDataLoaded = false;
  List<Banners>? data = [];
  List<Products> Allproducts = [];
  Future<void> GetHomedata() async {
    if (isDataLoaded) {
      return; // if data is already loaded, do nothing
    }
    emit(HomeDataLoadingState());
    try {
      final homedata = await homeRepository.GetHomedata();
      data = await homedata.data!.banners;
      Allproducts = await homedata.data!.products ?? [];
      emit(HomeDataSuccessState(homemodel: homedata));
    } catch (error) {
      emit(HomeDataErrorState(Error: error.toString()));
    }
  }

  List<Products> SearchProductList = [];
  Search(String Searchedname) {
    SearchProductList = Allproducts.where(
            (product) => product.name!.toLowerCase().startsWith(Searchedname))
        .toList();
    emit(shearshingState());
  }
}
