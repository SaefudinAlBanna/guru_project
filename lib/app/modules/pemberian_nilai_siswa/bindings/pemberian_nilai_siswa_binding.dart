import 'package:get/get.dart';

import '../controllers/pemberian_nilai_siswa_controller.dart';

class PemberianNilaiSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemberianNilaiSiswaController>(
      () => PemberianNilaiSiswaController(),
    );
  }
}
