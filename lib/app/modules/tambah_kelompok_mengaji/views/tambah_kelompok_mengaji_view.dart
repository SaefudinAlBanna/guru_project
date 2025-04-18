import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tambah_kelompok_mengaji_controller.dart';

class TambahKelompokMengajiView
    extends GetView<TambahKelompokMengajiController> {
  const TambahKelompokMengajiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tahun Ajaran : '),
                  FutureBuilder<String>(
                      future: controller.getTahunAjaranTerakhir(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
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
              SizedBox(height: 20),
              DropdownSearch<String>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Fase',
                  ),
                ),
                selectedItem: controller.faseC.text.isNotEmpty
                    ? controller.faseC.text
                    : null,
                items: (f, cs) => controller.getDataFase(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.faseC.text = value;
                  }
                },
                popupProps: PopupProps.menu(fit: FlexFit.tight),
              ),
              SizedBox(height: 20),
              DropdownSearch<String>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Pengampu',
                  ),
                ),
                selectedItem: controller.pengampuC.text.isNotEmpty
                    ? controller.pengampuC.text
                    : null,
                items: (f, cs) => controller.getDataPengampu(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.pengampuC.text = value;
                  }
                },
                popupProps: PopupProps.menu(fit: FlexFit.tight),
              ),
              SizedBox(height: 20),
              DropdownSearch<String>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Tempat',
                  ),
                ),
                selectedItem: controller.tempatC.text.isNotEmpty
                    ? controller.tempatC.text
                    : null,
                items: (f, cs) => controller.getDataTempat(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.tempatC.text = value;
                    // print('ini tampatC : $value');
                  }
                },
                popupProps: PopupProps.menu(fit: FlexFit.tight),
              ),
              SizedBox(height: 20),
              DropdownSearch<String>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'semester',
                  ),
                ),
                selectedItem: controller.semesterC.text.isNotEmpty
                    ? controller.semesterC.text
                    : null,
                items: (f, cs) => controller.getDataSemester(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.semesterC.text = value;
                    // print('ini tampatC : $value');
                  }
                },
                popupProps: PopupProps.menu(fit: FlexFit.tight),
              ),
              SizedBox(height: 30),
              // FutureBuilder<List<String>>(
              //   future: controller.getDataKelasYangAda(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator();
              //     } else if (snapshot.hasData) {
              //       List<String> kelasAjarGuru = snapshot.data!;
              //       return SingleChildScrollView(
              //         child: Row(
              //           children: kelasAjarGuru.map((k) {
              //             return TextButton(
              //               onPressed: () {
              //                 controller.kelasSiswaC.text = k;
              //                 if (controller.pengampuC.text.isEmpty) {
              //                   Get.snackbar(
              //                       'peringatan', 'pengampu tidak boleh kosong',
              //                       snackPosition: SnackPosition.BOTTOM,
              //                       backgroundColor: Colors.grey);
              //                 } else if (controller.tempatC.text.isEmpty) {
              //                   Get.snackbar(
              //                       'peringatan', 'tempat tidak boleh kosong',
              //                       snackPosition: SnackPosition.BOTTOM,
              //                       backgroundColor: Colors.grey);
              //                 } else if (controller.semesterC.text.isEmpty) {
              //                   Get.snackbar(
              //                       'peringatan', 'semester tidak boleh kosong',
              //                       snackPosition: SnackPosition.BOTTOM,
              //                       backgroundColor: Colors.grey);
              //                 } else {
              //                   //================================
              //                   Get.bottomSheet(
              //                     Container(
              //                       padding: EdgeInsets.symmetric(
              //                           horizontal: 30, vertical: 30),
              //                       color: Colors.white,
              //                       child: Center(
              //                         child: StreamBuilder<
              //                                 QuerySnapshot<
              //                                     Map<String, dynamic>>>(
              //                             stream: controller.getDataSiswaStream(),
              //                             builder: (context, snapshot) {
              //                               if (snapshot.connectionState ==
              //                                   ConnectionState.waiting) {
              //                                 return CircularProgressIndicator();
              //                               } else if (snapshot.hasData) {
              //                                 // print('ini snapshotnya : ${snapshot.data!.docs}');
              //                                 return ListView.builder(
              //                                   itemCount:
              //                                       snapshot.data!.docs.length,
              //                                   itemBuilder: (context, index) {
              //                                     String namaSiswa = snapshot
              //                                             .data!.docs[index]
              //                                             .data()['namasiswa'] ??
              //                                         'No Name';
              //                                     String nisnSiswa = snapshot
              //                                             .data!.docs[index]
              //                                             .data()['nisn'] ??
              //                                         'No NISN';
              //                                     return ListTile(
              //                                       title: Text(snapshot
              //                                           .data!.docs[index]
              //                                           .data()['namasiswa']),
              //                                       subtitle: Text(snapshot
              //                                           .data!.docs[index]
              //                                           .data()['kelas']),
              //                                       leading: CircleAvatar(
              //                                         child: Text(snapshot
              //                                                 .data!.docs[index]
              //                                                 .data()['namasiswa']
              //                                             [0]),
              //                                       ),
              //                                       trailing: Row(
              //                                         mainAxisSize:
              //                                             MainAxisSize.min,
              //                                         children: <Widget>[
              //                                           IconButton(
              //                                             tooltip: 'Detail Nilai',
              //                                             icon: const Icon(Icons
              //                                                 .info_outlined),
              //                                             onPressed: () {
              //                                               controller
              //                                                   .tambahkanKelompokSiswa(
              //                                                       namaSiswa,
              //                                                       nisnSiswa);
              //                                               //  controller.tampilSiswaKelompok();
          
              //                                               // Get.back();
              //                                               controller
              //                                                   .tampilSiswaKelompok
              //                                                   .call();
          
              //                                               // controller.tampilSiswaKelompok();
              //                                             },
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     );
              //                                   },
              //                                 );
              //                               } else {
              //                                 return Center(
              //                                   child: Text('No data available'),
              //                                 );
              //                               }
              //                             }),
              //                       ),
              //                     ),
              //                   );
              //                 }
              //               },
              //               child: Text(k),
              //             );
              //           }).toList(),
              //         ),
              //       );
              //     } else {
              //       return SizedBox();
              //     }
              //   },
              // ),
          
              //====================================================
              Divider(height: 3),
              // Disable elevatedbutton ketika database belum terbuat
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    if(controller.faseC.text.isEmpty){
                      Get.snackbar('Peringatan', 'Fase kosong');
                    } else if(controller.pengampuC.text.isEmpty){
                      Get.snackbar('Peringatan', 'Pengampu kosong');
                    } else if(controller.tempatC.text.isEmpty){
                      Get.snackbar('Peringatan', 'Tempat kosong');
                    } else if (controller.semesterC.text.isEmpty){
                      Get.snackbar('Peringatan', 'Semester kosong');
                    } else {
                    controller.buatKelompok();
                    }
                  },
                  child: Text('Buat Kelompok')),

                  ElevatedButton(onPressed: () => controller.test(), child: Text('test')),
          
              // Expanded(
              //   child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              //       stream: controller.tampilSiswaKelompok(),
              //       builder: (context, snapshotKelompok) {
              //         print('ini snapkelompok : ${snapshotKelompok.data?.docs}');
              //         if (snapshotKelompok.connectionState ==
              //             ConnectionState.waiting) {
              //           return Center(
              //             child: CircularProgressIndicator(),
              //           );
              //           } if(snapshotKelompok.data?.docs.length == 0 || snapshotKelompok.data == null) {
              //         // }
              //         // if (snapshotKelompok.data!.docs.isEmpty ||
              //         //     snapshotKelompok.data == null) {
              //           return Center(
              //             child: Text('Belum ada dataNya'),
              //           );
              //         }
              //         // else {
              //         return ListView.builder(
              //           itemCount: snapshotKelompok.data!.docs.length,
              //           itemBuilder: (context, index) {
              //             String namaSiswa = snapshotKelompok.data!.docs[index]
              //                     .data()['namasiswa'] ??
              //                 'No Name';
              //             String kelasSiswa = snapshotKelompok.data!.docs[index]
              //                     .data()['kelas'] ??
              //                 'No KELAS';
              //             return ListTile(
              //               title: Text(namaSiswa),
              //               subtitle: Text(kelasSiswa),
              //               trailing: IconButton(
              //                 onPressed: () {},
              //                 icon: Icon(Icons.save_outlined),
              //               ),
              //             );
              //           },
              //         );
              //         // }
              //       }),
              // ),
            ],
          ),
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Tambah Kelompok Mengaji'),
      backgroundColor: Colors.indigo[400],
      elevation: 0,
    );
  }
}
