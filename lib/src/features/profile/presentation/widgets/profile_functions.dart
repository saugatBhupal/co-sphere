import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/chat/presentation/viewmodel/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfileFunctions extends StatelessWidget {
  final User user;
  final User loggedUser;
  const ProfileFunctions(
      {super.key, required this.user, required this.loggedUser});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is GetConversationFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is GetConversationSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.chatRoom, (route) => false,
                  arguments: ChatScreensArgs(
                    conversationID: state.conversation.id,
                    user: user,
                    receipient: loggedUser,
                  ));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.web,
                height: context.isTablet ? 26 : null,
              ),
              Text(
                AppStrings.links,
                style: _textTheme.labelLarge!.copyWith(
                    fontWeight: FontThickness.medium,
                    height: 1.8,
                    color: AppColors.grey,
                    fontSize: context.isTablet ? 14 : 10),
              ),
            ],
          ),
          const SizedBox(width: 26),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.like,
                height: context.isTablet ? 32 : null,
              ),
              Text(
                "121",
                style: _textTheme.labelLarge!.copyWith(
                  fontWeight: FontThickness.medium,
                  height: 1.8,
                  color: AppColors.grey,
                  fontSize: context.isTablet ? 14 : 10,
                ),
              ),
            ],
          ),
          const SizedBox(width: 26),
          GestureDetector(
            onTap: () {
              if (loggedUser.uid == user.uid) {
                Navigator.of(context)
                    .pushNamed(AppRoutes.chatLogs, arguments: user);
              } else {
                context
                    .read<ChatBloc>()
                    .add(GetConversation(members: [user.uid, loggedUser.uid]));
              }
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  AppIcons.chat,
                  height: context.isTablet ? 32 : null,
                  colorFilter: const ColorFilter.mode(
                      AppColors.midnight, BlendMode.srcIn),
                ),
                Text(
                  AppStrings.chat,
                  style: _textTheme.labelLarge!.copyWith(
                    fontWeight: FontThickness.medium,
                    height: 1.8,
                    color: AppColors.grey,
                    fontSize: context.isTablet ? 14 : 10,
                  ),
                ),
              ],
            ),
          ),
          if (loggedUser.uid == user.uid) ...[
            const SizedBox(width: 26),
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(AppRoutes.editProfile, arguments: user),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.editUser,
                    height: context.isTablet ? 32 : 26,
                  ),
                  Text(
                    "Edit",
                    style: _textTheme.labelLarge!.copyWith(
                      fontWeight: FontThickness.medium,
                      height: 1.8,
                      color: AppColors.grey,
                      fontSize: context.isTablet ? 14 : 10,
                    ),
                  ),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
