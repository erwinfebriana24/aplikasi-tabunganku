// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whitespace
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menabung/app/modules/home/views/home_view.dart';
import 'package:menabung/app/modules/main_page/views/main_page_view.dart';
import 'package:menabung/app/modules/pengeluaran/views/pengeluaran_view.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Container(
        height: 45,
        child: Column(
          children: [
            Icon(Icons.wallet, size: 30, color: appWhite),
            Text("Tabungan",
                style: GoogleFonts.lato(
                    color: appWhite, fontSize: 10, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      Icon(Icons.home, size: 30, color: appWhite),
     Container(
        height: 45,
        child: Column(
          children: [
            Icon(Icons.account_balance_wallet, size: 30, color: appWhite),
            Text("Pengeluaran",
                style: GoogleFonts.lato(
                    color: appWhite, fontSize: 10, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    ];
    final screens = [HomeView(), MainPageView(), PengeluaranView()];
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(child: screens[controller.currentIndex]),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: appGreenSoft,
            buttonBackgroundColor: appBlue,
            color: appBlue,
            index: controller.currentIndex,
            height: 55,
            items: items,
            onTap: controller.changeTab,
          )
          //other params
          );
    });
  }
}
