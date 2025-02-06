import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';

void main() {
  group('DashboardAppbar Widget Test', () {
    final user = User.initial().copyWith(
      fullname: 'John Doe',
      profileImage: AppImages.appLogo,
    );

    testWidgets('Displays the user\'s fullname and profile image',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: DashboardAppbar(user: user),
          ),
        ),
      );
      expect(find.text('Hi John Doe,'), findsOneWidget);
      expect(find.text(AppStrings.welcomeBack), findsOneWidget);
      expect(find.byType(CircleImageAvatar), findsOneWidget);
      final circleImageAvatar =
          tester.widget<CircleImageAvatar>(find.byType(CircleImageAvatar));
      expect(circleImageAvatar.imageUrl, user.profileImage);
    });
  });
}
