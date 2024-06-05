import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix_app/main.dart';

void main() {
  Widget makeSut() => const MaterialApp(home: MyHomePage()); // Inicializar a página

  testWidgets('Should increment counter to 1', (tester) async {
    await tester.pumpWidget(makeSut());

    expect(find.text('0'), findsOneWidget);

    final button = find.byKey(const Key('increment-button'));

    await tester.tap(button);

    await tester.pump(); // Pular um frame

    expect(find.text('1'), findsOneWidget);
  });
}
