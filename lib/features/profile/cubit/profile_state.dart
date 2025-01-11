part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class GetprofileLoading extends ProfileState {}
final class GetprofileSuccess extends ProfileState {
  final ProfileModel profileModel;

  GetprofileSuccess(this.profileModel);
}
final class GetprofileError extends ProfileState {}
