// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty, sized_box_for_whitespace, unused_local_variable

import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/animation/fadeanimation.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/app/routes/app_pages.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    var formatter = NumberFormat('#,###');
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: appGreenSoft,
        // appBar: AppBar(
        //   title: Text('Ayo Menabung'),
        //   centerTitle: true,
        // ),
        body: DoubleBack(
          message: "Tekan sekali lagi untuk keluar",
          child: FadeAnimation(
            delay: 1,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  // pinned: true,
                  expandedHeight: size.height * .20,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: appBlue,
                    ),
                    centerTitle: true,
                    titlePadding: EdgeInsets.only(
                        right: size.width * .10,
                        left: size.width * .10,
                        bottom: size.height * .02),
                    title: Container(
                      width: size.width * .60,
                      height: size.height * .07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appWhite,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Tabungan Kamu",
                                style: GoogleFonts.lato(
                                    color: appBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "Rp ${formatter.format(controller.sumTotal())}",
                                style: GoogleFonts.lato(
                                    color: appGreen,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.ADD_DATA);
                        },
                        icon: Icon(
                          Icons.add,
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              backgroundColor: appBlue,
                              barrierDismissible: false,
                              title: "",
                              content: Column(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 130,
                                    child:
                                        Lottie.asset("assets/lottie/dev.json"),
                                  ),
                                  Text(
                                    "Kritik dan Saran \n donganapps@gmail.com",
                                    style: GoogleFonts.lato(
                                        color: appWhite,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
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
                        },
                        icon: Icon(
                          Icons.info_outline,
                          size: 25,
                        )),
                  ],
                ),
                SliverToBoxAdapter(
                    child: ValueListenableBuilder<Box<Database>>(
                        valueListenable:
                            DatabaseManager.getAllDatabase().listenable(),
                        builder: (context, box, _) {
                          var allData = box.values.toList();
                          if (allData.length == 0) {
                            return Column(
                              children: [
                                Container(
                                  width: size.width * .50,
                                  height: size.height * .30,
                                  child:
                                      Lottie.asset("assets/lottie/money.json"),
                                ),
                                Text("Ayo mulai menabung ",
                                    style: GoogleFonts.lato(
                                        color: appBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            );
                          } else {
                            return ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allData.length,
                                itemBuilder: (context, index) {
                                  Database database = allData[index];
                                  return FadeAnimation(
                                      delay: 0.8 * index,
                                      child: SafeArea(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            // side: BorderSide(color: appBlue, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          color: appWhite,
                                          margin: EdgeInsets.only(
                                              top: size.height * .02,
                                              bottom: size.height * .02,
                                              left: size.width * .05,
                                              right: size.width * .05),
                                          child: ListTile(
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                    onPressed: (() {
                                                      Get.toNamed(
                                                          Routes.EDIT_DATA,
                                                          arguments: database);
                                                    }),
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: appBlue,
                                                    )),
                                                IconButton(
                                                    onPressed: (() async {
                                                      await database.delete();
                                                      controller.sumTotal();
                                                      Get.snackbar("Berhasil",
                                                          "Berhasil menghapus ${database.name}",
                                                          colorText: appWhite,
                                                          icon: Lottie.asset(
                                                              "assets/lottie/check.json"),
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          backgroundColor:
                                                              appBlue,
                                                          borderColor: appWhite,
                                                          borderWidth: 2,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  15),
                                                          duration: Duration(
                                                              seconds: 4),
                                                          dismissDirection:
                                                              DismissDirection
                                                                  .horizontal,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .linearToEaseOut);
                                                    }),
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: appRed,
                                                    ))
                                              ],
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                left: 20,
                                                right: 20),
                                            title: Text("${database.name}",
                                                style: GoogleFonts.lato(
                                                    color: appBlack,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "Rp ${formatter.format(database.price)}",
                                                    style: GoogleFonts.lato(
                                                        color: appGreen,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w800)),
                                                SizedBox(height: 10),
                                                Text(
                                                    "${database.date}",
                                                    style: GoogleFonts.lato(
                                                        color: appBlack,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w800)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                });
                          }
                        })),
                SliverToBoxAdapter(
                  child: IconButton(
                      onPressed: (() => Get.toNamed(Routes.ADD_DATA)),
                      icon: Icon(
                        Icons.add_circle,
                        size: 30,
                      )),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.isAdLoad.isTrue
                  ? Container(
                      height: controller.bannerAd.size.height.toDouble(),
                      width: controller.bannerAd.size.width.toDouble(),
                      child: AdWidget(ad: controller.bannerAd),
                    )
                  : SizedBox()
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () {},
        // ),
      );
    });
  }
}
