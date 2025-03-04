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

class StartChatButton extends StatelessWidget {
  final User user;
  final User searchUser;
  const StartChatButton(
      {super.key, required this.user, required this.searchUser});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is GetConversationFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is GetConversationSuccess) {
          Navigator.of(context).pushNamed(AppRoutes.chatRoom,
              arguments: ChatScreensArgs(
                conversationID: state.conversation.id,
                user: user,
                receipient: searchUser,
              ));
        }
      },
      child: GestureDetector(
        onTap: () => context
            .read<ChatBloc>()
            .add(GetConversation(members: [user.uid, searchUser.uid])),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.chat,
                height: context.isTablet ? 28 : 16,
                width: context.isTablet ? 28 : 18,
                colorFilter:
                    const ColorFilter.mode(AppColors.frog, BlendMode.srcIn),
              ),
              const SizedBox(width: 4),
              Text(
                AppStrings.start,
                style: _textTheme.labelSmall!.copyWith(
                  fontWeight: FontThickness.semiBold,
                  fontSize: context.isTablet ? 14 : 10,
                  color: AppColors.frog,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
