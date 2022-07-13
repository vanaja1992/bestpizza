import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/core/storage/storage_keys.dart';
import 'package:favorite_pizza/src/core/storage/storage_service.dart';
import 'package:favorite_pizza/src/features/authentication/cubit/authentication_repository.dart';
import 'package:favorite_pizza/src/model/authentication/user_model.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationRepository authenticationRepository;
  AuthenticationCubit(this.authenticationRepository)
      : super(AuthenticationInitial());

  login(String username, String password) async {
    emit(AuthenticationLoading());
    List<UserModel> userModelList = await authenticationRepository.login();
    bool isValidUser = userModelList
        .any((user) => user.username == username && user.password == password);
    if (isValidUser) {
      UserModel userModel = userModelList.firstWhere(
          (user) => user.username == username && user.password == password);
      await StorageService.writeData(
          StorageKeys.userData.name, jsonEncode(userModel.toJson()));
      emit(AuthenticationSuccess());
    } else {
      emit(const AuthenticationFailure(AppStrings.errorMessage));
    }
  }
}
