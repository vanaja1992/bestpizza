import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/features/profile/cubit/profile_cubit.dart';
import 'package:favorite_pizza/src/features/profile/cubit/profile_repository.dart';
import 'package:favorite_pizza/src/model/authentication/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_text_theme.dart';
import 'profile_data_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepository())..loadProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileInitial || state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProfileFailure) {
            return  const Text(AppStrings.profileErrorMessage);
          } else if (state is ProfileSuccess) {
           UserModel userData = state.profileUserModel;
           return
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const CircleAvatar(
                   radius: 60,
                   backgroundImage: NetworkImage(
                       "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                 ),
                 SizedBox(
                   width:10,
                 ),
                 Align(
                   alignment: Alignment.center,
                   child: Text(
                     userData.name ?? " ",
                     style: AppTextTheme.heading2Style,
                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Text(
                   userData.email ?? "",
                   style: AppTextTheme.heading2Style,
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Text(
                   userData.phoneNumber ?? " ",
                   style: AppTextTheme.heading2Style,
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Text(
                   userData.address ?? " ",
                   style: AppTextTheme.heading2Style,
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Text(
                   userData.walletAmount.toString(),
                   style: AppTextTheme.heading2Style,
                 ),
               ],
             );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
