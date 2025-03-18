import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class Contoh extends GetView<HomeController> {
  const Contoh({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.userStreamBaru(),
        // stream: null,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data!.data()!;
            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    data['nama'].toString().toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: Colors.indigo[400],
                leading: Container(
                  height: 85,
                  width: 85,
                  margin: EdgeInsets.only(left: 15, top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[350],
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://ui-avatars.com/api/?name=${data['nama']}")),
                  ),
                ),
                actions: [
                  if (snapshot.connectionState == ConnectionState.waiting)
                    // SizedBox()
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  else if (snapshot.data!.data()!['role'] == 'admin')
                    IconButton(
                      onPressed: () => Get.toNamed(Routes.TAMBAH_PEGAWAI),
                      icon: Icon(Icons.admin_panel_settings_outlined),
                    )
                  else
                    SizedBox(),
                  Obx(
                    () => ElevatedButton(
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          controller.isLoading.value = true;
                          await FirebaseAuth.instance.signOut();
                          controller.isLoading.value = false;
                          Get.offAllNamed(Routes.LOGIN);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo[400]),
                      child: controller.isLoading.isFalse
                          ? Icon(Icons.logout_outlined, color: Colors.black)
                          : CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  ClipPath(
                    clipper: ClassClipPathTop(),
                    child: Container(
                      height: 250,
                      width: Get.width,
                      color: Colors.indigo[400],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ClipPath(
                              clipper: ClipPathClass(),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                height: 215,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      // Colors.blue.shade200,
                                      // Colors.blue.shade400
                                      Colors.green,
                                      Colors.green.shade400,
                                      Colors.blue.shade400,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '07:00:02',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Masuk',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: IconButton(
                                              icon: Icon(Icons.alarm, size: 45),
                                              onPressed: () {
                                                Get.toNamed(Routes.CONTOH);
                                              }),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '14:10:02',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Pulang',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Divider(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 5),
                                    Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 33,
                                            width: 230,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.amber,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Durasi Kerja : 00.00.00 Jam',
                                              ),
                                            ),
                                          ),
                                        ),
                                        FutureBuilder(
                                            future: controller
                                                .getDataKelasYangDiajar(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasData) {
                                                List<String> kelasAjarGuru =
                                                    snapshot.data
                                                        as List<String>;
                                                // print(kelasAjarGuru);
                                                return SingleChildScrollView(
                                                  child: Row(
                                                    children:
                                                        kelasAjarGuru.map((k) {
                                                      return TextButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .DAFTAR_KELAS,
                                                              arguments: k);
                                                        },
                                                        child: Text(k),
                                                      );
                                                    }).toList(),
                                                  ),
                                                );
                                              } else {
                                                return SizedBox();
                                              }
                                            }),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(height: 25),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            children: [
                              Column(
                                children: [
                                  Text('Berita Harian'),
                                  Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 15),
                                  FutureBuilder<Object>(
                                      future: controller.getDataSemuaKelas(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasData) {
                                          List<String> kelasAjarGuru =
                                              snapshot.data as List<String>;
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Container(
                                              color: Colors.amber,
                                              child: Row(
                                                children:
                                                    kelasAjarGuru.map((k) {
                                                  return TextButton(
                                                    onPressed: () {
                                                      Get.toNamed(Routes.DAFTAR_KELAS, arguments: k);
                                                      // print(k);
                                                    },
                                                    child: Text(
                                                      k,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      }),
                                  // DropdownSearch<String>(
                                  //   decoratorProps: DropDownDecoratorProps(
                                  //     decoration: InputDecoration(
                                  //       border: UnderlineInputBorder(),
                                  //       filled: true,
                                  //       prefixText: 'surat: ',
                                  //     ),
                                  //   ),
                                  //   // selectedItem: controller.kelasSiswaController.text,
                                  //   items: (f, cs) => controller.getDataKelas(),
                                  //   onChanged: (String? value) {
                                  //     // controller.kelasSiswaController.text = value!;
                                  //     // print(value);
                                  //   },
                                  //   popupProps: PopupProps.menu(
                                  //       // disabledItemFn: (item) => item == '1A',
                                  //       fit: FlexFit.tight),
                                  // ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.TAMBAH_KELAS_BARU),
                                    child: Text('Tambah kelas baru'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.TAMBAH_TAHUN_AJARAN),
                                    child: Text('Tambah Tahun Ajaran'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.toNamed(
                                        Routes.TAMBAH_KELOMPOK_MENGAJI),
                                    child: Text('Tambah Kelompok'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.TAMBAH_SISWA),
                                    child: Text('Tambah Siswa'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.toNamed(
                                        Routes.PEMBERIAN_KELAS_SISWA),
                                    child: Text('pemberian kelas TA'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.toNamed(
                                        Routes.DAFTAR_KELAS_SEMUA_SISWA),
                                    child: Text('Daftar siswa per kelas'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.toNamed(
                                        Routes.UPDATE_KELAS_TAHUN_AJARAN),
                                    child: Text('update kelas TA'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('Data Kosong');
          }
        });
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(size.width, size.height - 50);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class ClassClipPathTop extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
