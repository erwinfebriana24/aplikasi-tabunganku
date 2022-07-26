import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/app/routes/app_pages.dart';

class CurrencyController extends GetxController {
  final box = DatabaseManager.getDataCurrency();

  curen(BuildContext context) {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        var data = DataCurrency();
        data.nameCurency = currency.symbol;
        box.clear();
        box.add(data);
        Get.offAllNamed(Routes.DASHBOARD);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
  }
}
