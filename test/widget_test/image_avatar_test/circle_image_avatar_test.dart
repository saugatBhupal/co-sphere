import 'dart:io';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';

void main() {
  testWidgets('CircleImageAvatar widget test', (WidgetTester tester) async {
    const avatarKey = Key('circleImageAvatar');
    const imageUrl = AppImages.appLogo;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CircleImageAvatar(
            key: avatarKey,
            radius: 40,
            enableNavigate: true,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );

    final avatarFinder = find.byKey(avatarKey);
    expect(avatarFinder, findsOneWidget);
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);
    await tester.tap(avatarFinder);
    await tester.pump();
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CircleImageAvatar(
            key: avatarKey,
            radius: 40,
            enableNavigate: false,
            imageUrl: '',
          ),
        ),
      ),
    );

    final defaultImageFinder = find.byType(ImageBuilder);
    expect(defaultImageFinder, findsOneWidget);
    final inkWellFinder = find.byType(InkWell);
    await tester.tap(inkWellFinder);
    await tester.pump();
    const fileImageUrl = AppImages.carousel1;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CircleImageAvatar(
            key: avatarKey,
            radius: 40,
            enableNavigate: true,
            imageUrl: fileImageUrl,
          ),
        ),
      ),
    );

    // Check if an Image widget is used (which would internally be Image.network or Image.file)
    final fileImageFinder = find.byType(Image);
    expect(fileImageFinder, findsOneWidget);
  });
}
