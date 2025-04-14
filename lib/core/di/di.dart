import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:get_it/get_it.dart';
import 'package:SHOPPING/features/Cart/data/Cart_callservice/Cart_callservice.dart';
import 'package:SHOPPING/features/Cart/data/Cart_Reposetory/Cart_Reposetory.dart';
import 'package:SHOPPING/features/Checkout/data/ApisKeys.dart';
import 'package:SHOPPING/features/favorites/data/favorites_callservice/favorites_callservice.dart';
import 'package:SHOPPING/features/favorites/data/favorites_repository/favorites_repository.dart';
import 'package:SHOPPING/features/Home/data/callservices/Home_callservice.dart';
import 'package:SHOPPING/features/Home/data/repository/home_repository.dart';
import 'package:SHOPPING/features/authentication/data/callservices/authetication_webservices.dart';
import 'package:SHOPPING/features/authentication/data/repository/authentication_repository.dart';
import 'package:SHOPPING/features/categories/data/callServices/categories_callService.dart';
import 'package:SHOPPING/features/categories/data/Repository/categories_Repository.dart';
import 'package:SHOPPING/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:SHOPPING/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:SHOPPING/features/Home/presentation/cubit/home_cubit.dart';
import 'package:SHOPPING/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:SHOPPING/features/Cart/presentation/cubit/cart_cubit.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External Dependencies
  
  sl.registerLazySingleton(() => DioHelper());
  sl.registerLazySingleton(() => CashHelper());

  // Register SharedPreferences with await
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);  // Register after fetching the instance
  
  // Repositories
  sl.registerLazySingleton(() => AuthenticationRepository(AutheticationWebservices()));
  sl.registerLazySingleton(() => CategoriesRepository(CategoriesCallservice()));
  sl.registerLazySingleton(() => HomeRepository(homeCallservice: HomeCallservice()));
  sl.registerLazySingleton(() => FavoritesRepository(FavoritesCallservice()));
  sl.registerLazySingleton(() => CartReposetory(CartCallservice()));

  // Cubits
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => CategoriesCubit(sl())..GetCategories());
  sl.registerFactory(() => HomeCubit(sl())..GetHomedata());
  sl.registerFactory(() => FavoritesCubit(sl())..GetFavorites());
  sl.registerFactory(() => CartCubit(sl())..GetCart());

  // Setup your API keys or configurations
  Stripe.publishableKey = Apiskeys.publishableKey;
}
