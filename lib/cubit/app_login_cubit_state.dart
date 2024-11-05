
abstract class ApploginStates {}

class AppInitialState extends ApploginStates {}

class AppLoadingState extends ApploginStates {}

class LoginSccessState extends ApploginStates {
  //final List<Productmodel> productss;

  //AppSuccessState(this.productss);
}

class LoginEroorState extends ApploginStates {
  final String error;

  LoginEroorState(this.error);
}

class AppLoadRegisterState extends ApploginStates {}

class RegisterSccessState extends ApploginStates {
  //final List<Productmodel> productss;

  //AppSuccessState(this.productss);
}

class RegisterEroorState extends ApploginStates {
  final String error;

  RegisterEroorState(this.error);
}
