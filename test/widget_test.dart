import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smoke_free/main.dart';
import 'package:smoke_free/dashboard_page.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('Dashboard loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    // Verify that the title is present.
    expect(find.text('烟瘾退散'), findsWidgets);

    // Verify that some key widgets are present.
    expect(find.text('今日已抽：5 支'), findsOneWidget);
    expect(find.text('12'), findsOneWidget); // Days
    expect(find.text('08'), findsOneWidget); // Hours
    expect(find.text('45'), findsOneWidget); // Minutes

    // Verify action buttons.
    expect(find.text('记录抽烟'), findsOneWidget);
    expect(find.text('记录买烟'), findsOneWidget);

    // Verify stats.
    expect(find.text('285 支'), findsOneWidget);
    expect(find.text('¥142.50'), findsOneWidget);
  });
}
