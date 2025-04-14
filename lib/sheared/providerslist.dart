
import 'package:SHOPPING/features/Cart/data/Cart_Reposetory/Cart_Reposetory.dart';
import 'package:SHOPPING/features/Cart/data/Cart_callservice/Cart_callservice.dart';
import 'package:SHOPPING/features/Cart/presentation/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Home/presentation/screens/home_layout.dart';
import 'package:SHOPPING/features/Home/presentation/screens/splash_screen.dart';
import 'package:SHOPPING/features/authentication/data/callservices/authetication_webservices.dart';
import 'package:SHOPPING/features/Home/presentation/cubit/home_cubit.dart';
import 'package:SHOPPING/features/Home/data/callservices/Home_callservice.dart';
import 'package:SHOPPING/features/Home/data/repository/home_repository.dart';
import 'package:SHOPPING/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:SHOPPING/features/authentication/data/repository/authentication_repository.dart';
import 'package:SHOPPING/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:SHOPPING/features/categories/data/Repository/categories_Repository.dart';
import 'package:SHOPPING/features/categories/data/callServices/categories_callService.dart';
import 'package:SHOPPING/features/favorites/data/favorites_callservice/favorites_callservice.dart';
import 'package:SHOPPING/features/favorites/data/favorites_repository/favorites_repository.dart';
import 'package:SHOPPING/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.is_logedin});
  final bool is_logedin;
  @override
  Widget build(BuildContext context) {
    return providers();
  }

  MultiBlocProvider providers() {
    return MultiBlocProvider(
    providers: [
   BlocProvider(create: (_) => AuthCubit(AuthenticationRepository(AutheticationWebservices()))),
   BlocProvider(create: (_) => CategoriesCubit(CategoriesRepository(CategoriesCallservice()))..GetCategories()),
   BlocProvider(create: (_) => HomeCubit(HomeRepository(homeCallservice: HomeCallservice()))..GetHomedata()),
   BlocProvider(create: (_) => FavoritesCubit(FavoritesRepository(FavoritesCallservice()))..GetFavorites()),
   BlocProvider(create: (_) => CartCubit(CartReposetory(CartCallservice()))..GetCart()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: is_logedin?HomeLayout(): SplashScreen(),
    ),
  );
  }
}
