import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TambahPegawaiController extends GetxController {
  TextEditingController nipC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController noHpC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void tambahPegawai() async {
    if (nipC.text.isNotEmpty &&
        namaC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        noHpC.text.isNotEmpty) {
      try {
        final UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailC.text,
          password: 'password',
        );
        print(userCredential);

        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;

          await firestore.collection("Pegawai").doc(uid).set({
            "nip": nipC.text,
            "nama": namaC.text,
            "email": emailC.text,
            "noHp": noHpC.text,
            "uid": uid,
            "createdAt": DateTime.now().toIso8601String(),
          });

         await userCredential.user!.sendEmailVerification();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'Terjadi Kesalahan', 'Password terlalu singkat');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'Terjadi Kesalahan', 'email pegawai sudah terdaftar');
        }
      } catch (e) {
        Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'Terjadi Kesalahan',
            'Tidak dapat menambahkan pegawai, harap dicoba lagi');
      }
    } else {
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 156, 151, 151),
        'Terjadi Kesalahan', '* Wajib di isi');
    }
  }
}
