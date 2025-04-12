import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:guru_project/app/routes/app_pages.dart';

import '../controllers/tambah_siswa_kelompok_controller.dart';

final dataxx = Get.arguments;

class TambahSiswaKelompokView extends GetView<TambahSiswaKelompokController> {
  const TambahSiswaKelompokView({super.key});

  @override
  Widget build(BuildContext context) {
    print('tampilkan $dataxx');
    return Scaffold(
        appBar: AppBar(
          title: const Text('TambahSiswaKelompokView'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tahun Ajaran :'),
                // Text('get tahun ajaran terakhir'),
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
            // Text('Get Semesternya'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<String>(
                    future: controller.getDataSemester(),
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
            SizedBox(height: 15),
            Divider(height: 3),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('nama pengampu'),
                    SizedBox(height: 10),
                    Text('nama tempat'),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<String>(
                      future: controller.getPengampu(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error');
                        } else {
                          return Text(snapshot.data ?? 'No Data');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder<String>(
                      future: controller.getDataTempat(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error');
                        } else {
                          return Text(snapshot.data ?? 'No Data');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),

            //===========================================
            FutureBuilder<List<String>>(
              future: controller.getDataKelasYangAda(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  List<String> kelasAjarGuru = snapshot.data!;
                  return SingleChildScrollView(
                    child: Row(
                      children: kelasAjarGuru.map((k) {
                        return TextButton(
                          onPressed: () {
                            controller.kelasSiswaC.text = k;
                            Get.bottomSheet(
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 30),
                                color: Colors.white,
                                child: Center(
                                  child: StreamBuilder<
                                          QuerySnapshot<
                                              Map<String, dynamic>>>(
                                      stream: controller.getDataSiswaStream(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasData) {
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
                                                          .data()['namasiswa']
                                                      [0]),
                                                ),
                                                trailing: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    IconButton(
                                                      tooltip: 'Detail Nilai',
                                                      icon: const Icon(Icons
                                                          .info_outlined),
                                                      onPressed: () {
                                                        controller
                                                            .tambahkanKelompokSiswa(
                                                                namaSiswa,
                                                                nisnSiswa);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return Center(
                                            child: Text('No data available'),
                                          );
                                        }
                                      }),
                                ),
                              ),
                            );
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
            //============================================
            // ElevatedButton(onPressed: ()=>controller.getPengampu(), child: Text('test')),
            SizedBox(height: 30),
            FutureBuilder(
                future: controller.getDataKelompokYangDiajar(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    List<String> kelasAjarGuru = snapshot.data as List<String>;
                    return SingleChildScrollView(
                      child: Row(
                        children: kelasAjarGuru.map((k) {
                          return TextButton(
                            onPressed: () {},
                            child: Text(
                              k,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
            SizedBox(height: 15),
            Divider(height: 3),
            SizedBox(height: 15),
            //=======================================================
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.tampilSiswaKelompok(),
                  builder: (context, snapshotKelompok) {
                    if (snapshotKelompok.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // ignore: prefer_is_empty
                    if(snapshotKelompok.data?.docs.length == 0 || snapshotKelompok.data == null) {
                      return Center(
                        child: Text('Silahkan pilih siswa kelompok di halaman sebelumnya'),
                      );
                    }
                    // else {
                    return ListView.builder(
                      itemCount: snapshotKelompok.data!.docs.length,
                      itemBuilder: (context, index) {
                        String namaSiswa = snapshotKelompok.data!.docs[index]
                                .data()['namasiswa'] ??
                            'No Name';
                        String kelasSiswa = snapshotKelompok.data!.docs[index]
                                .data()['kelas'] ??
                            'No KELAS';
                        return ListTile(
                          title: Text(namaSiswa),
                          subtitle: Text(kelasSiswa),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.save_outlined),
                          ),
                        );
                      },
                    );
                    // }
                  }),
            ),
            //=======================================================
            FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  Get.toNamed(Routes.TAMBAH_KELOMPOK_MENGAJI);
                },
                child: Text('kembali'))
          ],
        ));
  }
}
