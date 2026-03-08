import 'package:flutter/material.dart';
import '../app_theme.dart';

class TimerDisplay extends StatelessWidget {
  final int days;
  final int hours;
  final int minutes;

  const TimerDisplay({
    super.key,
    required this.days,
    required this.hours,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '距离上次抽烟',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.015,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '您的肺正在努力清理烟雾',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTimeUnit(context, days, '天'),
            _buildTimeUnit(context, hours, '小时'),
            _buildTimeUnit(context, minutes, '分钟'),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeUnit(BuildContext context, int value, String label) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Container(
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isDark ? AppTheme.primary.withOpacity(0.3) : AppTheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primary.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                value.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
