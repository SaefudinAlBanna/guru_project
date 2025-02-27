import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/info_sekolah_controller.dart';

class InfoSekolahView extends GetView<InfoSekolahController> {
  const InfoSekolahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfoSekolahView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InfoSekolahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
