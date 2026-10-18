// This is a basic Flutter widget test for NovaApp.

import 'package:flutter_test/flutter_test.dart';
import 'package:messiun/main.dart';

void main() {
  testWidgets('NovaApp smoke test', (WidgetTester tester) async {
    // Build aplikasi NovaApp dan trigger frame.
    await tester.pumpWidget(const NovaApp());

    // Memastikan judul 'NOVA' dan ucapan 'Hello, Explorer.' muncul di layar
    expect(find.text('NOVA'), findsOneWidget);
    expect(find.text('Hello, Explorer.'), findsOneWidget);
  });
}