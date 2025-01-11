import 'package:SHOPPING/core/models/profilemodel.dart';
import 'package:SHOPPING/features/profile/data/profilecallserver/profilecallserver.dart';

class Profilerepository {
  final Profilecallserver profilecallserver;

  Profilerepository(this.profilecallserver);
  
   Future <ProfileModel>GetProfile()async{
    final profile=await profilecallserver.GetProfile();
    ProfileModel profileModel=ProfileModel.fromJson(profile);
    return profileModel;

   }
}