// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(context.locale);
    final controller = Get.put(SettingController());
    return GetBuilder<SettingController>(builder: ((controller) {
      return Scaffold(
          backgroundColor: appGreenSoft,
          appBar: AppBar(
            title: Text('pengaturan').tr(),
            centerTitle: true,
            backgroundColor: appBlue,
          ),
          body: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  title: Text("pilih_bahasa",
                          style: GoogleFonts.lato(
                              color: appBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                      .tr(),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.defaultDialog(
                        backgroundColor: appBlue,
                        barrierDismissible: false,
                        title: "",
                        content: Column(
                          children: [
                            Text("pilih_bahasa",
                                    style: GoogleFonts.lato(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                                .tr(),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await context
                                        .setLocale(context.supportedLocales[1]);
                                    Get.updateLocale(
                                        context.supportedLocales[1]);
                                    Get.back();
                                    Get.defaultDialog(
                                        backgroundColor: appBlue,
                                        barrierDismissible: false,
                                        title: "",
                                        content: Column(
                                          children: [
                                            Container(
                                              width: 130,
                                              height: 130,
                                              child: Lottie.asset(
                                                  "assets/lottie/check.json"),
                                            ),
                                            Text(
                                              "berhasil_mengubah_bahasa",
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ]);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/indonesia.png",
                                          width: 30,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Indonesia",
                                            style: GoogleFonts.lato(
                                                color: appWhite,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    )),
                                  ),
                                ),
                                InkWell(
                                  splashColor: appBlue,
                                  onTap: () async {
                                    await context
                                        .setLocale(context.supportedLocales[0]);
                                    Get.updateLocale(
                                        context.supportedLocales[0]);
                                    Get.back();
                                    Get.defaultDialog(
                                        backgroundColor: appBlue,
                                        barrierDismissible: false,
                                        title: "",
                                        content: Column(
                                          children: [
                                            Container(
                                              width: 130,
                                              height: 130,
                                              child: Lottie.asset(
                                                  "assets/lottie/check.json"),
                                            ),
                                            Text(
                                              "berhasil_mengubah_bahasa",
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ]);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/english.png",
                                          width: 30,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("English",
                                            style: GoogleFonts.lato(
                                                color: appWhite,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "batal",
                                style: GoogleFonts.lato(
                                    color: appWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ).tr()),
                        ]);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  thickness: 1,
                  color: appGrey,
                ),
              )
              ,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  title: Text("keluar_app",
                          style: GoogleFonts.lato(
                              color: appBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                      .tr(),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.defaultDialog(
                                    barrierDismissible: false,
                                    title: controller.peringatan,
                                    content: Text(
                                        "yakin_ingin_keluar",
                                        style: GoogleFonts.lato(
                                            color: appBlack,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal)).tr(),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "batal",
                                            style: GoogleFonts.lato(
                                                color: appGreen,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ).tr()),
                                      TextButton(
                                          onPressed: () {
                                           controller.closeApp();
                                          },
                                          child: Text(
                                            "yakin",
                                            style: GoogleFonts.lato(
                                                color: appGreen,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ).tr())
                                    ]);

                    
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  thickness: 1,
                  color: appGrey,
                ),
              )
            ],
          ));
    }));
  }
}
