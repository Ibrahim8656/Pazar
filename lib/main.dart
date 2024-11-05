import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/authentcation/Login.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/homelayout.dart';
import 'package:flutter_application_4/sheared/Diohelper.dart';
import 'package:flutter_application_4/sheared/ShearedPrefrences.dart';
import 'package:flutter_application_4/sheared/blocobserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  CashHelper.init();
  
  String token = CashHelper.Getdata('token') ?? '';
  Widget widget = Login();
  if (token != '') widget = Homelayout();
  runApp(MyApp(
    StartWedgit: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget StartWedgit;

  MyApp({required this.StartWedgit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Shopcupit(),
        
      child: BlocConsumer<Shopcupit, Shopstates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: StartWedgit,
          );
        },
      ),
    );
  }
}
