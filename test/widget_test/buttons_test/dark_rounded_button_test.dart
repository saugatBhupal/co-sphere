import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('DarkRoundedButton', () {
    testWidgets('shows loading indicator when isLoading is true',
        (WidgetTester tester) async {
      const String buttonText = 'Loading Button';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DarkRoundedButton(
              title: buttonText,
              isLoading: true,
              onPressed: () {},
            ),
          ),
        ),
      );
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.text(buttonText), findsNothing);
    });

    testWidgets('calls onPressed when button is tapped',
        (WidgetTester tester) async {
      const String buttonText = 'Tap Me';
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DarkRoundedButton(
              title: buttonText,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );
      await tester.tap(find.byType(DarkRoundedButton));
      await tester.pump();
      expect(wasPressed, true);
    });

    testWidgets('renders without icon when icon is null',
        (WidgetTester tester) async {
      const String buttonText = 'No Icon Button';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DarkRoundedButton(
              title: buttonText,
              icon: null,
              onPressed: () {},
            ),
          ),
        ),
      );
      expect(find.text(buttonText), findsOneWidget);
      expect(find.byType(Image), findsNothing);
    });
  });
}
