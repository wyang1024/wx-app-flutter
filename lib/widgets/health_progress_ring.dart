import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../app_theme.dart';

class HealthProgressRing extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final int healthPercentage;

  const HealthProgressRing({
    super.key,
    required this.progress,
    required this.healthPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: 256,
      height: 256,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow
          Container(
            width: 256,
            height: 256,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primary.withOpacity(isDark ? 0.1 : 0.05),
            ),
          ),
          // Progress SVG-like Ring using CustomPaint
          SizedBox(
            width: 256,
            height: 256,
            child: CustomPaint(
              painter: _RingPainter(
                progress: progress,
                backgroundColor: isDark ? const Color(0xFF064E3B).withOpacity(0.3) : const Color(0xFFDCFCE7),
                progressColor: isDark ? const Color(0xFF22C55E) : const Color(0xFF4ADE80),
              ),
            ),
          ),
          // Lung Icon (Pulse animation could be added with a StatefulWidget)
          _LungIcon(),
          // Health Percentage Badge
          Positioned(
            bottom: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B).withOpacity(0.8) : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(
                  color: isDark ? const Color(0xFF065F46).withOpacity(0.5) : const Color(0xFFDCFCE7),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Text(
                '健康度 $healthPercentage%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark ? const Color(0xFF4ADE80) : const Color(0xFF16A34A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LungIcon extends StatefulWidget {
  @override
  State<_LungIcon> createState() => _LungIconState();
}

class _LungIconState extends State<_LungIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Icon(
        Icons.air,
        size: 140,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFFF472B6)
            : const Color(0xFFF9A8D4),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  _RingPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4; // strokeWidth / 2
    const strokeWidth = 8.0;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! _RingPainter) return true;
    return progress != oldDelegate.progress ||
        backgroundColor != oldDelegate.backgroundColor ||
        progressColor != oldDelegate.progressColor;
  }
}
