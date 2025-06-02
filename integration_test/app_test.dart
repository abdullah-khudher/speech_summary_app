import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:speech_summary/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Fake summary flow works correctly', (WidgetTester tester) async {
    // Launch the app
    app.main();
    await tester.pumpAndSettle();

    // Tap the fake summary button
    final fakeButton = find.text('Test Fake Summary');
    expect(fakeButton, findsOneWidget);

    await tester.tap(fakeButton);
    await tester.pumpAndSettle();

    // Verify original text is shown
    expect(find.textContaining('In recent years'), findsOneWidget);

    // Verify the summary is shown
    expect(find.textContaining('Global interest in renewable energy'), findsOneWidget);
  });
}