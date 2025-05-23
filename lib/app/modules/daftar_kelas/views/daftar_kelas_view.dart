import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guru_project/app/routes/app_pages.dart';
import '../controllers/daftar_kelas_controller.dart';

class DaftarKelasView extends GetView<DaftarKelasController> {
  DaftarKelasView({super.key});

  // final data = Get.arguments;
  final dataxx = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // print('tampilkan $dataxx');
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas $dataxx'),
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
                    title: Text(snapshot.data!.docs[index].data()['namasiswa']),
                    subtitle: Text(snapshot.data!.docs[index].data()['kelas']),
                    leading: CircleAvatar(
                      child: Text(
                          snapshot.data!.docs[index].data()['namasiswa'][0]),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          tooltip: 'Info siswa',
                          icon: const Icon(Icons.info_outlined),
                          onPressed: () {
                            String getNama =
                                snapshot.data!.docs[index].data()['nisn'];
                            Get.toNamed(Routes.DETAIL_SISWA,
                                arguments: getNama);
                          },
                        ),
                        IconButton(
                          tooltip: 'Pemberian Nilai',
                          icon: const Icon(Icons.add_box_rounded),
                          onPressed: () {
                            // Get.toNamed(Routes.CONTOH, arguments: snapshot.data!.docs[index].data()['namasiswa']);
                            Get.dialog(AlertDialog(
                              title: Text('Fitur dalam pengembangan'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ));
                          },
                        ),
                        IconButton(
                          tooltip: 'Daftar Nilai',
                          icon: const Icon(Icons.book),
                          onPressed: () {
                            // String getNama = snapshot.data!.docs[index].data()['namasiswa'];
                            // Get.toNamed(Routes.DAFTAR_NILAI, arguments: getNama);
                            Get.dialog(AlertDialog(
                              title: Text('Fitur dalam pengembangan'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ));
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Belum ada siswa'),
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
