import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../qibla/qibla_page.dart';
import '../prayer_times/prayer_times_page.dart';
import '../about/about_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    PrayerTimesPage(),
    QiblaPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.primaryDarkGray,
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: AppColors.primaryOrange.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time, size: 30),
            label: 'Prayer Times',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 30),
            label: 'Qibla',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, size: 30),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
