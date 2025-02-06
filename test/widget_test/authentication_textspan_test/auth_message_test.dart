import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/auth_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders AuthMessage with correct title and subtitle',
      (WidgetTester tester) async {
    const String testTitle = AppStrings.interestTitle;
    const String testSubtitle = AppStrings.interstSubtitle;
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AuthMessage(title: testTitle, subtitle: testSubtitle),
        ),
      ),
    );
    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testSubtitle), findsOneWidget);
  });

  testWidgets('AuthMessage is structured correctly',
      (WidgetTester tester) async {
    // Build widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AuthMessage(
              title: AppStrings.interestTitle,
              subtitle: AppStrings.interstSubtitle),
        ),
      ),
    );
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(SizedBox), findsOneWidget);
  });
}
