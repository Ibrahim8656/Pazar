import 'package:flutter/material.dart';
import 'package:flutter_application_4/business%20logic/authentication/auth_cubit.dart';
import 'package:flutter_application_4/data/Dio_helper/dio_helper.dart';
import 'package:flutter_application_4/data/repository/authentication_repository.dart';
import 'package:flutter_application_4/data/webservices/authentication/authetication_webservices.dart';
import 'package:flutter_application_4/presentation/screens/athentication/Login_screen.dart';
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
