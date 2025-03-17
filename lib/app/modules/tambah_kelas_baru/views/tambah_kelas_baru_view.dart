import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_kelas_baru_controller.dart';

class TambahKelasBaruView extends GetView<TambahKelasBaruController> {
  const TambahKelasBaruView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahKelasBaruView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: controller.kelasBaruC,
            decoration: InputDecoration(
              label: Text('Masukan Kelas Baru'),
            ),
          ),

          ElevatedButton(onPressed: (){
            controller.simpanKelasBaru();
          }, child: Text('Simpan'),),
        ],
      ),
    );
  }
}
