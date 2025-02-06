import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';

void main() {
  group('DashboardTitle Widget Test', () {
    testWidgets('Displays the title text correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DashboardTitle(title: 'Dashboard'),
          ),
        ),
      );
      expect(find.text('Dashboard'), findsOneWidget);
    });

    testWidgets('Displays the option text when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DashboardTitle(title: 'Dashboard', option: 'Option 1'),
          ),
        ),
      );
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Option 1'), findsOneWidget);
      final optionText = tester.widget<Text>(find.text('Option 1'));
      expect(optionText.style!.color, AppColors.silver);
    });

    testWidgets('Does not display the option text when not provided',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DashboardTitle(title: 'Dashboard'),
          ),
        ),
      );
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Option 1'), findsNothing);
    });
  });
}
