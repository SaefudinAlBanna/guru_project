import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../controllers/daftar_nilai_controller.dart';

class DaftarNilaiView extends GetView<DaftarNilaiController> {
  const DaftarNilaiView({super.key});

  // PERCOBAAN PENGAMBILAN LIST MANUAL
  // final List<String> myList = ['1A', '1B', '2A', '2B'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.userStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              Map<String, dynamic> user = snapshot.data!.data()!;
              String defaultImage =
                  "https://ui-avatars.com/api/?name=${user['nama']}";

              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  // padding: EdgeInsets.all(15),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Container(
                            width: 75,
                            height: 75,
                            color: Colors.grey[300],
                            child: Image.network(
                              user['profile'] ?? defaultImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Siswa',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Kelas'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Ustadz/ah : ${user['nama']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('Tgk/Jilid'),
                          Text('Tempat'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'DAFTAR NILAI',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: ()=> Get.toNamed(Routes.DETAIL_NILAI),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('pertemuan ke ${index + 1}'),
                                    Divider(height: 1),
                                    SizedBox(height: 10),
                                    Text(DateFormat('dd.MM.yyyy')
                                        .format(DateTime.now())),
                                    Text('Data Hafalan'),
                                    Text('Materi'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text('Data Tidak Ditemukan'),
              );
            }
          }),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    title: const Text('Daftar Nilai'),
    backgroundColor: Colors.indigo[400],
    elevation: 0,
  );
}
