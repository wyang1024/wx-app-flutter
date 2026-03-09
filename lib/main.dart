import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'dashboard_page.dart';
import 'record_buying_page.dart';

void main() {
  runApp(const SmokeFreeApp());
}

class SmokeFreeApp extends StatelessWidget {
  const SmokeFreeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '烟瘾退散',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const DashboardPage(),
    );
  }
}
