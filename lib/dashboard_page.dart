import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'calendar_page.dart';
import 'widgets/home_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 1; // Start with Calendar as per request/design focus

  final List<Widget> _views = [
    const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: _HomeAppBar(),
      ),
      body: HomeView(),
    ),
    const CalendarPage(),
    const Scaffold(
      body: Center(child: Text('统计 (敬请期待)')),
    ),
    const Scaffold(
      body: Center(child: Text('设置 (敬请期待)')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: isDark ? AppTheme.backgroundDark.withOpacity(0.9) : Colors.white.withOpacity(0.9),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.primary,
          unselectedItemColor: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 26),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, size: 26),
              label: '日历',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, size: 26),
              label: '统计',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 26),
              label: '设置',
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        '烟瘾退散',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
