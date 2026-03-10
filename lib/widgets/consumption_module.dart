import 'package:flutter/material.dart';
import '../app_theme.dart';

class ConsumptionModule extends StatelessWidget {
  final int amount;
  final VoidCallback onRecord;

  const ConsumptionModule({
    super.key,
    required this.amount,
    required this.onRecord,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '本月烧掉的钱',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '¥$amount',
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: onRecord,
                icon: const Icon(Icons.edit_note, size: 18),
                label: const Text('记一笔'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9800),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '（这些钱本来可以换成...）',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _SavingsItem(emoji: '🍲', label: '双人火锅'),
              const SizedBox(width: 8),
              _SavingsItem(emoji: '📚', label: '精选书籍'),
              const SizedBox(width: 8),
              _SavingsItem(emoji: '🎮', label: '游戏大作'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SavingsItem extends StatelessWidget {
  final String emoji;
  final String label;

  const _SavingsItem({required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
