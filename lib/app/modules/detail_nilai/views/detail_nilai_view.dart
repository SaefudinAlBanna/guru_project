import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_nilai_controller.dart';

class DetailNilaiView extends GetView<DetailNilaiController> {
  const DetailNilaiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailNilaiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailNilaiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
