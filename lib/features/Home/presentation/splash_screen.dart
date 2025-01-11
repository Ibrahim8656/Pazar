import 'package:SHOPPING/features/authentication/presentation/screens/athentication/Login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Navigate to the next screen after the splash screen
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 216, 216),
      body:Container(
        height: double.infinity,
        child: Center(child: Image.asset('assets/images/whitsplash.jpg',height: double.infinity,fit: BoxFit.fill,),),
      )
    );
  }
}
