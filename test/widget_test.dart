import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecosmart/main.dart';

void main() {
  testWidgets('shows the new EcoSmart dashboard sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('EcoSmart'), findsOneWidget);
    expect(find.text('Home / Dashboard'), findsOneWidget);
    expect(find.text('Layanan Daur Ulang'), findsOneWidget);
    expect(find.text('Tukar Poin (Rewards)'), findsOneWidget);
    expect(find.text('Misi hari ini'), findsOneWidget);
    expect(find.text('Skor Eco Kamu'), findsOneWidget);
    expect(find.text('Fokus hari ini'), findsOneWidget);
    expect(find.text('Layanan utama'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Quiz'), findsOneWidget);
  });

  testWidgets('opens the waste classification page with the new intro', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Home / Dashboard'));
    await tester.tap(find.text('Home / Dashboard'));
    await tester.pumpAndSettle();

    expect(find.text('Pilih kategori sampah'), findsOneWidget);
  });

  testWidgets('toggles dark mode from the home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.light_mode));
    await tester.pump();

    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
  });
}
