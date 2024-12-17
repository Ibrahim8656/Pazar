import 'package:flutter_application_4/data/models/loginmodel.dart';
import 'package:flutter_application_4/data/models/userRegister_model.dart';

class AuthStates {}
class intialstate extends AuthStates{}
class Registerloadigstate extends AuthStates{}
class Loginloadigstate extends AuthStates{}
class RegistersuccessState extends AuthStates{
    final  Registermodel Response; //you will do validiation of register on status
    RegistersuccessState(this.Response);
}
class RegisterwthierrorState extends AuthStates{
    final  Registermodel Response; //you will do validiation of register on status
    RegisterwthierrorState(this.Response);
}
class RegisterErrorState extends AuthStates{
  
    final Error; //you will do validiation of register on status
    RegisterErrorState(this.Error);
}
class LoginsuccessState extends AuthStates{
    final  Loginmodel Response; //you will do validiation of register on status
    LoginsuccessState(this.Response);
}
class LoginwthierrorState extends AuthStates{
    final  Loginmodel Response; //you will do validiation of register on status
    LoginwthierrorState(this.Response);
}
class LoginerErrorState extends AuthStates{
  
    final Error; //you will do validiation of register on status
    LoginerErrorState(this.Error);
}