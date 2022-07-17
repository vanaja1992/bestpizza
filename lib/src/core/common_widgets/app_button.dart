import 'package:favorite_pizza/src/core/constants/app_colors.dart';
import 'package:favorite_pizza/src/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Function onTap;
  const AppButton(
      {Key? key,
      required this.title,
      this.buttonColor = AppColors.buttonColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()=>onTap(), child: Text(title,
    style: AppTextTheme.buttonTextStyle,)
    );

  }
}
