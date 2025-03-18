import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahKelompokMengajiController extends GetxController {
  
  TextEditingController idPegawaiC = TextEditingController();
  TextEditingController waliKelasSiswaC = TextEditingController();
  TextEditingController kelasSiswaC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idUser = FirebaseAuth.instance.currentUser!.uid;
  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';
  String emailAdmin = FirebaseAuth.instance.currentUser!.email!;

  //pengambilan tahun ajaran terakhir
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

  // ambil data namakelas
  Future<List<String>> getDataKelas() async {
    List<String> kelasList = [];
    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('kelas')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        kelasList.add(docSnapshot.id);
      }
    });
    return kelasList;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> tampilSiswa() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    return firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('kelastahunajaran')
        .doc(kelasSiswaC.text)
        .get();
  }
}
