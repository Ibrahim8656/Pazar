
import 'package:SHOPPING/features/authentication/presentation/screens/athentication/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/features/Home/data/callservices/Home_callservice.dart';
import 'package:SHOPPING/features/Home/data/repository/home_repository.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_cubit.dart';
import 'package:SHOPPING/features/authentication/data/callservices/authetication_webservices.dart';
import 'package:SHOPPING/features/authentication/data/repository/authentication_repository.dart';
import 'package:SHOPPING/features/categories/cubit/categories_cubit.dart';
import 'package:SHOPPING/features/categories/data/Repository/categories_Repository.dart';
import 'package:SHOPPING/features/categories/data/callServices/categories_callService.dart';
import 'package:SHOPPING/sheared/myobserver.dart';

void main() {
   Bloc.observer = MyBlocObserver();
   
  DioHelper.init();
  runApp(const MyApp());
  CashHelper.init();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (_) => AuthCubit(AuthenticationRepository(AutheticationWebservices()))),
       BlocProvider(create: (_) => CategoriesCubit(CategoriesRepository(CategoriesCallservice()))..GetCategories()),
     BlocProvider(create: (_) => HomeCubit(HomeRepository(homeCallservice: HomeCallservice()))..GetHomedata())
   
      ],
      child: MaterialApp(
        home:  LoginScreen(),
      ),
    );
  }
}
