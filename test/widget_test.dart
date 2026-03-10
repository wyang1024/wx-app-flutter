import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smoke_free/dashboard_page.dart';

void main() {
  testWidgets('Dashboard loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    // Verify that some key widgets are present.
    expect(find.textContaining('12', findRichText: true), findsWidgets);
    expect(find.textContaining('45', findRichText: true), findsWidgets);

    // Verify action buttons or key sections.
    expect(find.textContaining('冷静期'), findsWidgets);
    expect(find.text('记一笔'), findsOneWidget);

    // Verify stats.
    expect(find.textContaining('850'), findsOneWidget);
  });
}
