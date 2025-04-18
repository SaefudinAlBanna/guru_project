import 'package:cloud_firestore/cloud_firestore.dart';
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
                    margin: EdgeInsets.only(top: 20),
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
                                      // Colors.blue.shade300,
                                      // Colors.blue.shade400,
                                      Colors.indigo.shade500,
                                      Colors.indigo.shade600,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'SD IT UKHUWAH ISLAMIYAH',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'alamat sekolah',
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
                                    SizedBox(height: 30),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Kelas guru yang diajar',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
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
                                                          // print('lemparan kelas $k');
                                                        },
                                                        child: Text(
                                                          k,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
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
                        // SizedBox(height: 15),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'MENU LAINYA',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Lihat semua  >",
                                          style: TextStyle(
                                              color: Colors.redAccent),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.defaultDialog(
                                              title: "Tampilkan 1",
                                              middleText: "isi Content",
                                            );
                                          },
                                          child: Container(
                                            width: Get.width * 0.7,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://picsum.photos/id/3/200/300"),
                                                  fit: BoxFit.cover),
                                            ),
                                            // child: Image.asset(
                                            //   "lib/assets/pictures/1.jpeg",
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            Get.defaultDialog(
                                              title: "Tampilkan 2",
                                              middleText: "isi Content",
                                            );
                                          },
                                          child: Container(
                                            width: Get.width * 0.7,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://picsum.photos/id/1/200/300"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            Get.defaultDialog(
                                              title: "Tampilkan 3",
                                              middleText: "isi Content",
                                            );
                                          },
                                          child: Container(
                                            width: Get.width * 0.7,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://picsum.photos/id/2/200/300"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text('Fase Kelompok ngaji'),
                                  SizedBox(height: 10),
                                  FutureBuilder<List<String>>(
                                      future: controller.getDataFase(),
                                      builder: (context, snapshotfase) {
                                        if (snapshotfase.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshotfase.hasData) {
                                          List<String> kelompokFase =
                                              snapshotfase.data as List<String>;
                                          return Row(
                                            children: kelompokFase.map((f) {
                                              return TextButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      Routes
                                                          .DAFTAR_FASE,
                                                      arguments: f);
                                                  // Get.toNamed(Routes.TAMBAH_SISWA_KELOMPOK, arguments: k);
                                                  // print('lemparan kelompok $k');
                                                },
                                                child: Text(
                                                  f,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      }),
                                  SizedBox(height: 10),
                                  Text('Daftar Kelompok ngaji'),
                                  SizedBox(height: 10),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        FutureBuilder(
                                            future:
                                                controller.getDataKelompok(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              } else if (snapshot.hasData) {
                                                List<String> kelompokPengampu =
                                                    snapshot.data
                                                        as List<String>;
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: kelompokPengampu
                                                        .map((k) {
                                                      return TextButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .DAFTAR_KELOMPOK_MENGAJI,
                                                              arguments: k);
                                                          // Get.toNamed(Routes.TAMBAH_SISWA_KELOMPOK, arguments: k);
                                                          // print('lemparan kelompok $k');
                                                        },
                                                        child: Text(
                                                          k,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
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
                                  ),
                                  Text(
                                    'PENGELOMPOKAN MENU (NANTI DI FILTER)',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 15),

                                  //ISI KOTAKAN MENU
                                  //===========================

                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Get.toNamed(
                                              Routes.TAMBAH_KELAS_BARU),
                                          child: ItemMenu(
                                            title: '(+) Kelas',
                                            icon: Icon(Icons.clean_hands_sharp,
                                                color: Colors.blueAccent,
                                                size: 40),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () => Get.toNamed(
                                              Routes.TAMBAH_TAHUN_AJARAN),
                                          child: ItemMenu(
                                            title: 'Ajaran',
                                            icon: Icon(
                                                Icons
                                                    .calendar_view_month_rounded,
                                                color: Colors.deepPurple,
                                                size: 40),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                Routes.BUAT_KELOMPOK_MENGAJI);
                                            // controller.buatKelompokMengaji();
                                          },
                                          child: ItemMenu(
                                            title: 'Kelompok',
                                            icon: Icon(Icons.favorite,
                                                color: Colors.red[800],
                                                size: 40),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                Routes.TAMBAH_KELOMPOK_MENGAJI);
                                            // controller.buatKelompokMengaji();
                                          },
                                          child: ItemMenu(
                                            title: '(+) Kelompok',
                                            icon: Icon(Icons.menu_book_sharp,
                                                color: Colors.teal[800],
                                                size: 40),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () =>
                                              Get.toNamed(Routes.TAMBAH_SISWA),
                                          child: ItemMenu(
                                            title: '(+) Siswa',
                                            icon: Icon(Icons.person, size: 40),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () => Get.toNamed(
                                              Routes.PEMBERIAN_KELAS_SISWA),
                                          child: ItemMenu(
                                            title: 'Beri Kelas',
                                            icon: Icon(Icons.grid_view_outlined,
                                                size: 40),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () => Get.toNamed(
                                              Routes.UPDATE_KELAS_TAHUN_AJARAN),
                                          child: ItemMenu(
                                            title: 'update Kelas',
                                            icon: Icon(Icons.update, size: 40),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () => Get.toNamed(
                                              Routes.DAFTAR_KELOMPOK_MENGAJI),
                                          child: ItemMenu(
                                            title: 'kelompok',
                                            icon: Icon(
                                                Icons.star_border_outlined,
                                                size: 40),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  // FutureBuilder<Object>(
                                  //     future: controller.getDataSemuaKelas(),
                                  //     builder: (context, snapshot) {
                                  //       if (snapshot.connectionState ==
                                  //           ConnectionState.waiting) {
                                  //         return CircularProgressIndicator();
                                  //       } else if (snapshot.hasData) {
                                  //         List<String> kelasAjarGuru =
                                  //             snapshot.data as List<String>;
                                  //         return SingleChildScrollView(
                                  //           scrollDirection: Axis.horizontal,
                                  //           child: Container(
                                  //             color: Colors.amber,
                                  //             child: Row(
                                  //               children:
                                  //                   kelasAjarGuru.map((k) {
                                  //                 return TextButton(
                                  //                   onPressed: () {
                                  //                     Get.toNamed(
                                  //                         Routes.DAFTAR_KELAS,
                                  //                         arguments: k);
                                  //                   },
                                  //                   child: Text(
                                  //                     k,
                                  //                     style: TextStyle(
                                  //                         color: Colors.black,
                                  //                         fontSize: 14,
                                  //                         fontWeight:
                                  //                             FontWeight.bold),
                                  //                   ),
                                  //                 );
                                  //               }).toList(),
                                  //             ),
                                  //           ),
                                  //         );
                                  //       } else {
                                  //         return SizedBox();
                                  //       }
                                  //     }),
                                  SizedBox(height: 30),
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/pictures/kelas.PNG'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
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

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          child: icon,
        ),
        SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
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
