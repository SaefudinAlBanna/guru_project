import 'package:get/get.dart';

import '../controllers/update_kelas_tahun_ajaran_controller.dart';

class UpdateKelasTahunAjaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateKelasTahunAjaranController>(
      () => UpdateKelasTahunAjaranController(),
    );
  }
}
