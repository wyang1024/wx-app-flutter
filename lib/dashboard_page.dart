import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/daily_stats_capsule.dart';
import 'widgets/impulse_buffer_card.dart';
import 'widgets/consumption_module.dart';
import 'widgets/relapse_care_module.dart';
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                const DashboardHeader(hours: 12, minutes: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const DailyStatsCapsule(todayCount: 5, difference: 2),
                      const SizedBox(height: 20),
                      const ImpulseBufferCard(),
                      const SizedBox(height: 20),
                      ConsumptionModule(
                        amount: 850,
                        onRecord: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RecordBuyingPage()),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      RelapseCareModule(onRestart: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNavigation(isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: const Border(
          top: BorderSide(color: Color(0xFFF1F5F9)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, Icons.home, '首页', isDark),
          _buildNavItem(1, Icons.military_tech, '成就', isDark),
          _buildNavItem(2, Icons.forum, '社区', isDark),
          _buildNavItem(3, Icons.settings, '设置', isDark),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, bool isDark) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? AppTheme.brandBlue : const Color(0xFF94A3B8);

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
            fill: isSelected ? 1.0 : 0.0,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
