import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_badge.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_data.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_functions.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_image.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_skills.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_tabbar.dart';

class ProfileScreen extends StatelessWidget {
  final String uid;
  const ProfileScreen({
    super.key,
    required this.uid,
  });
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.midnight,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(GetUserProfileById(uid: uid)),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (context.read<ProfileBloc>().user != User.initial()) {
                  final User user = context.read<ProfileBloc>().user;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileImage(profileImage: user.profileImage ?? ''),
                      const SizedBox(height: 55),
                      ProfileData(
                          name: user.fullname,
                          city: user.city,
                          country: user.country),
                      const ProfileBadge(),
                      const ProfileFunctions(),
                      ProfileSkills(
                          uid: user.uid,
                          skills:
                              (user.skills != null && user.skills!.isNotEmpty)
                                  ? user.skills!
                                  : []),
                      ProfileTabbar(user: user),
                    ],
                  );
                }
                if (state is GetProfileInfoFailed) {
                  buildToast(toastType: ToastType.error, msg: state.message);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context)
        //         .pushNamed(AppRoutes.editProfile, arguments: user);
        //   },
        //   splashColor: AppColors.genie,
        //   shape: const CircleBorder(),
        //   elevation: 2,
        //   backgroundColor: AppColors.plaster,
        //   child: SvgPicture.asset(
        //     AppIcons.editUser,
        //   ),
        // ),
      ),
    );
  }
}
