import 'package:get/get.dart';

import '../controllers/tambah_tahun_ajaran_controller.dart';

class TambahTahunAjaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahTahunAjaranController>(
      () => TambahTahunAjaranController(),
    );
  }
}
