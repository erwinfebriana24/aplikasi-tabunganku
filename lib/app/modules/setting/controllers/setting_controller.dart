import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:menabung/app/data/db/database.dart';

class SettingController extends GetxController {
  String peringatan = tr('peringatan');

  final boxx = DatabaseManager.getDataCurrency();
  closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

  Future <void> currencyPicker(BuildContext context) async{
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        var data = DataCurrency();
        data.nameCurency = currency.symbol;
        boxx.add(data);
        var list = DatabaseManager.getDataCurrency();
        var box = list.values.toList();
        data = box[0];
        data.save();
      },
    );
  }

  @override
  void onInit() {
    print(boxx.length);
    super.onInit();
  }
}
