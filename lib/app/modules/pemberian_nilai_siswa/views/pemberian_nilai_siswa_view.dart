import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pemberian_nilai_siswa_controller.dart';

class PemberianNilaiSiswaView extends GetView<PemberianNilaiSiswaController> {
  const PemberianNilaiSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PemberianNilaiSiswaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PemberianNilaiSiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
