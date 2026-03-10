import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
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

    // Verify that some key widgets are present.
    expect(find.text('距离上次吸烟已过去'), findsOneWidget);
    expect(find.textContaining('12', findRichText: true), findsOneWidget);
    expect(find.textContaining('45', findRichText: true), findsOneWidget);
    expect(find.text('累计戒烟时长 | 身体持续修复中'), findsOneWidget);

    expect(find.textContaining('今日已抽：5 支', findRichText: true), findsOneWidget);

    expect(find.text('冲动缓冲冷静期'), findsOneWidget);
    expect(find.textContaining('启动 15 分钟 冷静期', findRichText: true), findsOneWidget);

    expect(find.text('本月烧掉的钱'), findsOneWidget);
    expect(find.text('¥850'), findsOneWidget);

    expect(find.text('我刚抽了一根，帮我重启'), findsOneWidget);
  });
}
