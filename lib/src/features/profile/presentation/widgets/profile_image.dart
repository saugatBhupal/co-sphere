import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImage extends StatelessWidget {
  final String? profileImage;
  const ProfileImage({super.key, this.profileImage});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        String? image = state is UpdateProfileImageSuccess
            ? state.profileImage
            : profileImage;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: AppColors.midnight,
              height: context.height / 6,
              width: context.width,
              // child: Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 16, left: 16),
              //     child: IconButton(
              //       icon: const Icon(Icons.arrow_back, color: Colors.white),
              //       onPressed: () => Navigator.pop(context),
              //     ),
              //   ),
              // ),
            ),
            Positioned(
              bottom: -50,
              left: context.width / 2 - 48,
              child: CircleImageAvatar(
                radius: context.isTablet ? 54 : 48,
                imageUrl: image ?? '',
              ),
            ),
          ],
        );
      },
    );
  }
}
