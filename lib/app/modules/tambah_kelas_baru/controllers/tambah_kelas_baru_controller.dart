import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahKelasBaruController extends GetxController {
  TextEditingController kelasBaruC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> simpanKelasBaru() async {
    String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';
    //ambil uid penginput
    String uid = auth.currentUser!.uid;
    String emailPenginput = auth.currentUser!.email!;

    CollectionReference<Map<String, dynamic>> colKelas = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('kelas');
    QuerySnapshot<Map<String, dynamic>> snapshotKelas =
        await colKelas.get();
    List<Map<String, dynamic>> listKelas =
        snapshotKelas.docs.map((e) => e.data()).toList();

    // buat documen id buat tahun kelas
    String idKelas = kelasBaruC.text;

    if (listKelas.elementAt(0)['namakelas'] != kelasBaruC.text) {
      if (!listKelas
          .any((element) => element['namakelas'] == kelasBaruC.text)) {
        //belum input tahun kelas yang baru, maka bikin tahun kelas baru
        colKelas.doc(idKelas).set({
          'namakelas': kelasBaruC.text,
          'idpenginput': uid,
          'emailpenginput' : emailPenginput,
          'tanggalinput': DateTime.now().toString(),
          'idkelas' : idKelas,
        }).then(
          (value) =>
              Get.snackbar('Berhasil', 'Kelas Baru Berhasil Dibuat'),
        );
      } else {
        Get.snackbar('Gagal', 'Kelas Sudah Ada');
      } 
    }
  }
}
