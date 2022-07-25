import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
   closeApp(){
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

}
