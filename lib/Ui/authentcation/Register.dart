

import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/authentcation/Login.dart';
import 'package:flutter_application_4/cubit/app_login_cubit_cubit.dart';
import 'package:flutter_application_4/cubit/app_login_cubit_state.dart';
import 'package:flutter_application_4/sheared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

File? imageFile;

class _RegisterState extends State<Register> {
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  var formky = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController imagecontroller = TextEditingController();

  TextEditingController passowrdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, ApploginStates>(
        listener: (context, state) {
          if (state is RegisterSccessState) {
            if (AppLoginCubit.Registerstatus) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
              Showsnackbar(context, '${AppLoginCubit.registerModel!.message}');
            } else {
              Showsnackbar(context, '${AppLoginCubit.registerModel!.message}');
            }
          } else if (state is RegisterEroorState) {
            Showsnackbar(context, 'error');
          }
          // TODO: implement listener
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
                                  'Register',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'enter name';
                                    }
                                    return null;
                                  },
                                  controller: namecontroller,
                                  decoration: InputDecoration(hintText: 'name'),
                                ),
                                SizedBox(height: 40),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'enter name';
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
                                      return 'enter email';
                                    }
                                    return null;
                                  },
                                  controller: passowrdcontroller,
                                  decoration:
                                      InputDecoration(hintText: 'password'),
                                ),
                                SizedBox(height: 40),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'enter phone';
                                    }
                                    return null;
                                  },
                                  controller: phonecontroller,
                                  decoration:
                                      InputDecoration(hintText: 'phone'),
                                ),
                                SizedBox(height: 40),
                                if (imageFile != null) Image.file(imageFile!),
                                InkWell(
                                  onTap: pickImage,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xFFF1F4F8),
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        right: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        top: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: pickImage,
                                          icon: Icon(Icons.image,
                                              color: Colors.black26),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Text('select image',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ConditionalBuilder(
                                        condition:
                                            state is! AppLoadRegisterState,
                                        builder: (context) => defbotton(
                                            textt: 'Register',
                                            onpressed: () {
                                              print(imageFile!.path);
                                              if (formky.currentState!
                                                  .validate()) {
                                                print(passowrdcontroller.text);
                                                AppLoginCubit.get(context)
                                                    .Register(
                                                        email: emailcontroller
                                                            .text,
                                                        password:
                                                            passowrdcontroller
                                                                .text,
                                                        name:
                                                            namecontroller.text,
                                                        phone: phonecontroller
                                                            .text,
                                                        image: imageFile);
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
                                SizedBox(
                                  height: 50,
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

  void Showsnackbar(BuildContext context, String Textmessage) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(Textmessage)));
  }
}
