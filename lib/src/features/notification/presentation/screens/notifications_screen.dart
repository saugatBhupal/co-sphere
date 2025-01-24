import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/chat/presentation/widgets/message_tile.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_card.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_content.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CommonAppbar(title: AppStrings.notifications),
      body: Column(
        children: [
          const NotificationCard(),
          const NotificationCard(
            content: MessageTile(unread: true),
          ),
          const NotificationCard(
            content: NotificationContent(
                message:
                    "He is a great guy did all the tasks i provided to him on time"),
          ),
          const Spacer(),
          NotificationFunctions(),
        ],
      ),
    );
  }
}
