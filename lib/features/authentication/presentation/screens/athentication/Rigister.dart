import 'package:SHOPPING/core/widgets/custoumTextformfild.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_cubit.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_states.dart';
import 'package:SHOPPING/features/authentication/presentation/screens/athentication/Login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   final  formKey = GlobalKey<FormState>();
   
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor
      ,
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          // Check state here and navigate accordingly
          if (state is RegistersuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
            showSnackbar(
                context: context,
                message: state.Response.message!,
                color: Colors.green);
          } else if (state is RegisterwthierrorState) {
            showSnackbar(
                context: context,
                message: state.Response.message!,
                color: primarycolor);
          }
        },
        builder: (context, state) {
          return Column(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
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
                                Text(
                                  'SignUp',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 100),
                            Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Textformfild('Enter name', "Name", nameController, false),
                            SizedBox(height: 40),
                            Textformfild('Enter email', 'Email', emailController, false),
                            SizedBox(height: 40),
                            Textformfild('Enter password', 'Password', passwordController, true),
                            SizedBox(height: 40),
                            Textformfild('Enter phone', 'Phone', phoneController, false),
                            SizedBox(height: 40),
                            SizedBox(height: 60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ConditionalBuilder(
                                  condition: state is! Registerloadigstate,
                                  builder: (context) => Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: primarycolor,
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          AuthCubit.get(context).Register(
                                            nameController.text,
                                            phoneController.text,
                                            emailController.text,
                                            passwordController.text,
                                          );
                                        }
                                      },
                                      child: Center(child: Text('Register',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                                    ),
                                  ),
                                  fallback: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  

  void showSnackbar({required BuildContext context, required String message, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}
