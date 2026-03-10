import 'package:flutter/material.dart';
import '../app_theme.dart';

class DashboardHeader extends StatelessWidget {
  final int hours;
  final int minutes;

  const DashboardHeader({
    super.key,
    required this.hours,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            '距离上次吸烟已过去',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8), // Slate-400
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A), // Slate-900
              ),
              children: [
                TextSpan(text: '$hours'),
                const TextSpan(
                  text: ' 小时 ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                TextSpan(text: '$minutes'),
                const TextSpan(
                  text: ' 分钟',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.brandGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '累计戒烟时长 | 身体持续修复中',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.brandGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
