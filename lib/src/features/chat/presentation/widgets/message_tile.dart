import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
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
        conversation.members.firstWhere((member) => member != user.uid);
    final lastMessage = conversation.messages?.isNotEmpty == true
        ? conversation.messages!.last
        : null;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.chatRoom,
        );
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
                  CircleImageAvatar(
                    imageUrl: recipient.profileImage != null &&
                            recipient.profileImage!.isNotEmpty
                        ? recipient.profileImage
                        : '',
                    radius: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    recipient.fullname,
                    style: _textTheme.titleSmall!.copyWith(
                      fontWeight: FontThickness.medium,
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    extractTime(lastMessage!.sent),
                    style: _textTheme.bodySmall,
                  )
                ],
              ),
              const SizedBox(height: 2),
              Text(
                lastMessage.content,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontThickness.light,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
