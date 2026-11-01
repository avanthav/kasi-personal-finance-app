import 'package:flutter_test/flutter_test.dart';
import 'package:university_app/main.dart';

void main() {
  testWidgets('Kasi app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const KasiApp());

    // Verify Kasi header text exists
    expect(find.text('Kasi'), findsOneWidget);
  });
}
