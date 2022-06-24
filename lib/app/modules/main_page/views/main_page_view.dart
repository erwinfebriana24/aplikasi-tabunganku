// ignore_for_file: prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/animation/fadeanimation.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final controller = Get.put(MainPageController());
    var formatter = NumberFormat('#,###');
    return GetBuilder<MainPageController>(builder: (controller) {
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
                                Text("Selisih Uang",
                                    style: GoogleFonts.lato(
                                        color: appBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                controller.tabungan() -
                                            controller.pengeluran() <
                                        0
                                    ? Text(
                                        "Rp ${formatter.format(controller.tabungan() - controller.pengeluran())}",
                                        style: GoogleFonts.lato(
                                            color: appRed,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                    : Text(
                                        "Rp ${formatter.format(controller.tabungan() - controller.pengeluran())}",
                                        style: GoogleFonts.lato(
                                            color: appGreen,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      actions: [
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
                                        child: Lottie.asset(
                                            "assets/lottie/dev.json"),
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
                    controller.tabungan() - controller.pengeluran() == 0
                        ? SliverToBoxAdapter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: size.width * .50,
                                  height: size.height * .40,
                                  child:
                                      Lottie.asset("assets/lottie/home.json"),
                                ),
                            ],
                          ))
                        : SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: appBlue,
                                  ),
                                  alignment: Alignment.center,
                                  height: size.height * .10,
                                  width: size.width,
                                  child: Text(
                                      "Grafik Selisih \n Tabungan Dan Pengeluaran",
                                      style: GoogleFonts.lato(
                                          color: appWhite,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                                ),
                                Container(
                                  //  decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                                  //   color: appWhite,
                                  // ),
                                  height: size.height * .40,
                                  width: size.width,
                                  child: PieChart(PieChartData(
                                      centerSpaceRadius: 30,
                                      sectionsSpace: 3,
                                      borderData: FlBorderData(show: false),
                                      sections: [
                                        PieChartSectionData(
                                            title:
                                                "${controller.tabungan() / 1000}",
                                            value: controller
                                                .tabungan()
                                                .toDouble(),
                                            color: appGreen,
                                            radius: 55,
                                            titleStyle: GoogleFonts.lato(
                                                color: appWhite,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        PieChartSectionData(
                                            title:
                                                "${controller.pengeluran() / 1000}",
                                            value: controller
                                                .pengeluran()
                                                .toDouble(),
                                            color: appRed,
                                            radius: 50,
                                            titleStyle: GoogleFonts.lato(
                                                color: appWhite,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ])),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Indicator(
                                      color: appGreen,
                                      text: 'Tabungan',
                                      isSquare: true,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Indicator(
                                      color: appRed,
                                      text: 'Pengeluaran',
                                      isSquare: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              )));
    });
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}
