import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../widgets/home_widget.dart';
import '../widgets/contoh.dart';
import '../widgets/profile_widget.dart';

class HomeController extends GetxController {
  RxInt indexWidget = 0.obs;
  RxBool isLoading = false.obs;

  TextEditingController nipC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController jabatanC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idUser = FirebaseAuth.instance.currentUser!.uid;
  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';

  // REGION LAMA

  Stream<DocumentSnapshot<Map<String, dynamic>>> userStream() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection('Pegawai').doc(uid).snapshots();
  }

  //percobaan menampilkan contoh collection
  Stream<DocumentSnapshot<Map<String, dynamic>>> getProfile() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection('Pegawai').doc(uid).snapshots();
  }

  void changeIndex(int index) {
    indexWidget.value = index;
  }

  void signOut() async {
    isLoading.value = true;
    await auth.signOut();
    isLoading.value = false;
    Get.offAllNamed('/login');
  }

  // ini adalah list widget yang akan di tampilkan pada halaman home
  final List<Widget> myWidgets = [
    Contoh(),
    // HomeWidget(),
    Center(
      child: Text(
        'ABSEN',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    ProfileWidget(),
  ];

  // void updateProfile() async {
  Future<void> updateProfile() async {
    isLoading.value = true;
    String uid = auth.currentUser!.uid;

    await firestore.collection('Pegawai').doc(uid).update({
      'nip': nipC.text,
      'nama': namaC.text,
      'email': emailC.text,
      'noHp': noHpC.text,
      'alamat': alamatC.text,
      'jabatan': jabatanC.text,
    });

    isLoading.value = false;
    Get.snackbar(
      'Berhasil',
      'Data berhasil diupdate',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // END REGION LAMA

  //============================

  // REGION BARU

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

  Stream<DocumentSnapshot<Map<String, dynamic>>> userStreamBaru() async* {
    // String tahunajaranya = await getTahunAjaranTerakhir();
    // String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    yield* firestore
        .collection('Sekolah')
        .doc(idSekolah)
        // .collection('tahunajaran')
        // .doc(idTahunAjaran)
        .collection('pegawai')
        .doc(idUser)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getProfileBaru() async* {
    yield* firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .doc(idUser)
        .snapshots();
  }

  Future<List<String>> getDataKelasYangDiajar() async {
  String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    List<String> kelasList = [];
    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .doc(idUser)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('kelasnya')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        kelasList.add(docSnapshot.id);
      }
    });
    return kelasList;
}
  //get data kelas

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

  Future<List<String>> getDataSemuaKelas() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    List<String> kelasList = [];
    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('kelastahunajaran')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        kelasList.add(docSnapshot.id);
      }
    });
    return kelasList;
  }
}



  // END REGION BARU


