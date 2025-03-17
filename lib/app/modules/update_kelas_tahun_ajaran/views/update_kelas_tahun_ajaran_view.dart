import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: const Text('UpdateKelasTahunAjaranView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.tampilkanSiswa,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final List<DocumentChange<Map<String, dynamic>>> data =
                  snapshot.data!.docChanges;
              return Column(
                children: <Widget>[
                  TextField(
                    controller: controller.tahunAjaranC,
                    decoration: InputDecoration(label: Text('Masukan Tahun Ajaran Baru')),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].doc['nama']),
                        subtitle: Text(data[index].doc['nisn']),
                        trailing: IconButton(
                          onPressed: () {},
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
