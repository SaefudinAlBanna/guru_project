import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateKelasTahunAjaranController extends GetxController {
    RxBool isLoading = false.obs;
  RxBool isLoadingTambahKelas = false.obs;

  TextEditingController tahunAjaranC = TextEditingController();
  TextEditingController passAdminC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // CollectionReference siswaRef = FirebaseFirestore.instance.collection('siswa');
  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';

  late Future<QuerySnapshot<Map<String, dynamic>>> tampilkanSiswa;

  @override
  void onInit() {
    super.onInit();
    tampilkanSiswa = FirebaseFirestore.instance.collection('Sekolah').doc(idSekolah).collection('siswa').where('status', isEqualTo: 'baru').get();
  }

  Future<void> tambahkanKelasSiswa() async {
    if (passAdminC.text.isNotEmpty) {
      isLoadingTambahKelas.value = true;
      try {
        // if(idSekolah != null){

        // }
      } catch (e) {
        print(e);
      }
    }
  }
}
