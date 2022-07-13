import 'package:favorite_pizza/src/core/common_widgets/app_button.dart';
import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/core/helpers/form_validation_helper.dart';
import 'package:favorite_pizza/src/core/theme/input_decoration_theme.dart';
import 'package:favorite_pizza/src/features/authentication/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecorationThemes.formInputDecoration.copyWith(
                    labelText: AppStrings.username
                ),
                validator: (val) {
                  return FormValidationHelper.validateUsername(val);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecorationThemes.formInputDecoration.copyWith(
                    labelText: AppStrings.password_
                ),
                obscureText: true,
                validator: (val) {
                  return FormValidationHelper.validatePassword(val);
                },
              ),
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (_, state) {
                  if(state is AuthenticationSuccess){
                    //TODO navigate to another page
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> const HomePage()));
                  }
                  else if( state is AuthenticationFailure){
                    //TODO show error message

                  }
                  else{

                  }
                  // TODO: implement listener
                },
                builder: (_, state) {
                  if(state is AuthenticationLoading){
                    return const CircularProgressIndicator();
                  }else{
                    return AppButton(title: AppStrings.login, onTap: () {
                      context.read<AuthenticationCubit>().login(
                          usernameController.text.toString(),
                          passwordController.text.toString());


                    });
                  }

                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}
