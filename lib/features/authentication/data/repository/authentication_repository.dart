import 'package:flutter_application_4/features/authentication/data/models/loginmodel.dart';
import 'package:flutter_application_4/features/authentication/data/models/userRegister_model.dart';
import 'package:flutter_application_4/features/authentication/data/webservices/authentication/authetication_webservices.dart';

class AuthenticationRepository {
  final AutheticationWebservices autheticationWebservices;
  AuthenticationRepository(this.autheticationWebservices);

  Future<Registermodel>Register(name,phone,email,password)async{
    final userdata= await autheticationWebservices.Register(name: name, phone: phone, email: email, password: password);
    Registermodel registermodel= Registermodel.fromJson(userdata);
    return registermodel;
  }
  Future <Loginmodel>Login({required email,required password})async{
    final userlogin=await autheticationWebservices.Login(email: email, password: password);
    Loginmodel loginmodel=Loginmodel.fromJson(userlogin);
    return loginmodel;
  }

}