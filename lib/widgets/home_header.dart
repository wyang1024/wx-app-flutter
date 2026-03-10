import 'package:flutter/material.dart';
import '../app_theme.dart';

class HomeHeader extends StatelessWidget {
  final int hours;
  final int minutes;

  const HomeHeader({
    super.key,
    required this.hours,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 48, bottom: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
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
              color: Color(0xFF94A3B8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: '$hours'),
                const TextSpan(
                  text: ' 小时 ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                TextSpan(text: '$minutes'),
                const TextSpan(
                  text: ' 分钟',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _PulsingDot(),
              const SizedBox(width: 4),
              const Text(
                '累计戒烟时长 | 身体持续修复中',
                style: TextStyle(
                  color: AppTheme.brandGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: AppTheme.brandGreen,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
