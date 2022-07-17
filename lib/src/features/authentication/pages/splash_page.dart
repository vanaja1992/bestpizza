import 'dart:async';
import 'package:favorite_pizza/src/core/assets/app_assets.dart';
import 'package:favorite_pizza/src/core/constants/app_colors.dart';
import 'package:favorite_pizza/src/core/storage/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences loginData;
  late bool newUser;
  @override
  void initState() {
   checkAutoLogin();
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Align(
            alignment: Alignment.center,
            child:  Image(
              image: AssetImage(AppAssets.splashImage),
              height: 200,
            ),
          ),
    // Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Lottie.asset(AppAssets.loadingAnimation,width: 70,height: 70,fit: BoxFit.fill)),
    ],
    ),
    ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  Future<void> navigateUser() async {

    loginData =  await StorageService.getInstance() ;
    newUser = (loginData.getBool('login') ?? true);
    if (newUser) {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }

  }

  void checkAutoLogin() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // context.read<>A()
    });
  }
}
