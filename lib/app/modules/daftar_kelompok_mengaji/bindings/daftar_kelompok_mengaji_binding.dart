import 'package:get/get.dart';

import '../controllers/daftar_kelompok_mengaji_controller.dart';

class DaftarKelompokMengajiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarKelompokMengajiController>(
      () => DaftarKelompokMengajiController(),
    );
  }
}
