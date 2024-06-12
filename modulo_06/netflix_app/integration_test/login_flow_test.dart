import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:netflix_app/main.dart' as app;
// flutter drive --driver=integration_test/app_drive.dart --target=integration_test/login_flow_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Should increment counter', (tester) async {
    await tester.pumpWidget(const app.MyApp());

    await tester.pump();

    expect(find.text('0'), findsOneWidget);

    await Future.delayed(const Duration(seconds: 5));

    final button = find.byKey(const Key('increment-button'));

    await tester.tap(button);

    await tester.pump();

    await Future.delayed(const Duration(seconds: 5));

    expect(find.text('1'), findsOneWidget);
  });
}
