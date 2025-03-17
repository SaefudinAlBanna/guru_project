import 'package:get/get.dart';

import '../controllers/tambah_kelas_baru_controller.dart';

class TambahKelasBaruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKelasBaruController>(
      () => TambahKelasBaruController(),
    );
  }
}
