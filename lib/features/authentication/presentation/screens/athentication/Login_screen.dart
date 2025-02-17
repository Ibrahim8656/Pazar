
import 'package:SHOPPING/core/methods/showsnackbaar.dart';
import 'package:SHOPPING/core/widgets/custoumTextformfild.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/features/Home/presentation/home_layout.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_cubit.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_states.dart';
import 'package:SHOPPING/features/authentication/presentation/screens/athentication/Rigister.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginsuccessState) {
          if (state.Response.data!.token != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeLayout(),
              ),
            );
            showSnackbar(
                context: context,
                message: state.Response.message!,
                color: Colors.green);
            CashHelper.SaveData("token", state.Response.data!.token);
          }
        }
        if (state is LoginwthierrorState) {
          showSnackbar(
              context: context,
              message: "Wrong Email or Password!",
              color: Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primarycolor,
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
                    padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print(CashHelper.Getdata("token"));
                                  },
                                  child: Text(
                                    'PAZAR',
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 100),
                            Text(
                              ' Login',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
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
                                  builder: (context) => Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primarycolor,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          AuthCubit.get(context).Login(
                                              email: emailController.text,
                                              password: passwordController.text);
                                        }
                                      },
                                      child: Center(
                                          child: Text('LOGIN',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))),
                                    ),
                                  ),
                                  fallback: (context) => Center(
                                    child: CircularProgressIndicator(
                                      color: primarycolor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: Text("Create New Account ?"),
                            )
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





