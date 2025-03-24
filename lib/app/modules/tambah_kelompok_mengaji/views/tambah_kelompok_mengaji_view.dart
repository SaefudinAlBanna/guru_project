import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:guru_project/app/routes/app_pages.dart';
import '../controllers/tambah_kelompok_mengaji_controller.dart';

class TambahKelompokMengajiView
    extends GetView<TambahKelompokMengajiController> {
  const TambahKelompokMengajiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tahun Ajaran: '),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          DropdownSearch<String>(
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                labelText: 'Pengampu',
              ),
            ),
            selectedItem: controller.idPegawaiC.text.isNotEmpty
                ? controller.idPegawaiC.text
                : null,
            items: (f, cs) => controller.getDataPengampu(),
            onChanged: (String? value) {
              if (value != null) {
                controller.pengampuC.text = value;
                // controller.idPegawaiC.text = value;
                
              }
            },
            popupProps: PopupProps.menu(fit: FlexFit.tight),
          ),
          SizedBox(height: 10),
          DropdownSearch<String>(
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
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
          SizedBox(height: 10),
          DropdownSearch<String>(
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
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
          SizedBox(height: 20),
          // ElevatedButton(onPressed: ()=> controller.testIsiSemester(), child: Text('test')),
          SizedBox(height: 20),
          FutureBuilder<List<String>>(
            future: controller.getDataKelasYangAda(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                List<String> kelasAjarGuru = snapshot.data!;
                // if(controller.pengampuC.text.isEmpty){
                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     Get.snackbar('peringatan', 'pengampu tidak boleh kosong');
                //   });
                //   return SizedBox();
                // }
                return SingleChildScrollView(
                  child: Row(
                    children: kelasAjarGuru.map((k) {
                      return TextButton(
                        onPressed: () {
                          controller.kelasSiswaC.text = k;
                          if (controller.pengampuC.text.isEmpty) {
                            Get.snackbar(
                                'peringatan', 'pengampu tidak boleh kosong',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.grey);
                          } else if (controller.tempatC.text.isEmpty) {
                            Get.snackbar(
                                'peringatan', 'tempat tidak boleh kosong',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.grey);
                          } else if (controller.semesterC.text.isEmpty) {
                            Get.snackbar(
                                'peringatan', 'semester tidak boleh kosong',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.grey);
                          } else {
                            Get.bottomSheet(
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 30),
                                color: Colors.white,
                                child: Center(
                                  child: FutureBuilder<
                                          QuerySnapshot<Map<String, dynamic>>>(
                                      future: controller.getDataSiswa(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (!snapshot.hasData ||
                                            snapshot.data!.docs.isEmpty) {
                                          return Center(
                                              child: Text('No Data..!!!'));
                                        } else {
                                          return ListView.builder(
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              String namaSiswa = snapshot
                                                      .data!.docs[index]
                                                      .data()['namasiswa'] ??
                                                  'No Name';
                                              String nisnSiswa = snapshot
                                                      .data!.docs[index]
                                                      .data()['nisn'] ??
                                                  'No NISN';
                                              return ListTile(
                                                title: Text(snapshot
                                                    .data!.docs[index]
                                                    .data()['namasiswa']),
                                                subtitle: Text(snapshot
                                                    .data!.docs[index]
                                                    .data()['kelas']),
                                                leading: CircleAvatar(
                                                  child: Text(snapshot
                                                      .data!.docs[index]
                                                      .data()['namasiswa'][0]),
                                                ),
                                                trailing: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    IconButton(
                                                      tooltip: 'Detail Nilai',
                                                      icon: const Icon(
                                                          Icons.info_outlined),
                                                      onPressed: () {
                                                        // String getNama = snapshot.data!.docs[index].data()['namasiswa'];
                                                        // Get.toNamed(Routes.DETAIL_SISWA, arguments: getNama);

                                                        controller
                                                            .tambahkanKelompokSiswa(
                                                                namaSiswa,
                                                                nisnSiswa);
                                                        Get.back();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }),
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(k),
                      );
                    }).toList(),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
          SizedBox(height: 50),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: controller.tampilSiswaKelompok(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No Data..!!!'));
              } else {
                var siswaList =
                    snapshot.data!.docs.map((doc) => doc.data()).toList();
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: siswaList.length,
                  itemBuilder: (context, index) {
                    var siswa = siswaList[index];
                    return ListTile(
                      title: Text(siswa['namasiswa']),
                      subtitle: Text('Kelas: ${siswa['kelas']}'),
                      trailing: IconButton(
                        onPressed: () {
                          // Add delete functionality here
                        },
                        icon: Icon(Icons.delete_rounded),
                      ),
                    );
                  },
                );
              }
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Tambah Kelompok Mengaji'),
      backgroundColor: Colors.indigo[400],
      elevation: 0,
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/tambah_kelompok_mengaji_controller.dart';

// class TambahKelompokMengajiView extends GetView<TambahKelompokMengajiController> {
//   const TambahKelompokMengajiView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             _buildTahunAjaranSection(),
//             const SizedBox(height: 20),
//             _buildDropdownSection(),
//             const SizedBox(height: 20),
//             _buildKelasButtons(),
//             const SizedBox(height: 20),
//             Expanded(child: _buildSiswaList()),
//           ],
//         ),
//       ),
//     );
//   }

//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       title: const Text('Tambah Kelompok Mengaji'),
//       backgroundColor: Colors.indigo[400],
//       elevation: 0,
//     );
//   }

//   Widget _buildTahunAjaranSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text('Tahun Ajaran: '),
//         FutureBuilder<String>(
//           future: controller.getTahunAjaranTerakhir(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return const Text('Error');
//             } else {
//               return Text(
//                 snapshot.data ?? 'No Data',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildDropdownSection() {
//     return Column(
//       children: [
//         _buildDropdown(
//           label: 'Pengampu',
//           selectedItem: controller.idPegawaiC.text,
//           items: controller.getDataWaliKelas,
//           onChanged: (value) {
//             if (value != null) {
//               controller.waliKelasSiswaC.text = value;
//               controller.idPegawaiC.text = value;
//             }
//           },
//         ),
//         const SizedBox(height: 10),
//         _buildDropdown(
//           label: 'Tempat',
//           selectedItem: controller.tempatC.text,
//           items: () async => controller.getDataTempat(),
//           onChanged: (value) {
//             if (value != null) {
//               controller.tempatC.text = value;
//               print('ini tempatC : $value');
//             }
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildDropdown({
//     required String label,
//     required String selectedItem,
//     required Future<List<String>> Function() items,
//     required void Function(String?) onChanged,
//   }) {
//     return DropdownSearch<String>(
//       decoratorProps: DropDownDecoratorProps(
//         decoration: InputDecoration(
//           border: const UnderlineInputBorder(),
//           filled: true,
//           labelText: label,
//         ),
//       ),
//       selectedItem: selectedItem.isNotEmpty ? selectedItem : null,
//       items: (filter, limit) => items(),
//       onChanged: onChanged,
//       popupProps: const PopupProps.menu(fit: FlexFit.tight),
//     );
//   }

//   Widget _buildKelasButtons() {
//     return FutureBuilder<List<String>>(
//       future: controller.getDataKelasYangAda(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         } else if (snapshot.hasData) {
//           return SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: snapshot.data!.map((kelas) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       controller.kelasSiswaC.text = kelas;
//                       controller.tampilSiswa();
//                     },
//                     child: Text(kelas),
//                   ),
//                 );
//               }).toList(),
//             ),
//           );
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//   }

//   Widget _buildSiswaList() {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: controller.tampilSiswa(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return const Center(child: Text('No Data'));
//         } else {
//           var siswaList = snapshot.data!.docs.map((doc) => doc.data()).toList();
//           return ListView.builder(
//             itemCount: siswaList.length,
//             itemBuilder: (context, index) {
//               var siswa = siswaList[index];
//               return ListTile(
//                 title: Text(siswa['namasiswa']),
//                 subtitle: Text('Kelas: ${siswa['kelas']}'),
//                 trailing: IconButton(
//                   onPressed: () {
//                     // TODO: Implement delete functionality
//                   },
//                   icon: const Icon(Icons.delete_rounded),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
