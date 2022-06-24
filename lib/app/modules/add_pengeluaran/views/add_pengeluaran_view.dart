// ignore_for_file: prefer_const_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/add_pengeluaran_controller.dart';

class AddPengeluaranView extends GetView<AddPengeluaranController> {
  const AddPengeluaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBlue,
          title: Text("Tambah Pengeluaran",
              style: GoogleFonts.lato(
                  color: appWhite, fontSize: 16, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * .02, horizontal: size.width * .05),
            child: Column(
              children: [
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama pengeluaran tidak boleh kosong";
                      } else {
                        return null;
                      }
                    },
                    style: GoogleFonts.lato(
                        color: appBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    controller: controller.nameC,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        labelText: "Nama Pengeluaran",
                        labelStyle: GoogleFonts.lato(
                            color: appBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                SizedBox(
                  height: size.height * .02,
                ),
                TextFormField(
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                          decimalDigits: 0, symbol: "Rp ")
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Jumlah uang tidak boleh kosong";
                      } else {
                        return null;
                      }
                    },
                    style: GoogleFonts.lato(
                        color: appBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    controller: controller.priceC,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    decoration: InputDecoration(
                        labelText: "Jumlah Uang",
                        labelStyle: GoogleFonts.lato(
                            color: appBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                SizedBox(
                  height: size.height * .02,
                ),
                Obx(() => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: appBlue,
                          fixedSize: Size(size.width * .70, size.height * .07),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      onPressed: () {
                        if (controller.isLoading.isFalse) {
                          FocusManager.instance.primaryFocus!.unfocus();
                          controller.addData();
                        }
                      },
                      child: controller.isLoading.isFalse
                          ? Text("Simpan",
                              style: GoogleFonts.lato(
                                  color: appWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                          : CircularProgressIndicator(),
                    )),
              ],
            ),
          ),
        ));
  }
}
