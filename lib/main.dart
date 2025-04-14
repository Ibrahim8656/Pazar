
import 'package:SHOPPING/core/di/di.dart' as DioHelper;
import 'package:SHOPPING/features/Checkout/data/ApisKeys.dart';
import 'package:SHOPPING/sheared/myobserver.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey=Apiskeys.publishableKey;
   Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}
