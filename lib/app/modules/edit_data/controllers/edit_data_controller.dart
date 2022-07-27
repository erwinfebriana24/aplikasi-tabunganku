// ignore_for_file: unnecessary_overrides, empty_catches, prefer_const_constructors, sized_box_for_whitespace, avoid_print, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/app/routes/app_pages.dart';
import 'package:menabung/theme/color.dart';

class EditDataController extends GetxController {
  String tidak_kosong = tr("nama_tabungan_tidak_boleh_kosong");
  String nama_tabungan = tr("nama_tabungan");
  String jumlah_uang_tidak_boleh_kosong = tr("jumlah_uang_tidak_boleh_kosong");
  String jumlah_uang = tr("jumlah_uang");
  /////////////////////////////////////////////////////
  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  final formKey = GlobalKey<FormState>(); // form validator key
  RxBool isLoading = false.obs;

  Future<void> editData(Database database) async {
    var data = priceC.text;
    var split = "";
    split = data.replaceAll('${curency()}', '');
    var splitFinnal = split.replaceAll(',', '');
    print(priceC.text);
    print(splitFinnal);
    isLoading.value = true;
    try {
      Future.delayed(Duration(seconds: 1), (() {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          database.name = nameC.text;
          database.price = int.parse(splitFinnal);
          database.namePrice = priceC.text;
          database.save();
          Get.offAllNamed(Routes.DASHBOARD);
          Get.defaultDialog(
              backgroundColor: appBlue,
              barrierDismissible: false,
              title: "",
              content: Column(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    child: Lottie.asset("assets/lottie/check.json"),
                  ),
                  Text(
                    "berhasil_mengubah_data",
                    style: GoogleFonts.lato(
                        color: appWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ).tr()
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "OK",
                      style: GoogleFonts.lato(
                          color: appWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              ]);
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      }));
    } catch (e) {
      isLoading.value = false;
    }
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

  @override
  void onInit() {
    curency();
    Database database = Get.arguments;
    nameC.text = database.name!;
    print(database.namePrice);
    priceC.text = database.price.toString();
    super.onInit();
  }
}
