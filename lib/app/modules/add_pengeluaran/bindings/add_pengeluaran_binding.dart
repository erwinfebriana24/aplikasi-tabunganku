import 'package:get/get.dart';

import '../controllers/add_pengeluaran_controller.dart';

class AddPengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPengeluaranController>(
      () => AddPengeluaranController(),
    );
  }
}
