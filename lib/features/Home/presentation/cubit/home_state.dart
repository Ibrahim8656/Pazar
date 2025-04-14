part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeDataLoadingState extends HomeState{
}
final class HomeCurrentIndexChangedState extends HomeState{}
final class HomeAppbartitleChangedState extends HomeState{
}
final class HomeDataSuccessState extends HomeState{
  final Homemodel homemodel;
  HomeDataSuccessState({required this.homemodel});
}
class HomeDataErrorState extends HomeState {
  final String? Error; // Ensure it's nullable
  HomeDataErrorState({this.Error});  // Pass null as the default value if no error
}
final class shearshingState extends HomeState{
}
