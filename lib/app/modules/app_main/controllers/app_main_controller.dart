import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_history/history/views/history_view.dart';
import 'package:mmimobile/app/modules/home/views/home_view.dart';
import 'package:mmimobile/app/modules/modules_profile/profile/views/profile_view.dart';
import 'package:mmimobile/app/modules/modules_system_support/system_support/views/system_support_view.dart';
import 'package:mmimobile/app/modules/modules_survey/survey/views/survey_view.dart';

class AppMainController extends GetxController {
  Rx<int> currentIndex = 0.obs;

  final pages = <Widget>[
    HomeView(),
    SystemSupportView(),
    SurveyView(),
    HistoryView(),
    ProfileView()
  ].obs;

  final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
        // color: ColorApps.white,
      ),
      label: 'Beranda',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.book_outlined,
        // color: ColorApps.white,
      ),
      label: 'Support',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.assignment_outlined,
        // color: ColorApps.white,
      ),
      label: 'Survei',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.history,
        // color: ColorApps.white,
      ),
      label: 'Riwayat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
        // color: ColorApps.white,
      ),
      label: 'Profil',
    ),
  ].obs;
}
