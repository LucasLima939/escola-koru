import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix_app/login_page.dart';

void main() {
  final email = faker.internet.email();
  const password = 'password';
  late int counter;

  void incrementCounter() {
    counter++;
  }

  Widget makeSut() => MaterialApp(home: LoginPage(onLogin: incrementCounter));

  setUp(() {
    counter = 0;
  });

  testWidgets('Verify all components', (tester) async {
    await tester.pumpWidget(makeSut());

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });
  testWidgets('Should tap button correctly when with email & password', (tester) async {
    await tester.pumpWidget(makeSut());

    final finder = find.byType(TextFormField);

    await tester.enterText(finder.first, email);
    await tester.enterText(finder.last, password);

    await tester.pump();

    final button = find.byKey(const Key('login-button'));

    await tester.tap(button);

    await tester.pump();

    expect(counter, 1);
  });
}
