class AppStrings{
  ///1.Core
  ///2.Login Page
  ///3.Global
  ///3.Validation
  ///4.Regex email
  ///4.Dashboard
  ///5.Pizza


  //1. Core
  static const String appTitle = "Best Pizza";

  //2.Login Page
  static const String login ="Login";
  static const String helloTitle = "Hello";
  static const String signTitle = "Sign into your account";
  static const String username = "Username";
  static const String password_ = "Password";
  static const String forgotPassword = "Forgot Password?";
  static const String loginButton = "Login";
  static const String newlogintext = "Don't have an account?";
  static const String registerNow = "Register Now";
  static const String errorMessage = "Invalid username or password";
  static const String loading = "Loading";

  //Global
  static const String home = "Home";
  static const String orders = "Orders";
  static const String profile = "Profile";

  // Validation
  static const String emailEmptyErrorMessage = "Please enter email";
  static const String emailValidErrorMessage = "Please enter a valid email address";
  static const String emailIncorrectErrorMessage = "Invalid email address";
  static const String passwordEmptyErrorMessage = "Please enter password";
  static const String passwordValidErrorMessage = "Please enter a valid password";
  static const String passwordIncorrectErrorMessage = "Invalid password";
  static const String userdEmptyErrorMessage = "Please enter username";
  static const String userIncorrectErrorMessage = "Invalid username";

  //Regex Email
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  //Pizza
  // Pizza Repository
  static const String pizzaErrorMessage = "Unable to fetch the pizza detials";
  // Pizza Data Viewing
  static const String pizzaErrorViewMessage = "No Details available!!!";

}