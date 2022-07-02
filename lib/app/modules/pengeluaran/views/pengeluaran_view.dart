// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whitespace, prefer_is_empty, unnecessary_string_interpolations
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/animation/fadeanimation.dart';
import 'package:menabung/app/data/db/database.dart';
import 'package:menabung/app/routes/app_pages.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/pengeluaran_controller.dart';

class PengeluaranView extends GetView<PengeluaranController> {
  const PengeluaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PengeluaranController());
    var formatter = NumberFormat('#,###');
    var size = MediaQuery.of(context).size;
    return GetBuilder<PengeluaranController>(builder: (controller) {
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
                  backgroundColor: appBlue,
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
                            Text("Pengeluaran Kamu",
                                style: GoogleFonts.lato(
                                    color: appBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "Rp ${formatter.format(controller.sumTotal())}",
                                style: GoogleFonts.lato(
                                    color: appRed,
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
                          Get.toNamed(Routes.ADD_PENGELUARAN);
                        },
                        icon: Icon(
                          Icons.add,
                          size: 25,
                        )),
                    IconButton(
                        onPressed: (() => controller.kondisiAwal()),
                        icon: Icon(Icons.restore_outlined)),
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
                controller.listData.length == 0
                    ? SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              width: size.width * .50,
                              height: size.height * .30,
                              child: Lottie.asset("assets/lottie/cart.json"),
                            ),
                            Text("Ayo hitung pengeluaranmu ",
                                style: GoogleFonts.lato(
                                    color: appBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: size.height * .15,
                              width: size.width * .90,
                              // color: appWhite,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(blurRadius: 7, color: appBlack)
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: appWhite,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width * .90,
                                    height: size.height * .10,
                                    child: GestureDetector(
                                        onTap: () {
                                          showDatePicker(
                                                  builder: (context, child) {
                                                    return Theme(
                                                        data: Theme.of(context).copyWith(
                                                            colorScheme:
                                                                ColorScheme.light(
                                                                    primary:
                                                                        appBlue),
                                                            textButtonTheme: TextButtonThemeData(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                        primary:
                                                                            appRed))),
                                                        child: child!);
                                                  },
                                                  helpText:
                                                      "Pilih tanggal lahir",
                                                  cancelText: "Batal",
                                                  confirmText: "Pilih",
                                                  fieldLabelText:
                                                      "Pilih tanggal",
                                                  fieldHintText:
                                                      "Masukan tanggal lahir",
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2020),
                                                  lastDate: DateTime(2030),
                                                  initialEntryMode:
                                                      DatePickerEntryMode
                                                          .calendar)
                                              .then((value) {
                                            if (value != null) {
                                              controller.date.value = controller
                                                  .convertDateTimeDisplay(
                                                      value.toString());
                                              controller.onSearch();
                                            }
                                          });
                                        },
                                        child: Lottie.asset(
                                            "assets/lottie/calendar2.json")),
                                  ),
                                  Obx(() => Text(
                                      controller.date.value == ""
                                          ? "Pilih tanggal pengeluaran"
                                          : "${controller.date.value}",
                                      style: GoogleFonts.lato(
                                          color: appBlack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                controller.date.value == ""
                    ? SliverToBoxAdapter(
                        child: DataAwal(size: size, formatter: formatter))
                    : controller.listDatabase.length == 0
                        ? SliverToBoxAdapter(
                            child: SizedBox(
                              height: size.height * .40,
                              child: Center(
                                  child: Text("Data tidak ditemukan",
                                      style: GoogleFonts.lato(
                                          color: appBlack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: DataBedasarkanTanggal(
                                size: size, formatter: formatter),
                          ),
                SliverToBoxAdapter(
                  child: IconButton(
                      onPressed: (() => Get.toNamed(Routes.ADD_PENGELUARAN)),
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

class DataAwal extends StatelessWidget {
  const DataAwal({
    Key? key,
    required this.size,
    required this.formatter,
  }) : super(key: key);

  final Size size;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PengeluaranController());
    var list = DatabaseManager.getAllDatabasePengeluaran();
    var box = list.values.toList();
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          DatabasePengeluaran database = box[index];
          return FadeAnimation(
              delay: 0.8 * index,
              child: SafeArea(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(color: appBlue, width: 1),
                    borderRadius: BorderRadius.circular(10),
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
                              Get.toNamed(Routes.EDIT_PENGELUARAN,
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
                                  icon:
                                      Lottie.asset("assets/lottie/check.json"),
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: appBlue,
                                  borderColor: appWhite,
                                  borderWidth: 2,
                                  margin: EdgeInsets.all(15),
                                  duration: Duration(seconds: 4),
                                  dismissDirection: DismissDirection.horizontal,
                                  forwardAnimationCurve:
                                      Curves.linearToEaseOut);
                            }),
                            icon: Icon(
                              Icons.delete,
                              color: appRed,
                            ))
                      ],
                    ),
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    title: Text("${database.name}",
                        style: GoogleFonts.lato(
                            color: appBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Rp ${formatter.format(database.price)}",
                            style: GoogleFonts.lato(
                                color: appRed,
                                fontSize: 16,
                                fontWeight: FontWeight.w800)),
                        SizedBox(height: 10),
                        Text("${database.date}",
                            style: GoogleFonts.lato(
                                color: appBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}

class DataBedasarkanTanggal extends StatelessWidget {
  const DataBedasarkanTanggal({
    Key? key,
    required this.size,
    required this.formatter,
  }) : super(key: key);

  final Size size;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PengeluaranController());
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.listDatabase.length,
        itemBuilder: (context, index) {
          DatabasePengeluaran database = controller.listDatabase[index];
          return FadeAnimation(
              delay: 0.8 * index,
              child: SafeArea(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(color: appBlue, width: 1),
                    borderRadius: BorderRadius.circular(10),
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
                              Get.toNamed(Routes.EDIT_DATA,
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
                              controller.kondisiAwal();
                              Get.snackbar("Berhasil",
                                  "Berhasil menghapus ${database.name}",
                                  colorText: appWhite,
                                  icon:
                                      Lottie.asset("assets/lottie/check.json"),
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: appBlue,
                                  borderColor: appWhite,
                                  borderWidth: 2,
                                  margin: EdgeInsets.all(15),
                                  duration: Duration(seconds: 4),
                                  dismissDirection: DismissDirection.horizontal,
                                  forwardAnimationCurve:
                                      Curves.linearToEaseOut);
                            }),
                            icon: Icon(
                              Icons.delete,
                              color: appRed,
                            ))
                      ],
                    ),
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                    title: Text("${database.name}",
                        style: GoogleFonts.lato(
                            color: appBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Rp ${formatter.format(database.price)}",
                            style: GoogleFonts.lato(
                                color: appRed,
                                fontSize: 16,
                                fontWeight: FontWeight.w800)),
                        SizedBox(height: 10),
                        Text("${database.date}",
                            style: GoogleFonts.lato(
                                color: appBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
