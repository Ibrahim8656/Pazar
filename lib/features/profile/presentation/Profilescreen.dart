import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_cubit.dart';
import 'package:SHOPPING/features/profile/cubit/profile_cubit.dart';
import 'package:SHOPPING/features/profile/data/profileRepository/profileRepository.dart';
import 'package:SHOPPING/features/profile/data/profilecallserver/profilecallserver.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) =>
          ProfileCubit(Profilerepository(Profilecallserver()))..GetProfile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final profileuser = ProfileCubit.get(context).userdata;
          return Scaffold(
            body: profileuser != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: primarycolor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 40, left: 25),
                                      child: Icon(
                                        Icons.edit_note,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(profileuser.image!),
                                  backgroundColor: Colors.white,
                                  radius: 100,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  profileuser.name!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30,left: 30,right: 30.0),
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Icon(Icons.phone,color:  Color.fromARGB(255, 128, 128, 128)),SizedBox(width: 15,),
                                  Text(profileuser.phone!)
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Icon(Icons.email,color:  const Color.fromARGB(255, 128, 128, 128)),SizedBox(width: 15,),
                                  Text(profileuser.email!)
                                ],
                              ),
                                SizedBox(height: 30,),
                              Row(
                                children: [
                                  Icon(Icons.point_of_sale,color:  const Color.fromARGB(255, 128, 128, 128)),SizedBox(width: 15,),
                                  Text("${profileuser.points}")
                                ],
                              ),
                                SizedBox(height: 30,),
                              Row(
                                children: [
                                  Icon(Icons.wallet,color:  const Color.fromARGB(255, 128, 128, 128)),SizedBox(width: 15,),
                                  Text("your payments")
                                ],
                              ),
                              SizedBox(height: 30,),
                               Row(
                                children: [
                                  Icon(Icons.settings,color:  const Color.fromARGB(255, 128, 128, 128)),SizedBox(width: 15,),
                                  Text("settings")
                                ],
                              ),
                              SizedBox(height: 30,),
                               Row(
                                children: [
                                  IconButton(icon: Icon(Icons.logout,color:  const Color.fromARGB(255, 128, 128, 128)), onPressed: () { 
                                    AuthCubit.get(context).logout(context);
                                    
                                   },),SizedBox(width: 15,),
                                  Text("Logout")
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: primarycolor,
                  )),
          );
        },
      ),
    );
  }
}
