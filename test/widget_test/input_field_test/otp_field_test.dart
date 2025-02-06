import 'package:cosphere/src/core/widgets/input_fields/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('OtpField widget test', (WidgetTester tester) async {
    final controllers = List.generate(6, (_) => TextEditingController());
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OtpField(controllers: controllers),
        ),
      ),
    );
    expect(find.byType(TextFormField), findsNWidgets(6));
    expect(find.byType(OtpField), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).first, '1');
    await tester.pump();
    expect(find.byType(TextFormField).at(1), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(1), '2');
    await tester.pump();
    expect(find.byType(TextFormField).at(2), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), '');
    await tester.pump();
    expect(find.byType(TextFormField).at(0), findsOneWidget);
  });
}
