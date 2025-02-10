import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home_widget.dart';
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

  Stream<DocumentSnapshot<Map<String, dynamic>>> userStream() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection('Pegawai').doc(uid).snapshots();
  }


  Stream<DocumentSnapshot<Map<String, dynamic>>> getProfile() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection('Pegawai').doc(uid).snapshots();
  }

  void changeIndex(int index) {
    indexWidget.value = index;
  }

  // getProfile() async {
  //   isLoading.value = true;
  //   await userStream().first;
  //   isLoading.value = false;
  // }

  void signOut() async {
    isLoading.value = true;
    await auth.signOut();
    isLoading.value = false;
    Get.offAllNamed('/login');
  }

  // ini adalah list widget yang akan di tampilkan pada halaman home
  final List<Widget> myWidgets = [
    HomeWidget(),
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

  



}
