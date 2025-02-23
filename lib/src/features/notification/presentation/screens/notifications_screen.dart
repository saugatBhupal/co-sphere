import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_tile.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_card.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_content.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_functions.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppbar(title: AppStrings.notifications),
      body: Column(
        children: [
          NotificationCard(),
          NotificationCard(
              // content: MessageTile(
              //   unread: true,
              //   user: User.initial(),
              //   conversation: Conversation.initial(),
              // ),
              ),
          NotificationCard(
            content: NotificationContent(
                message:
                    "He is a great guy did all the tasks i provided to him on time"),
          ),
          Spacer(),
          NotificationFunctions(),
        ],
      ),
    );
  }
}
