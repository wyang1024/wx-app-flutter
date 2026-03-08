import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final int count;
  const StatusBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF431407).withOpacity(0.3) : const Color(0xFFFFEDD5),
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: isDark ? const Color(0xFF7C2D12).withOpacity(0.5) : const Color(0xFFFED7AA),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.smoking_rooms,
            size: 14,
            color: isDark ? const Color(0xFFFDBA74) : const Color(0xFF9A3412),
          ),
          const SizedBox(width: 8),
          Text(
            '今日已抽：$count 支',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? const Color(0xFFFDBA74) : const Color(0xFF9A3412),
            ),
          ),
        ],
      ),
    );
  }
}
