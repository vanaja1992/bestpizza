import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/features/authentication/cubit/authentication_cubit.dart';
import 'package:favorite_pizza/src/features/authentication/cubit/authentication_repository.dart';
import 'package:favorite_pizza/src/features/authentication/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authentication/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => AuthenticationCubit(AuthenticationRepository()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: ThemeData(
              primaryColor: Colors.redAccent
          ),
          home: const LoginPage(),

        ),
      );

  }
}
