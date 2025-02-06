import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/appbar/authentication_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'authentication_appbar_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NavigatorObserver>()])
void main() {
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });

  testWidgets('renders AuthenticationAppbar with correct widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AuthenticationAppbar(),
          ),
        ),
      ),
    );
    expect(find.byIcon(Icons.arrow_back_outlined), findsOneWidget);
    expect(find.text(AppStrings.appName), findsOneWidget);
  });

  testWidgets('tapping back button pops the navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(
          body: AuthenticationAppbar(),
        ),
        navigatorObservers: [mockNavigatorObserver],
      ),
    );
    await tester.tap(find.byIcon(Icons.arrow_back_outlined));
    await tester.pumpAndSettle();
    verify(mockNavigatorObserver.didPop(any, any)).called(1);
  });
}
