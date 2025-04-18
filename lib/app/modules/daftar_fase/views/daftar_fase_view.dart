import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_fase_controller.dart';

class DaftarFaseView extends GetView<DaftarFaseController> {
   DaftarFaseView({super.key});

final dataxx = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar $dataxx'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DaftarFaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
