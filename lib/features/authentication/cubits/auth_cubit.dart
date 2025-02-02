import 'package:SHOPPING/features/authentication/presentation/screens/athentication/Login_screen.dart';
import 'package:SHOPPING/features/authentication/cubits/auth_states.dart';
import 'package:SHOPPING/features/authentication/data/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates>{
  final AuthenticationRepository authenticationRepository;
  AuthCubit(this.authenticationRepository):super(intialstate());
  static AuthCubit get(context) => BlocProvider.of(context);
  Future<void> Register(name,phone,email, password)async{
    emit(Registerloadigstate());
   try{
    final register=await authenticationRepository.Register(name, phone, email, password);
    if(register.status==true){
        emit(RegistersuccessState(register));
    }else if(register.status==false){
      emit(RegisterwthierrorState(register));
    }
   }catch (Error){
    emit(RegisterErrorState(Error));
   }
  }
  Future<void>Login({required email ,required password})async{
    emit(Loginloadigstate());
    try{
    final userlogin=await authenticationRepository.Login(email: email, password: password);
    if(userlogin.status==true){
      emit(LoginsuccessState(userlogin));
    }else if(userlogin.status ==false){
      emit(LoginwthierrorState(userlogin));
    }
    }catch(error){
      emit(LoginerErrorState(Error));
    }
  }
  Future<void> logout(context)async{
    emit(LogoutLoading());
    try{
      final logout=await authenticationRepository.logout();
      if(logout.status==true){
        print(logout.message);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      emit(Logoutsuccsse(logout));
    }else if(logout.status ==false){
      print(logout.message);
      emit(LogoutError(logout));
    }
    } catch(error){
      print(error.toString());
    }   
  }
}