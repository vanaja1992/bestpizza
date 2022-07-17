import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/core/storage/storage_service.dart';
import 'package:favorite_pizza/src/features/profile/cubit/profile_repository.dart';
import 'package:favorite_pizza/src/model/authentication/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit(this.profileRepository) : super(ProfileInitial());

  loadProfile() async {
    emit(ProfileLoading());
    try{
      UserModel? profileData = await ProfileRepository().fetchProfile();
      if(profileData == null){
        StorageService.clearAllData();
        emit(const ProfileFailure(AppStrings.profileErrorMessage));
      }
      emit(ProfileSuccess(profileData!));
    }
    catch(ex){
          emit(const ProfileFailure(AppStrings.profileErrorMessage));
    }
  }
}
