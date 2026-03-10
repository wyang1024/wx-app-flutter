import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'widgets/home_header.dart';
import 'widgets/daily_stats_capsule.dart';
import 'widgets/impulse_buffer_card.dart';
import 'widgets/consumption_module.dart';
import 'widgets/relapse_care_module.dart';
import 'record_buying_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeHeader(hours: 12, minutes: 45),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const DailyStatsCapsule(count: 5, difference: 2),
                          const SizedBox(height: 20),
                          const ImpulseBufferCard(),
                          const SizedBox(height: 20),
                          ConsumptionModule(
                            amount: 850,
                            onRecord: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RecordBuyingPage()),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          RelapseCareModule(
                            onRestart: () {
                              // Handle restart
                            },
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFF1F5F9),
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white.withOpacity(0.8),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.brandBlue,
          unselectedItemColor: const Color(0xFF94A3B8),
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.military_tech, size: 24),
              label: '成就',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.forum, size: 24),
              label: '社区',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 24),
              label: '设置',
            ),
          ],
        ),
      ),
    );
  }
}
