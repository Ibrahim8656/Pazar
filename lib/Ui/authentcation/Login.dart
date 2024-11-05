import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/authentcation/Register.dart';
import 'package:flutter_application_4/cubit/app_login_cubit_cubit.dart';
import 'package:flutter_application_4/cubit/app_login_cubit_state.dart';
import 'package:flutter_application_4/homelayout.dart';

import 'package:flutter_application_4/sheared/ShearedPrefrences.dart';
import 'package:flutter_application_4/sheared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  var formky = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passowrdcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement bclass Login extends StatelessWidget {uild
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, ApploginStates>(
        listener: (context, state) {
          if (state is LoginSccessState) {
            if (AppLoginCubit.LoginStatus) {
              CashHelper.SaveData('token', AppLoginCubit.userModel!.data!.token)
                  .then((onValue) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Homelayout()),
                  (Route) {
                    return false;
                  },
                );
              });

              Showsnackbar(
                context,
                '${AppLoginCubit.get(context).massge}',
                Colors.green,
              );
            } else {
              Showsnackbar(
                  context, '${AppLoginCubit.get(context).massge}', Colors.red);
            }
          } else if (state is LoginEroorState) {
            Showsnackbar(context, 'Login error: ${state.error}', Colors.red);
          }
        },
        builder: (context, state) {
          return Form(
            key: formky,
            child: Scaffold(
                backgroundColor: Colors.red,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0, top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            color: Colors.white),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SignUp',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'enter email';
                                    }
                                    return null;
                                  },
                                  controller: emailcontroller,
                                  decoration:
                                      InputDecoration(hintText: 'email'),
                                ),
                                SizedBox(height: 40),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'enter Passowrd';
                                    }
                                    return null;
                                  },
                                  controller: passowrdcontroller,
                                  decoration:
                                      InputDecoration(hintText: 'Passowrd'),
                                ),
                                SizedBox(height: 63),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ConditionalBuilder(
                                        condition: state is! AppLoadingState,
                                        builder: (context) => defbotton(
                                            textt: 'login',
                                            onpressed: () {
                                              if (formky.currentState!
                                                  .validate()) {
                                                print(passowrdcontroller.text);
                                                AppLoginCubit.get(context)
                                                    .Login(
                                                        Email: emailcontroller
                                                            .text,
                                                        password:
                                                            passowrdcontroller
                                                                .text);
                                              }
                                            }),
                                        fallback: (context) => Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: Text('Create New Account?')),
                                SizedBox(
                                  height: 280,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  void Showsnackbar(BuildContext context, String Textmessage, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(Textmessage),
      backgroundColor: color,
    ));
  }
}
