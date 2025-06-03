import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:speech_summary/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Full App Flow: Start -> Speak -> Stop", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify the start button exists
    expect(find.text('Start 🎙️'), findsOneWidget);

    // Tap the start button
    await tester.tap(find.text('Start 🎙️'));
    await tester.pumpAndSettle();

    // Wait to simulate recording (optional delay)
    await Future.delayed(const Duration(seconds: 2));
    // Tap stop button (if visible)
    if (find.text('Finish & Get Summary').evaluate().isNotEmpty) {
      await tester.tap(find.text('Finish & Get Summary'));
      await tester.pumpAndSettle();
    }

    // Check if summary or failure is displayed
    expect(find.textContaining("Summary"), findsWidgets);
  });
}