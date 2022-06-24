// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/app/routes/app_pages.dart';
import 'package:menabung/theme/color.dart';

class AddPengeluaranController extends GetxController {
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

  void addData() async {
    var data = priceC.text;
    var split = data.replaceAll('Rp', '');
    var splitFinnal = split.replaceAll(',', '');
    print(priceC.text);
    print(split);
    print(splitFinnal);
    isLoading.value = true;
    try {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        var data = DatabasePengeluaran()
          ..name = nameC.text
          ..price = int.parse(splitFinnal)
          ..namePrice = priceC.text;
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
                  "Berhasil menambah pengeluaran",
                  style: GoogleFonts.lato(
                      color: appWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
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
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}