part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  final UserModel profileUserModel;
  const ProfileSuccess(this.profileUserModel);
  @override
  List<Object> get props => [profileUserModel];
}

class ProfileFailure extends ProfileState {
  final String errorMessage;
  const ProfileFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
