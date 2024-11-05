import 'package:dio/dio.dart';
import 'package:flutter_application_4/Ui/authentcation/Register.dart';

import 'package:flutter_application_4/cubit/app_login_cubit_state.dart';
import 'package:flutter_application_4/model/usermodel.dart';
import 'package:flutter_application_4/sheared/Diohelper.dart';
import 'package:flutter_application_4/sheared/ShearedPrefrences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginCubit extends Cubit<ApploginStates> {
  AppLoginCubit() : super(AppInitialState());
  static UserModel? userModel;
  static RegisterModel? registerModel;


  static AppLoginCubit get(context) => BlocProvider.of(context);
  static bool LoginStatus = false;
  String? massge;
  Login({required String Email, required String password}) {
    print(Email);
    emit(AppLoadingState());
    Diohelper.Postdata(
        url: 'login',
        data: {'email': Email, 'password': password}).then((value) {
      userModel = UserModel.fromJson(value.data);
      massge = userModel!.message;
      LoginStatus = value.data['status'];
      emit(LoginSccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginEroorState(onError));
    });
  }

  static bool Registerstatus = false;
  Register({
    required name,
    required phone,
    required email,
    required password,
    required image,
  }) async {
    emit(AppLoadRegisterState());
    Diohelper.Postdata(
        url: 'register',
        data: FormData.fromMap({
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "image": await MultipartFile.fromFile(imageFile!.path,
              filename: 'image.jpg'),
        })).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(value.data['status']);
      Registerstatus = value.data['status'];
      emit(RegisterSccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterEroorState(error.toString()));
    });
  }
}
