import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/notification/domain/entities/notification.dart';
import 'package:cosphere/src/features/notification/presentation/viewmodel/notification_bloc.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_card.dart';
import 'package:cosphere/src/features/notification/presentation/widgets/notification_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  final User user;
  const NotificationsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) =>
          sl<NotificationBloc>()..add(GetNotificationsByUserId(uid: user.uid)),
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state is GetNotificationsFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          if (state is DeleteNotificationsSuccess) {
            buildToast(toastType: ToastType.success, msg: state.message);
          }
          if (state is DeleteNotificationsFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is GetNotificationsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<NotificationEntity> notifications =
              context.read<NotificationBloc>().notifications;

          return Scaffold(
            appBar: const CommonAppbar(title: AppStrings.notifications),
            body: notifications.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: notifications.length,
                          itemBuilder: (context, index) => NotificationCard(
                            notification: notifications[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                        ),
                      ),
                      NotificationFunctions(uid: user.uid),
                    ],
                  )
                : Center(
                    child: Text(
                      "No Notification",
                      style: _textTheme.bodyMedium
                          ?.copyWith(color: AppColors.grey),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
