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
      width: double.infinity,
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
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '¥$amount',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF666666),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 0,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
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
          const SizedBox(height: 16),
          Row(
            children: [
              _buildItem('🍲', '双人火锅'),
              const SizedBox(width: 8),
              _buildItem('📚', '精选书籍'),
              const SizedBox(width: 8),
              _buildItem('🎮', '游戏大作'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String emoji, String label) {
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
