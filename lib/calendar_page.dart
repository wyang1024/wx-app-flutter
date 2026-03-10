import 'package:flutter/material.dart';
import 'app_theme.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? AppTheme.backgroundDark : AppTheme.backgroundLight,
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, isDark),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 250), // Room for detail panel
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _buildDataCapsules(isDark),
                        const SizedBox(height: 24),
                        _buildCalendarGrid(isDark),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildDetailPanel(isDark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left, color: isDark ? Colors.white70 : Colors.black87),
            onPressed: () {},
          ),
          const Text(
            '2024年3月',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.event_note, color: AppTheme.primary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDataCapsules(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          _buildCapsule('无烟日', '5天', const Color(0xFF2D6A4F), isDark),
          const SizedBox(width: 12),
          _buildCapsule('日均', '8.6支', isDark ? Colors.white : Colors.black87, isDark),
          const SizedBox(width: 12),
          _buildCapsule('消费', '¥620', AppTheme.primary, isDark),
        ],
      ),
    );
  }

  Widget _buildCapsule(String label, String value, Color valueColor, bool isDark) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.cardDark.withOpacity(0.5) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? Colors.white10 : Colors.black12.withOpacity(0.05),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black26 : Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: Column(
        children: [
          _buildDaysOfWeek(),
          const SizedBox(height: 12),
          _buildCalendarDays(isDark),
        ],
      ),
    );
  }

  Widget _buildDaysOfWeek() {
    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((day) => Text(
                day,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarDays(bool isDark) {
    // March 2024 starts on Friday (index 5)
    List<Widget> dayWidgets = [];
    for (int i = 0; i < 4; i++) {
      dayWidgets.add(const AspectRatio(aspectRatio: 1));
    }

    for (int day = 1; day <= 31; day++) {
      dayWidgets.add(_buildDayCell(day, isDark));
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: dayWidgets,
    );
  }

  Widget _buildDayCell(int day, bool isDark) {
    if (day == 5) {
      // Smoke-free day
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5F1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2D6A4F).withOpacity(0.1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$day',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D6A4F),
              ),
            ),
            const Icon(Icons.check_circle, size: 12, color: Color(0xFF2D6A4F)),
          ],
        ),
      );
    }

    if (day == 10) {
      // Today / High Consumption
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFF4E6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD97706), width: 2),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '$day',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD97706),
              ),
            ),
            const Positioned(
              bottom: 1,
              left: 1,
              right: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🚬x15', style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold, color: Color(0xFFD97706))),
                  SizedBox(width: 2),
                  Text('¥20', style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold, color: Color(0xFFD97706))),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (day == 8) {
      // Shopping day (red dot)
      return Stack(
        alignment: Alignment.center,
        children: [
          Text(
            '$day',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
        ],
      );
    }

    return Center(
      child: Text(
        '$day',
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
      ),
    );
  }

  Widget _buildDetailPanel(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.cardDark : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : Colors.black12,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '3月10日 详情',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '今日',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD97706),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildRecordSection(
            icon: Icons.smoking_rooms,
            title: '吸烟记录',
            items: [
              _buildRecordItem('14:30', '饭后', '1 支'),
              _buildRecordItem('16:45', '压力大', '2 支'),
            ],
          ),
          const SizedBox(height: 24),
          _buildRecordSection(
            icon: Icons.payments,
            title: '消费支出',
            items: [
              _buildRecordItem('20:00', '便利店', '¥45', isValuePrimary: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecordSection({required IconData icon, required String title, required List<Widget> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }

  Widget _buildRecordItem(String time, String label, String value, {bool isValuePrimary = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(time, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isValuePrimary ? AppTheme.primary : null,
            ),
          ),
        ],
      ),
    );
  }
}
