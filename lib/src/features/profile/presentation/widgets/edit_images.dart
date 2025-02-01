import 'dart:io';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_permissions.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/functions/open_gallery.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/buttons/light_rounded_button.dart';
import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditImages extends StatefulWidget {
  final User user;
  const EditImages({super.key, required this.user});

  @override
  _EditImagesState createState() => _EditImagesState();
}

class _EditImagesState extends State<EditImages> {
  File? _media;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UpdatingProfileImage) {
          buildToast(
            toastType: ToastType.success,
            msg: "Uploading Profile Image...",
          );
        }
        if (state is UpdateProfileImageSuccess) {
          buildToast(
            toastType: ToastType.success,
            msg: "Profile Picture Updated",
          );
          Navigator.of(context).pop();
        }
        if (state is UpdateProfileImageFailed) {
          buildToast(
            toastType: ToastType.error,
            msg: state.message,
          );
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(width: 0.6, color: AppColors.plaster),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: context.height / 10,
                    width: context.width,
                    decoration: const BoxDecoration(
                      color: AppColors.midnight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -32,
                    left: 20,
                    child: CircleImageAvatar(
                        radius: 34,
                        imageUrl: _media?.path ??
                            widget.user.profileImage ??
                            AppImages.profile),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34.0, bottom: 18, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AppStrings.your} ${AppStrings.photo}",
                      style: _textTheme.titleSmall!.copyWith(
                        fontWeight: FontThickness.medium,
                        color: AppColors.grey,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      AppStrings.photoDisplay,
                      style: _textTheme.bodySmall!.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontThickness.regular,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.width / 3.8,
                          child: LightRoundedButton(
                            title: AppStrings.upload,
                            fontSize: 13,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            onPressed: () async {
                              await AppPermissions.checkCameraPermission();
                              _media = await openGallery();
                              if (_media != null) {
                                setState(() {
                                  _media = _media;
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: context.width / 5.8,
                          child: DarkRoundedButton(
                            title: AppStrings.save,
                            fontSize: 13,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 6),
                            onPressed: () {
                              if (_media == null) {
                                buildToast(
                                  toastType: ToastType.error,
                                  msg: "Please select an image to upload.",
                                );
                                return;
                              }
                              print(_media!.path);
                              context.read<ProfileBloc>().add(
                                    UpdateProfileImage(
                                      dto: UpdateProfileImgageReqDto(
                                        email: widget.user.email,
                                        media: _media!,
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
