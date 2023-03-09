import 'package:coresolutions/pages/login/bloc/login_bloc.dart';
import 'package:coresolutions/pages/login/login_page.dart';
import 'package:coresolutions/repository/repository.dart';
import 'package:coresolutions/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_test/bloc_test.dart';

class MockNavigatorObserver extends MockBloc implements NavigatorObserver {}

void main() {
  Repository repo = Repository();
  LoginBloc bloc = LoginBloc(repo);
  MockNavigatorObserver mockObserver = MockNavigatorObserver();

  testWidgets("login failed", (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<LoginBloc>(
        create: (_) => bloc,
        child: MaterialApp(
          navigatorObservers: [mockObserver],
          routes: AppRoutes.routesArray,
          home: LoginPage(),
        ),
      ),
    );

    final emailInput = find.byKey(const ValueKey("emailInput"));
    final passWordInput = find.byKey(const ValueKey("passwordInput"));
    final continueBtn = find.byKey(const ValueKey("continueBtn"));

    await tester.enterText(emailInput, "andreslowenstein@gmail.com");
    expect(find.text("andreslowenstein@gmail.com"), findsOneWidget);
    await tester.enterText(passWordInput, "Andres.123");
    expect(find.text("Andres.123"), findsOneWidget);

    await tester.tap(continueBtn);
    await tester.pump();

    // expect(find.byKey(ValueKey("Appbar")), findsOneWidget);
  });
}
