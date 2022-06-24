// ignore_for_file: prefer_const_constructors
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/theme/color.dart';

class MainPageController extends GetxController {
 
  int tabungan() {
    int total = 0;
    final box = DatabaseManager.getAllDatabase();
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i) as Database;
      total += data.price!;
    }
    update();
    return total;
  }

  int pengeluran() {
    int total = 0;
    final box = DatabaseManager.getAllDatabasePengeluaran();
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i) as DatabasePengeluaran;
      total += data.price!;
    }
    update();
    return total;
  }
}
