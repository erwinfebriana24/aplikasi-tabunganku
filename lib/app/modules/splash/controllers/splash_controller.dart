// ignore_for_file: await_only_futures, prefer_const_constructors
import 'dart:async';
import 'package:get/get.dart';
import 'package:menabung/app/routes/app_pages.dart';

class SplashController extends GetxController {

  Future loading() async{
   return await Timer(Duration(seconds: 4), () {
      Get.offAndToNamed(Routes.DASHBOARD);
    });
 }
 @override
  void onInit() {
    loading();
    super.onInit();
  }
}
