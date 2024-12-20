import 'package:flutter/material.dart';
import 'package:flutter_application_4/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:flutter_application_4/features/Home/cubit/home_cubit.dart';
import 'package:flutter_application_4/features/Home/data/callservices/Home_callservice.dart';
import 'package:flutter_application_4/features/Home/data/repository/home_repository.dart';
import 'package:flutter_application_4/features/Home/presentation/home_screen.dart';
import 'package:flutter_application_4/features/authentication/cubits/auth_cubit.dart';
import 'package:flutter_application_4/core/Helpers/Dio_helper/dio_helper.dart';
import 'package:flutter_application_4/features/authentication/data/repository/authentication_repository.dart';
import 'package:flutter_application_4/features/authentication/data/callservices/authetication_webservices.dart';
import 'package:flutter_application_4/features/authentication/presentation/screens/athentication/Login_screen.dart';
import 'package:flutter_application_4/sheared/myobserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
     BlocProvider(create: (_) => HomeCubit(HomeRepository(homeCallservice: HomeCallservice()))..GetHomedata())
   
      ],
      child: MaterialApp(
        home:  LoginScreen(),
      ),
    );
  }
}
