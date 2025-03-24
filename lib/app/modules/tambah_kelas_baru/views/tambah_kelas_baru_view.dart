// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/tambah_kelas_baru_controller.dart';

// class TambahKelasBaruView extends GetView<TambahKelasBaruController> {
//   const TambahKelasBaruView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TambahKelasBaruView'),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: [
//           TextField(
//             textCapitalization: TextCapitalization.sentences,
//             controller: controller.kelasBaruC,
//             decoration: InputDecoration(
//               label: Text('Masukan Kelas Baru'),
//             ),
//           ),

//           ElevatedButton(onPressed: (){
//             controller.simpanKelasBaru();
//           }, child: Text('Simpan'),),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tambah_kelas_baru_controller.dart';

class TambahKelasBaruView extends GetView<TambahKelasBaruController> {
  const TambahKelasBaruView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kelas Baru'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masukan Kelas Baru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: controller.kelasBaruC,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Kelas',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.simpanKelasBaru();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
