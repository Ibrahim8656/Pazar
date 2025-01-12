import 'dart:ui';
import 'package:SHOPPING/core/models/profilemodel.dart';
import 'package:SHOPPING/features/profile/data/profileRepository/profileRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Profilerepository profilerepository;
  ProfileCubit(this.profilerepository) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
Data? userdata;
  Future<void> GetProfile() async {
    emit(GetprofileLoading());
    try {
      final profile = await profilerepository.GetProfile();
      userdata=profile.data;
      emit(GetprofileSuccess(profile));
    } catch (error) {
      emit(GetprofileError());
    }
  }
}
