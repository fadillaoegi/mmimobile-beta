import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_history/history/views/history_view.dart';
import 'package:mmimobile/app/modules/home/views/home_view.dart';
import 'package:mmimobile/app/modules/modules_profile/profile/views/profile_view.dart';
import 'package:mmimobile/app/modules/modules_system_support/system_support/views/system_support_view.dart';

class AppMainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Rx<int> currentIndex = 0.obs;

  final pages = [
    const HomeView(),
    const SystemSupportView(),
    const HistoryView(),
    const ProfileView()
  ].obs;

  final items = const [
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
}
