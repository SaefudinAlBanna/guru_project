import 'package:get/get.dart';

import '../controllers/buat_kelompok_mengaji_controller.dart';

class BuatKelompokMengajiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatKelompokMengajiController>(
      () => BuatKelompokMengajiController(),
    );
  }
}
