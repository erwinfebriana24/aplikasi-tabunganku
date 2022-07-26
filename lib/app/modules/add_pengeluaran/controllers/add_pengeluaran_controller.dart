// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/app/routes/app_pages.dart';
import 'package:menabung/theme/color.dart';

class AddPengeluaranController extends GetxController {
  String tidak_kosong = tr("nama_pengeluaran_tidak_boleh_kosong");
  String nama_pengeluaran = tr("nama_pengeluaran");
  String jumlah_uang_tidak_boleh_kosong = tr("jumlah_uang_tidak_boleh_kosong");
  String jumlah_uang = tr("jumlah_uang");
  String mata_uang = tr("mata_uang2");
  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  final formKey = GlobalKey<FormState>(); // form validator key
  RxBool isLoading = false.obs;
  InterstitialAd? interstitialAd;

  void initInititialAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-6607178927612423/6203425973',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            interstitialAd = ad;
            interstitialAd!.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  Future<void> addData() async {
    var data = priceC.text;
    var split = "";
    split = data.replaceAll('${curency()}', '');
    var splitFinnal = split.replaceAll(',', '');
    print(priceC.text);
    print(split);
    print(splitFinnal);
    isLoading.value = true;
    try {
      Future.delayed(Duration(seconds: 1), (() async {
        // Mendapatkan tanggal
        final now = DateTime.now();
        final formatter = DateFormat('dd-MM-yyyy');
        final format = formatter.format(now);
        ////////////////////////////////////////////
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          var data = DatabasePengeluaran()
            ..name = nameC.text
            ..price = int.parse(splitFinnal)
            ..namePrice = priceC.text
            ..date = format;
          final box = DatabaseManager.getAllDatabasePengeluaran();
          await box.add(data);
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
                    "berhasil_menambah_data",
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
          initInititialAd();
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      }));
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  curency() {
    String name = "";
    final box = DatabaseManager.getDataCurrency();
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i) as DataCurrency;
      name = data.nameCurency!;
    }
    return name;
  }
}
