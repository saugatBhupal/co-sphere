import 'package:cosphere/src/core/widgets/buttons/light_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LightRoundedButton widget test', (WidgetTester tester) async {
    const buttonKey = Key('lightRoundedButton');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LightRoundedButton(
            key: buttonKey,
            title: 'Test Button',
            onPressed: () {},
          ),
        ),
      ),
    );
    final buttonFinder = find.byKey(buttonKey);

    expect(buttonFinder, findsOneWidget);
    expect(find.text('Test Button'), findsOneWidget);
    await tester.tap(buttonFinder);
    await tester.pump();
  });
}
