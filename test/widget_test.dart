import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smoke_free/dashboard_page.dart';
import 'package:smoke_free/calendar_page.dart';
import 'package:smoke_free/widgets/home_view.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('Dashboard navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    // Default view is CalendarPage (index 1)
    expect(find.text('2024年3月'), findsOneWidget);
    expect(find.byType(CalendarPage), findsOneWidget);

    // Switch to HomeView (index 0)
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump(); // Use pump instead of pumpAndSettle due to animations

    expect(find.text('烟瘾退散'), findsWidgets);
    expect(find.byType(HomeView), findsOneWidget);

    // Verify HomeView contents
    expect(find.text('今日已抽：5 支'), findsOneWidget);
    expect(find.text('12'), findsOneWidget); // Days
    expect(find.text('08'), findsOneWidget); // Hours
    expect(find.text('45'), findsOneWidget); // Minutes
    expect(find.text('记录抽烟'), findsOneWidget);
    expect(find.text('记录买烟'), findsOneWidget);
  });

  testWidgets('Calendar page displays summary stats', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    expect(find.text('无烟日'), findsOneWidget);
    expect(find.text('5天'), findsWidgets); // One in summary, one in badge if any
    expect(find.text('日均'), findsOneWidget);
    expect(find.text('8.6支'), findsOneWidget);
    expect(find.text('消费'), findsOneWidget);
    expect(find.text('¥620'), findsOneWidget);
  });
}
