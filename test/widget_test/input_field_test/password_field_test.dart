import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InputField widget test', (WidgetTester tester) async {
    final textController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            textController: textController,
            label: 'Username',
            icon: AppImages.appLogo,
            hintText: 'Enter your username',
          ),
        ),
      ),
    );
    expect(find.byType(InputField), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Enter your username'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'john_doe');
    expect(textController.text, 'john_doe');
    await tester.enterText(find.byType(TextFormField), '');
    await tester.pump();
    expect(find.text('Please enter a valid username'), findsNothing);
  });
}
