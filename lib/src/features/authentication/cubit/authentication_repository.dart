import 'dart:convert';

import 'package:favorite_pizza/src/core/assets/app_assets.dart';
import 'package:favorite_pizza/src/core/helpers/file_helper.dart';
import 'package:favorite_pizza/src/model/authentication/user_model.dart';

class AuthenticationRepository{

  Future<List<UserModel>>login() async {
    String userJsonData = await FileHelper.readFile(AppAssets.userDataJsonPath);
    List<dynamic> decodedJsonData = jsonDecode(userJsonData);
    List<UserModel> userModelList = decodedJsonData.map((userData) => UserModel.fromJson(userData)).toList();
    return userModelList;
  }
}