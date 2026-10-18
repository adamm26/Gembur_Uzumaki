// This is a basic Flutter widget test for FootballApp.

import 'package:flutter_test/flutter_test.dart';
import 'package:messiun/main.dart';

void main() {
  testWidgets('FootballApp smoke test', (WidgetTester tester) async {
    // Build aplikasi FootballApp dan trigger frame.
    await tester.pumpWidget(const FootballApp());

    // Memastikan judul '⚽ Bola Info' dan teks 'Jadwal Pertandingan' muncul di layar
    expect(find.text('⚽ Bola Info'), findsOneWidget);
    expect(find.text('Jadwal Pertandingan'), findsOneWidget);
    expect(find.text('Pemain Populer'), findsOneWidget);
  });
}