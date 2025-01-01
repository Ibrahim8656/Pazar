import 'dart:io';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/features/Home/presentation/hime_layout.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_cubit.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_states.dart';
import 'package:SHOPPING/features/authentication/presentation/screens/athentication/Rigister.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:SHOPPING/core/Helpers/Dio_helper/dio_helper.dart';

class LoginScreen extends StatelessWidget {
  @override
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (BuildContext context, AuthStates state) {
        if (state is LoginsuccessState ) {
          if(state.Response.data!.token !=null){
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLayout(),
            ),
          );
          showSnackbar(context: context, message: state.Response.message!, color: Colors.green);
          CashHelper.SaveData("token", state.Response.data!.token);
          }
        }
        if(state is LoginwthierrorState){
           showSnackbar(context: context, message: "Rowng Email or passowrd ! ", color: Colors.red);
        }
      },
      builder: (BuildContext context, AuthStates state) {
        return Scaffold(
          backgroundColor: Colors.red,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Center(
                        child: Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 100),
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Textformfild(
                                'Enter email', 'Email', emailController, false),
                            SizedBox(height: 40),
                            Textformfild('Enter password', 'Password',
                                passwordController, true),
                            SizedBox(height: 40),
                            SizedBox(height: 60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ConditionalBuilder(
                                  condition: state is! Loginloadigstate,
                                  builder: (context) => TextButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        AuthCubit.get(context).Login(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    child: Center(child: Text('LOGIN')),
                                  ),
                                  fallback: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            TextButton(onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()),);
                            }, child: Text("Create New Account"),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
TextFormField Textformfild(String validatemessage, String hintText,
    TextEditingController controller, bool obscurstatus) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return validatemessage;
      }
      return null;
    },
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
    obscureText: obscurstatus,
  );
}

void showSnackbar(
    {required BuildContext context,
    required String message,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}
