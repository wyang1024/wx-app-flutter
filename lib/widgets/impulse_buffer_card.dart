import 'package:flutter/material.dart';
import '../app_theme.dart';

class ImpulseBufferCard extends StatelessWidget {
  const ImpulseBufferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          const Text(
            '冲动缓冲冷静期',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Material(
            color: const Color(0xFFFF9800),
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: '🚨 启动 '),
                          TextSpan(
                            text: '15 分钟',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          TextSpan(text: ' 冷静期'),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.shield,
                      color: Color(0xFF1976D2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '想抽烟？深呼吸，给自己5分钟缓一缓～',
            style: TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
