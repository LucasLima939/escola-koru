import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix_app/login_mvc/login_view.dart';

void main() {
  final email = faker.internet.email();
  const password = 'password';
  late int counter;

  void incrementCounter() {
    counter++;
  }

  Widget makeSut() => MaterialApp(home: LoginView(onLogin: incrementCounter));

  setUp(() {
    counter = 0;
  });

  testWidgets('Verify all components', (tester) async {
    // Teste de Validação de componentes (ambiente)
    await tester.pumpWidget(makeSut());

    expect(find.byKey(const Key('login-button')), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });
  testWidgets('Should tap button correctly when with email & password',
      (tester) async {
    // Validar a funcionalidade (sucesso)
    await tester.pumpWidget(makeSut());

    await fillLoginFormAndSubmit(tester, email, password);

    await tester.pump();

    expect(counter, 1);

    
  });

  testWidgets('Should exhibit a error dialog when the email is wrong',
      (tester) async {
    await tester.pumpWidget(makeSut());

    await fillLoginFormAndSubmit(tester, 'email inválido', '');

    await tester.pumpAndSettle(); // Pular frames até completar a ação

    expect(find.byKey(const Key('error-dialog')), findsOneWidget);
  });
}

Future<void> fillLoginFormAndSubmit(tester, String email, String password) async {
  final finder = find.byType(TextFormField);

    await tester.enterText(finder.first, email);
    await tester.enterText(finder.last, password);

    await tester.pump();

    final button = find.byKey(const Key('login-button'));

    await tester.tap(button);
}
