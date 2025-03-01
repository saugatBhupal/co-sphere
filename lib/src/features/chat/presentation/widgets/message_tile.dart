import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/core/widgets/square_image_builder.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final bool unread;
  final User user;
  final Conversation conversation;
  const MessageTile({
    super.key,
    required this.unread,
    required this.user,
    required this.conversation,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final recipient =
        conversation.members.firstWhere((member) => member.uid != user.uid);
    final lastMessage = (conversation.messages?.isNotEmpty ?? false)
        ? conversation.messages!.last
        : null;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).popAndPushNamed(AppRoutes.chatRoom,
            arguments: ChatScreensArgs(
              conversationID: conversation.id,
              user: user,
              receipient: recipient,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: unread ? AppColors.snow : AppColors.white,
          border: Border(
            bottom: const BorderSide(color: AppColors.plaster, width: 1.5),
            right: unread
                ? const BorderSide(color: AppColors.winter, width: 6)
                : BorderSide.none,
          ),
        ),
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PlaceholderImage(
                    title: recipient.fullname[0],
                    imageUrl: recipient.profileImage,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    recipient.fullname,
                    style: _textTheme.titleSmall!.copyWith(
                      fontWeight: context.isTablet
                          ? FontThickness.regular
                          : FontThickness.medium,
                      color: AppColors.black,
                      fontSize: context.isTablet ? 20 : 16,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    lastMessage != null ? extractTime(lastMessage.sent) : "",
                    style: _textTheme.bodySmall!.copyWith(
                      fontSize: context.isTablet ? 16 : 12,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  if (lastMessage != null && lastMessage.sender.uid == user.uid)
                    SizedBox(
                      width: context.isTablet ? 48 : 36,
                      child: Text(
                        AppStrings.you,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: _textTheme.bodyLarge!.copyWith(
                          fontWeight: FontThickness.medium,
                          color: AppColors.midnight,
                          fontSize: context.isTablet ? 18 : 14,
                        ),
                      ),
                    ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      lastMessage?.content ?? "Start messaging today",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: _textTheme.bodyLarge!.copyWith(
                        fontWeight: FontThickness.light,
                        color: AppColors.grey,
                        fontSize: context.isTablet ? 18 : 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
