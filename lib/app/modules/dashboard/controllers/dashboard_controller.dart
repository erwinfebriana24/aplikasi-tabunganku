import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 1;

  void changeTab(int index) {
    currentIndex = index;
    update();
  }
}
