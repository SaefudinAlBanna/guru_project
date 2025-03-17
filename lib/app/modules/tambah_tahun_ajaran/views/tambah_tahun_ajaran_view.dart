import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_tahun_ajaran_controller.dart';

class TambahTahunAjaranView extends GetView<TambahTahunAjaranController> {
  const TambahTahunAjaranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahTahunAjaranView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextField(
            controller: controller.tahunAjaranC,
            decoration: InputDecoration(
              label: Text('Masukan Tahun Ajaran'),
            ),
          ),

          ElevatedButton(onPressed: (){
            controller.simpanTahunAjaran();
          }, child: Text('Simpan'),),


          ElevatedButton(onPressed: (){
            controller.test();
          }, child: Text('Test'),),
        ],
      ),
    );
  }
}
