import 'package:flutter/material.dart';
import 'package:mmimobile/modules/history/screens/history_screen.dart';
import 'package:mmimobile/modules/home/screens/home_screen.dart';
import 'package:mmimobile/modules/profile/screens/profile_screen.dart';
import 'package:mmimobile/modules/system_support/screens/system_support_screen.dart';
import 'package:mmimobile/styles/color.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key,});

  // final User? user;
  // final Map<String, dynamic>? user;

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  // final List<Widget> _pages = [
  //   HomeScreen(
  //     user: widget.user!,
  //   ),
  //   const SystemSupportScreen(),
  //   const HistoryScreen(),
  //   const ProfileScreen()
  // ];

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const SystemSupportScreen(),
      const HistoryScreen(),
      const ProfileScreen()
    ];
  }

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Support',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'History',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Material(
        elevation: 10.0,
        child: BottomNavigationBar(
          selectedItemColor: ColorApps.primary,
          elevation: 20.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorApps.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: items,
        ),
      ),
    );
  }
}
