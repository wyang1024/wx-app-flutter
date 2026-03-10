import 'package:flutter/material.dart';
import '../app_theme.dart';

class DailyStatsCapsule extends StatelessWidget {
  final int todayCount;
  final int difference;

  const DailyStatsCapsule({
    super.key,
    required this.todayCount,
    required this.difference,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.smoking_rooms,
                color: AppTheme.brandOrange,
                size: 20,
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                  children: [
                    const TextSpan(text: '今日已抽：'),
                    TextSpan(
                      text: '$todayCount',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const TextSpan(text: ' 支'),
                  ],
                ),
              ),
            ],
          ),
          Text(
            '相比于昨日少抽 $difference 支',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }
}
