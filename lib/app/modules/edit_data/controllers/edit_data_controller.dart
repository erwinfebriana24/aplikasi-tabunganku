// ignore_for_file: unnecessary_overrides, empty_catches, prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/app/routes/app_pages.dart';
import 'package:menabung/theme/color.dart';

class EditDataController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  final formKey = GlobalKey<FormState>(); // form validator key
  RxBool isLoading = false.obs;


  Future<void> editData(Database database) async {
    var data = priceC.text;
    var split = data.replaceAll('Rp', '');
    var splitFinnal = split.replaceAll(',', '');
    print(priceC.text);
    print(splitFinnal);
    isLoading.value = true;
    try {
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
                  "Berhasil mengubah data",
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
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    Database database = Get.arguments;
    nameC.text = database.name!;
    priceC.text = database.namePrice.toString();
    super.onInit();
  }
}
