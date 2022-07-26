// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/currency_controller.dart';

class CurrencyView extends GetView<CurrencyController> {
  const CurrencyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: controller.curen(context)
      ),
    );
  }
}
