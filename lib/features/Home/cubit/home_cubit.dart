import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:flutter_application_4/core/models/Homemodel.dart';
import 'package:flutter_application_4/features/Home/data/repository/home_repository.dart';
import 'package:flutter_application_4/features/Home/presentation/Productsscreen.dart';
import 'package:flutter_application_4/features/Home/presentation/catigoreis.dart';
import 'package:flutter_application_4/features/Home/presentation/favorites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> Screens = [
    Productsscreen(),
    CatigoreisScreen(),
    FavoritesScreen(),
  ];

  List <String>AppBarTitle=["Products","Categories","favorites"];
  void ontaponbottomnavigationbar(int index) {
    currentIndex = index; // Update the currentIndex
    emit(HomeCurrentIndexChangedState()); 
    
  }
bool isDataLoaded=false;
Data? data;
List<Products>? Allproducts ;
Future<void> GetHomedata() async {
   if (isDataLoaded) {
      return; // if data is already loaded, do nothing
    }
  emit(HomeDataLoadingState());
  try {
    final homedata = await homeRepository.GetHomedata();
     data= await homedata.data;
     Allproducts=await homedata.data!.products;
    emit(HomeDataSuccessState(homemodel: homedata));
  } catch (error) {
    print(error.toString());
    emit(HomeDataErrorState(Error: error.toString()));
  }
}

}
