import '../constants/app_strings.dart';

class FormValidationHelper {
  ///Regex Email
  ///Validate Email
  ///Validate Password
  ///Validate Username

  // validate email
  static String? validateEmail(String? email) {
     if(email== null){
       return AppStrings.emailEmptyErrorMessage;
     }
     email = email.trim();
    if (email.isEmpty) {
      return AppStrings.emailEmptyErrorMessage;
    } else if (email.length < 8) {
      return AppStrings.emailValidErrorMessage;
    } else if (!AppStrings.emailRegex.hasMatch(email)) {
      return AppStrings.emailIncorrectErrorMessage;
    } else {
      return null;
    }
  }

  // validate password
  static String? validatePassword(String? password) {
    if(password == null){
      return AppStrings.emailEmptyErrorMessage;
    }
    password = password.trim();
     if (password.isEmpty) {
      return AppStrings.passwordEmptyErrorMessage;
    } else if (password.length < 5) {
      return AppStrings.passwordIncorrectErrorMessage;
    } else {
      return null;
    }
  }

  // validate username
  static String? validateUsername(String? username) {
    if(username == null){
      return AppStrings.emailEmptyErrorMessage;
    }
    username = username.trim();
     if (username.isEmpty) {
      return AppStrings.userdEmptyErrorMessage;
    } else if (username.length < 3) {
      return AppStrings.userIncorrectErrorMessage;
    } else {
      return null;
    }
  }
}
