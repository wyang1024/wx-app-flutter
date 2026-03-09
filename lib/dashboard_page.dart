import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'widgets/status_badge.dart';
import 'widgets/timer_display.dart';
import 'widgets/health_progress_ring.dart';
import 'widgets/action_buttons.dart';
import 'widgets/stat_card.dart';
import 'widgets/alert_card.dart';
import 'record_buying_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '烟瘾退散',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          children: [
            const StatusBadge(count: 5),
            const SizedBox(height: 24),
            const TimerDisplay(days: 12, hours: 8, minutes: 45),
            const SizedBox(height: 24),
            const HealthProgressRing(progress: 0.85, healthPercentage: 85),
            const SizedBox(height: 24),
            ActionButtons(
              onRecordSmoking: () {},
              onRecordBuying: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecordBuyingPage()),
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    label: '本月已抽',
                    value: '285 支',
                    icon: Icons.smoking_rooms,
                    iconColor: isDark ? const Color(0xFFFDBA74) : const Color(0xFFEA580C),
                    iconBackgroundColor: isDark ? const Color(0xFF7C2D12).withOpacity(0.4) : const Color(0xFFFFEDD5),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    label: '本月账单',
                    value: '¥142.50',
                    icon: Icons.currency_yuan,
                    iconColor: isDark ? const Color(0xFF4ADE80) : const Color(0xFF16A34A),
                    iconBackgroundColor: isDark ? const Color(0xFF064E3B).withOpacity(0.4) : const Color(0xFFDCFCE7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const AlertCard(missedMinutes: 15),
          ],
        ),
      ),
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
          backgroundColor: isDark ? AppTheme.backgroundDark.withOpacity(0.9) : AppTheme.backgroundLight.withOpacity(0.9),
          elevation: 0,
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
              icon: Icon(Icons.bar_chart, size: 26),
              label: '统计',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 26),
              label: '我的',
            ),
          ],
        ),
      ),
    );
  }
}
