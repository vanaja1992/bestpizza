import 'package:favorite_pizza/src/core/assets/app_assets.dart';
import 'package:favorite_pizza/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      color: AppColors.buttonColor,
       child: Image.asset(AppAssets.splashImage),
    );
  }
}
