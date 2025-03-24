import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_kelompok_mengaji_controller.dart';

class DaftarKelompokMengajiView
    extends GetView<DaftarKelompokMengajiController> {
  const DaftarKelompokMengajiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('kelompok mengaji / pengampu'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  DropdownSearch<String>(
                    decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        prefixText: 'Wali kelas : ',
                      ),
                    ),
                    // selectedItem: controller.kelasSiswaC.text,
                    selectedItem: controller.pengampuC.text,
                    items: (f, cs) => controller.getDataWaliKelas(),
                    onChanged: (String? value) {
                      controller.pengampuC.text = value!;
                      // print(value);
                      // print(controller.idPegawaiC.text);
                    },
                    popupProps: PopupProps.menu(
                        // disabledItemFn: (item) => item == '1A',
                        fit: FlexFit.tight),
                  ),
                  SizedBox(height: 15),
                  DropdownSearch<String>(
                    decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        prefixText: 'semester : ',
                      ),
                    ),
                    selectedItem: controller.semesterC.text,
                    items: (f, cs) => controller.getDataSemester(),
                    onChanged: (String? value) {
                      controller.semesterC.text = value!;
                      // print('pengampu : ${controller.pengampuC.text}');
                    },
                    popupProps: PopupProps.menu(
                        // disabledItemFn: (item) => item == '1A',
                        fit: FlexFit.tight),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: ()=> Get.bottomSheet(
              TextButton(onPressed: (){}, child: Text('data')),
            ), child: Text('data')),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.tampilSiswaX(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.active){
               final List<DocumentSnapshot<Map<String, dynamic>>> data =
                  snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          String namaSiswa = data[index].data()?['namasiswa'] ?? 'No Name';
                          String kelasSiswa = data[index].data()?['kelas'] ?? 'No Kelas';
                          return ListTile(
                            // title: Text(snapshot.data!.docs[index].data()['namasiswa']),
                            // subtitle: Text(snapshot.data!.docs[index].data()['kelas']),
                            title: Text(namaSiswa),
                            subtitle: Text(kelasSiswa),
                            leading: CircleAvatar(
                              child: Text(data[index]
                                  .data()?['namasiswa']?[0] ?? 'N'),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  tooltip: 'Detail Nilai',
                                  icon: const Icon(Icons.info_outlined),
                                  onPressed: () {
                                    // String getNama = snapshot.data!.docs[index].data()['namasiswa'];
                                    // Get.toNamed(Routes.DETAIL_SISWA, arguments: getNama);
                                  },
                                ),
                                IconButton(
                                  tooltip: 'Pemberian Nilai',
                                  icon: const Icon(Icons.add_box_rounded),
                                  onPressed: () {
                                    // Get.toNamed(Routes.PEMBERIAN_NILAI_SISWA, arguments: snapshot.data!.docs[index].data()['nama']);
                                    // Get.toNamed(Routes.CONTOH, arguments: snapshot.data!.docs[index].data()['namasiswa']);
                                  },
                                ),
                                IconButton(
                                  tooltip: 'Daftar Nilai',
                                  icon: const Icon(Icons.book),
                                  onPressed: () {
                                    // String getNama = snapshot.data!.docs[index].data()['namasiswa'];
                                    // Get.toNamed(Routes.DAFTAR_NILAI, arguments: getNama);
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
                },
              ),
            ),
          ],
        ));
  }
}
