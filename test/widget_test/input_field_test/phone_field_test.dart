import 'package:cosphere/src/core/widgets/input_fields/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PhoneField widget test', (WidgetTester tester) async {
    final phoneController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PhoneField(
            phoneController: phoneController,
            label: 'Phone',
          ),
        ),
      ),
    );
    expect(find.byType(PhoneField), findsOneWidget);
    expect(find.text('Phone'), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), '1234567890');
    expect(phoneController.text, '1234567890');
    expect(phoneController.text.length, 10);
  });
}
