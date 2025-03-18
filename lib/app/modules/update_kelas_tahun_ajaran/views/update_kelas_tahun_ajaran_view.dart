import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_kelas_tahun_ajaran_controller.dart';

class UpdateKelasTahunAjaranView
    extends GetView<UpdateKelasTahunAjaranController> {
  const UpdateKelasTahunAjaranView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPDATE KELAS'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.tampilSiswa(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // if (snapshot.hasData) {
            //   final List<DocumentChange<Map<String, dynamic>>> data =
            //       snapshot.data!.docChanges;
            if (snapshot.connectionState == ConnectionState.active) {
              final List<DocumentSnapshot<Map<String, dynamic>>> data =
                  snapshot.data!.docs;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tahun Ajaran : '),
                      FutureBuilder<String>(
                          future: controller.getTahunAjaranTerakhir(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error');
                            } else {
                              return Text(
                                snapshot.data ?? 'No Data',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              );
                            }
                          }),
                    ],
                  ),
                  DropdownSearch<String>(
                    decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        prefixText: 'Wali kelas : ',
                      ),
                    ),
                    // selectedItem: controller.kelasSiswaC.text,
                    selectedItem: controller.idPegawaiC.text,
                    items: (f, cs) => controller.getDataWaliKelas(),
                    onChanged: (String? value) {
                      controller.waliKelasSiswaC.text = value!;
                      controller.idPegawaiC.text = value;
                      // print(value);
                      // print(controller.idPegawaiC.text);
                    },
                    popupProps: PopupProps.menu(
                        // disabledItemFn: (item) => item == '1A',
                        fit: FlexFit.tight),
                  ),
                  SizedBox(height: 10),
                  DropdownSearch<String>(
                    decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        prefixText: 'kelas : ',
                      ),
                    ),
                    selectedItem: controller.kelasSiswaC.text,
                    items: (f, cs) => controller.getDataKelas(),
                    onChanged: (String? value) {
                      controller.kelasSiswaC.text = value!;
                    },
                    popupProps: PopupProps.menu(
                        // disabledItemFn: (item) => item == '1A',
                        fit: FlexFit.tight),
                  ),
                  SizedBox(height: 10),

                  //*************************
                  // RaisedButton(
                  //   onPressed: () {
                  //     controller.updateKelasTahunAjaran();
                  //     Get.back();
                  //   },
                  //   child: Text('Update Kelas'),
                  // ),
                  // */
                  ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        // type: DialogType.confirmation,
                        title: 'Konfirmasi Update Kelas',
                        middleText: 'Anda yakin ingin mengupdate kelas siswa?',
                        onConfirm: () {
                          // controller.updateKelasTahunAjaran();
                          Get.back(); // back di halaman update kelas
                        },
                        onCancel: () {
                          Get.back(); // back ke home
                        },
                      );
                    },
                    child: Text('Update Kelas Semua Siswa'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      String namaSiswa =
                          data[index].data()?['nama'] ?? 'No Name';
                      String nisnSiswa =
                          data[index].data()?['nisn'] ?? 'No NISN';
                      return ListTile(
                        title: Text(namaSiswa),
                        subtitle: Text(nisnSiswa),
                        trailing: IconButton(
                          onPressed: () {
                            controller.tambahkanKelasSiswa(
                                namaSiswa, nisnSiswa);
                            // controller.updateStatusSiswa(nisnSiswa);
                            // controller.ubahStatusSiswa(nisnSiswa);

                            controller.getDataKelas().then((kelas) {
                              for (var k in kelas) {
                                print(k);
                              }
                            });
                          },
                          icon: Icon(Icons.save_outlined),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return Center(
              child: Text('No data available'),
            );
          }),
    );
  }
}
