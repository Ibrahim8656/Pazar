import 'package:flutter/material.dart';
import 'package:flutter_application_4/features/authentication/cubits/auth_cubit.dart';
import 'package:flutter_application_4/features/authentication/data/Dio_helper/dio_helper.dart';
import 'package:flutter_application_4/features/authentication/data/repository/authentication_repository.dart';
import 'package:flutter_application_4/features/authentication/data/webservices/authentication/authetication_webservices.dart';
import 'package:flutter_application_4/features/authentication/presentation/screens/athentication/Login_screen.dart';
import 'package:flutter_application_4/sheared/myobserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
   Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthenticationRepository(AutheticationWebservices())),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: LoginScreen(),
      ),
    );
  }
}
