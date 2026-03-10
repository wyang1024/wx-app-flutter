import 'package:flutter/material.dart';
import '../app_theme.dart';

class RelapseCareModule extends StatelessWidget {
  final VoidCallback onRestart;

  const RelapseCareModule({
    super.key,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFC8E6C9)),
      ),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF2E7D32),
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: '💡 小贴士：',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '没关系，戒烟是场马拉松，偶尔的跌倒不代表失败，让我们重新出发',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB74D),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
              shadowColor: const Color(0xFFFFB74D).withOpacity(0.3),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, size: 20),
                SizedBox(width: 8),
                Text(
                  '我刚抽了一根，帮我重启',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
