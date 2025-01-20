import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.TAMBAH_PEGAWAI),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
