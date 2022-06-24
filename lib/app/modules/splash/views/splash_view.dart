// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:menabung/theme/color.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appGreenSoft,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            width: size.width * .80,
            height: size.height * .50,
            child: Lottie.asset("assets/lottie/finance.json"),
          )),
          Platform.isIOS
              ? CupertinoActivityIndicator(
                  radius: 15,
                  color: appBlue,
                )
              : CircularProgressIndicator(
                  color: appBlue,
                )
        ],
      ),
    );
  }
}
