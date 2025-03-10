import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_siswa_controller.dart';

class DetailSiswaView extends GetView<DetailSiswaController> {
   DetailSiswaView({super.key});

  final String dataNama = Get.arguments;
  final String dataKelas = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama Siswa : $dataNama'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailSiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
