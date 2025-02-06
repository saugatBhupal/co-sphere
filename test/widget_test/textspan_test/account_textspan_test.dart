import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/account_textspan.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders AccountTextspan with correct text',
      (WidgetTester tester) async {
    const String infoText = "Don't have an account? ";
    const String functionText = "Sign Up";

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AccountTextspan(
            infoText: infoText,
            functionText: functionText,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains(infoText) &&
            widget.text.toPlainText().contains(functionText),
      ),
      findsOneWidget,
    );
  });

  testWidgets('tapping functionText triggers onPressed',
      (WidgetTester tester) async {
    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AccountTextspan(
            infoText: "Already have an account? ",
            functionText: "Login",
            onPressed: () {
              wasTapped = true;
            },
          ),
        ),
      ),
    );
    final richTextWidget = tester.widget<RichText>(find.byType(RichText));
    final textSpan = richTextWidget.text as TextSpan;
    final tappableSpan = textSpan.children!.firstWhere(
      (span) => span is TextSpan && span.text == "Login",
    ) as TextSpan;
    (tappableSpan.recognizer as TapGestureRecognizer).onTap!();
    await tester.pumpAndSettle();
    expect(wasTapped, isTrue);
  });
}
