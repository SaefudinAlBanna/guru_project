import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarKelompokMengajiController extends GetxController {
  TextEditingController pengampuC = TextEditingController();
  TextEditingController semesterC = TextEditingController();
  TextEditingController idpengampuC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';

  Future<List<String>> getDataWaliKelas() async {
    List<String> walikelasList = [];
    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot
          in querySnapshot.docs.where((doc) => doc['role'] == 'admin')) {
        walikelasList.add(docSnapshot.data()['alias']);
        // walikelasList.add(docSnapshot.data()['nip']);
      }
    });
    return walikelasList;
  }

  Future<void> getIdWaliKelas() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .where('alias', isEqualTo: pengampuC.text)
        .get();
    String uidWaliKelasnya = querySnapshot.docs.first.data()['uid'];

    idpengampuC.text == uidWaliKelasnya;
  }

  List<String> getDataSemester() {
    List<String> temaptList = [
      'semester1',
      'semester2',
    ];
    return temaptList;
  }

  Future<String> getTahunAjaranTerakhir() async {
    CollectionReference<Map<String, dynamic>> colTahunAjaran = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran');
    QuerySnapshot<Map<String, dynamic>> snapshotTahunAjaran =
        await colTahunAjaran.get();
    List<Map<String, dynamic>> listTahunAjaran =
        snapshotTahunAjaran.docs.map((e) => e.data()).toList();
    String tahunAjaranTerakhir =
        listTahunAjaran.map((e) => e['namatahunajaran']).toList().last;
    return tahunAjaranTerakhir;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> tampilSiswaX() {
    
      return firestore
          .collection('Sekolah')
          .doc(idSekolah)
          .collection('pegawai')
          .doc('yfUA9O2zHXraisPFAiks')
          .collection('tahunajarankelompok')
          .doc('2024-2025')
          .collection('kelompokmengaji')
          .doc('uts. contoh')
          .collection('siswanya')
          .where('status', isNotEqualTo: 'aktif1')
          .snapshots();

      // return firestore
      //   .collection('Sekolah')
      //   .doc(idSekolah)
      //   .collection('siswa')
      //   .where('status', isNotEqualTo: 'aktif')
      //   .snapshots();
    
    }

  // Stream<QuerySnapshot<Map<String, dynamic>>> tampilSiswa() async {
  //   String tahunajaranya = await getTahunAjaranTerakhir();
  //   String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
  //       .collection('Sekolah')
  //       .doc(idSekolah)
  //       .collection('pegawai')
  //       .where('alias', isEqualTo: pengampuC.text)
  //       .get();
  //   String uidWaliKelasnya = querySnapshot.docs.first.data()['uid'];

  //   return firestore
  //       .collection('Sekolah')
  //       .doc(idSekolah)
  //       .collection('pegawai')
  //       .doc(uidWaliKelasnya)
  //       .collection('tahunajarankelompok')
  //       .doc(idTahunAjaran)
  //       .collection('kelompokmengaji')
  //       .doc(pengampuC.text)
  //       .collection('siswanya')
  //       .get();
  // }
}
