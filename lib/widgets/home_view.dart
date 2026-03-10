import 'package:flutter/material.dart';
import '../record_buying_page.dart';
import 'action_buttons.dart';
import 'alert_card.dart';
import 'health_progress_ring.dart';
import 'stat_card.dart';
import 'status_badge.dart';
import 'timer_display.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
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
    );
  }
}
