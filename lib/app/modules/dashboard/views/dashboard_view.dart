// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whitespace
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menabung/app/modules/home/views/home_view.dart';
import 'package:menabung/app/modules/main_page/views/main_page_view.dart';
import 'package:menabung/app/modules/pengeluaran/views/pengeluaran_view.dart';
import 'package:menabung/app/modules/setting/views/setting_view.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeView(),
      MainPageView(),
      PengeluaranView(),
      SettingView()
    ];
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(child: screens[controller.currentIndex]),
          bottomNavigationBar: BottomNavyBar(
              iconSize: 30,
              curve: Curves.easeIn,
              backgroundColor: appGreenSoft,
              selectedIndex: controller.currentIndex,
              showElevation: true,
              onItemSelected: controller.changeTab,
              items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.account_balance),
                    title: Text('masuk').tr(),
                    activeColor: appBlue,
                    inactiveColor: appBlack),
                BottomNavyBarItem(
                    icon: Icon(Icons.home),
                    title: Text('utama').tr(),
                    activeColor: appBlue,
                    inactiveColor: appBlack),
                BottomNavyBarItem(
                    icon: Icon(Icons.account_balance_wallet_outlined),
                    title: Text('keluarr').tr(),
                    activeColor: appBlue,
                    inactiveColor: appBlack),
                BottomNavyBarItem(
                    icon: Icon(Icons.settings),
                    title: Text('pengaturan').tr(),
                    activeColor: appBlue,
                    inactiveColor: appBlack),
              ]));
    });
  }
}
