import 'package:get/get.dart';

import '../controllers/daftar_fase_controller.dart';

class DaftarFaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarFaseController>(
      () => DaftarFaseController(),
    );
  }
}
