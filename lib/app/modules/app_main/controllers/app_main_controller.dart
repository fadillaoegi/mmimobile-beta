import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_history/history/views/history_view.dart';
import 'package:mmimobile/app/modules/home/views/home_view.dart';
import 'package:mmimobile/app/modules/modules_profile/profile/views/profile_view.dart';
import 'package:mmimobile/app/modules/modules_system_support/system_support/views/system_support_view.dart';
import 'package:mmimobile/app/modules/rating_services/views/rating_services_view.dart';

class AppMainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Rx<int> currentIndex = 0.obs;

  final pages = [
    const HomeView(),
    const SystemSupportView(),
    const RatingServicesView(),
    const HistoryView(),
    const ProfileView()
  ].obs;

  final items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Beranda',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book_outlined),
      label: 'Support',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assignment_outlined),
      label: 'Survey',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'Riwayat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profil',
    ),
  ];
}
