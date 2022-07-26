// ignore_for_file: prefer_const_constructors
import 'package:currency_picker/currency_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menabung/app/data/db/database.dart';

class MainPageController extends GetxController {
  String kembali = tr('keluar');
  String tabungann = tr('tabungan');
  String pengeluaran = tr('pengeluaran');

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

  curency(){
    String name = "";
    final box = DatabaseManager.getDataCurrency();
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i) as DataCurrency;
      name = data.nameCurency!;
    }
    return name;
  }
}
