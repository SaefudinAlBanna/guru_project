import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guru_project/app/routes/app_pages.dart';
import '../controllers/daftar_kelas_controller.dart';

class DaftarKelasView extends GetView<DaftarKelasController> {
  DaftarKelasView({super.key});

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print('tampilkan $data');
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas $data'),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: controller.getDataKelas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.docs[index].data()['nama']),
                    subtitle: Text(snapshot.data!.docs[index].data()['kelas']),
                    leading: CircleAvatar(
                      child: Text(snapshot.data!.docs[index].data()['nama'][0]),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          tooltip: 'Detail Nilai',
                          icon: const Icon(Icons.info_outlined),
                          onPressed: () {
                            String getNama = snapshot.data!.docs[index].data()['nama'];
                            Get.toNamed(Routes.DETAIL_SISWA, arguments: getNama);
                          },
                        ),
                        IconButton(
                          tooltip: 'Pemberian Nilai',
                          icon: const Icon(Icons.add_box_rounded),
                          onPressed: () {
                            // Get.toNamed(Routes.PEMBERIAN_NILAI_SISWA, arguments: snapshot.data!.docs[index].data()['nama']);
                            Get.toNamed(Routes.CONTOH, arguments: snapshot.data!.docs[index].data()['nama']);
                          },
                        ),
                        IconButton(
                          tooltip: 'Daftar Nilai',
                          icon: const Icon(Icons.book),
                          onPressed: () {
                            String getNama = snapshot.data!.docs[index].data()['nama'];
                            Get.toNamed(Routes.DAFTAR_NILAI, arguments: getNama);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
