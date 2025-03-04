import 'package:get/get.dart';

import '../controllers/detail_nilai_controller.dart';

class DetailNilaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNilaiController>(
      () => DetailNilaiController(),
    );
  }
}
