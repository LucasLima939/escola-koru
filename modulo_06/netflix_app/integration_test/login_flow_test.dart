import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:netflix_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('First Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final finder = find.byKey(const Key('increment-button'));
    await tester.tap(finder);
    
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('1'), findsOneWidget);
  });
}
