import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_nilai_controller.dart';

class DaftarNilaiView extends GetView<DaftarNilaiController> {
  const DaftarNilaiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DaftarNilaiView'),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: controller.getDataNilai(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          }
          if(snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available'));
          }
          if(snapshot.hasData) {
            return ListView.builder(
              // itemCount: snapshot.data!.docs.length,
              itemCount: 6,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data!.docs[index].data()['kelasAjar'].toString()),
                  subtitle: Text(snapshot.data!.docs[index].data()['mataPelajaran'].toString()),
                  // subtitle: Text(snapshot.data!.docs[index].data()['nilai']),
                  // leading: CircleAvatar(
                  //   child: Text(snapshot.data!.docs[index].data()['nama'][0]),
                  // ),
                );
              },
            );
          }
          // Add your widget here based on the snapshot data
          return Center(child: Text('Data loaded'));
        },)
    );
  }
}
