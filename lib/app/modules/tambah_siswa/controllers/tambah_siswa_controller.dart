import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahSiswaController extends GetxController {
  TextEditingController namaSiswaController = TextEditingController();
  TextEditingController kelasSiswaController = TextEditingController();
  TextEditingController jenisKelaminSiswaController = TextEditingController();
  TextEditingController agamaSiswaController = TextEditingController();
  TextEditingController tempatLahirSiswaController = TextEditingController();
  TextEditingController tanggalLahirSiswaController = TextEditingController();
  TextEditingController alamatSiswaController = TextEditingController();
  TextEditingController waliKelasSiswaController = TextEditingController();
  TextEditingController namaAyahController = TextEditingController();
  TextEditingController namaIbuController = TextEditingController();
  TextEditingController emailOrangTuaController = TextEditingController();
  TextEditingController noHpOrangTuaController = TextEditingController();
  TextEditingController alamatOrangTuaController = TextEditingController();
  TextEditingController pekerjaanAyahController = TextEditingController();
  TextEditingController pekerjaanIbuController = TextEditingController();
  TextEditingController pendidikanAyahController = TextEditingController();
  TextEditingController pendidikanIbuController = TextEditingController();
  TextEditingController noHpWaliController = TextEditingController();
  TextEditingController alamatWaliController = TextEditingController();
  TextEditingController pekerjaanWaliController = TextEditingController();
  TextEditingController pendidikanWaliController = TextEditingController();
  TextEditingController biayaSppController = TextEditingController();
  TextEditingController biayaUangPangkalController = TextEditingController();

  void tambahSiswa() {
    if (namaSiswaController.text.isEmpty ||
        kelasSiswaController.text.isEmpty ||
        jenisKelaminSiswaController.text.isEmpty ||
        agamaSiswaController.text.isEmpty ||
        tempatLahirSiswaController.text.isEmpty ||
        tanggalLahirSiswaController.text.isEmpty ||
        alamatSiswaController.text.isEmpty ||
        waliKelasSiswaController.text.isEmpty ||
        namaAyahController.text.isEmpty ||
        namaIbuController.text.isEmpty ||
        emailOrangTuaController.text.isEmpty ||
        noHpOrangTuaController.text.isEmpty ||
        alamatOrangTuaController.text.isEmpty ||
        pekerjaanAyahController.text.isEmpty ||
        pekerjaanIbuController.text.isEmpty ||
        pendidikanAyahController.text.isEmpty ||
        pendidikanIbuController.text.isEmpty ||
        noHpWaliController.text.isEmpty ||
        alamatWaliController.text.isEmpty ||
        pekerjaanWaliController.text.isEmpty ||
        pendidikanWaliController.text.isEmpty ||
        biayaSppController.text.isEmpty ||
        biayaUangPangkalController.text.isEmpty) {
      Get.snackbar(
        'Gagal',
        'Semua data harus diisi',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Berhasil',
        'Data berhasil ditambahkan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      resetForm();
    }
  }

  void resetForm() {
    namaSiswaController.clear();
    kelasSiswaController.clear();
    jenisKelaminSiswaController.clear();
    agamaSiswaController.clear();
    tempatLahirSiswaController.clear();
    tanggalLahirSiswaController.clear();
    alamatSiswaController.clear();
    waliKelasSiswaController.clear();
    namaAyahController.clear();
    namaIbuController.clear();
    emailOrangTuaController.clear();
    noHpOrangTuaController.clear();
    alamatOrangTuaController.clear();
    pekerjaanAyahController.clear();
    pekerjaanIbuController.clear();
    pendidikanAyahController.clear();
    pendidikanIbuController.clear();
    noHpWaliController.clear();
    alamatWaliController.clear();
    pekerjaanWaliController.clear();
    pendidikanWaliController.clear();
    biayaSppController.clear();
    biayaUangPangkalController.clear();
  }

  @override
  void onClose() {
    namaSiswaController.dispose();
    kelasSiswaController.dispose();
    jenisKelaminSiswaController.dispose();
    agamaSiswaController.dispose();
    tempatLahirSiswaController.dispose();
    tanggalLahirSiswaController.dispose();
    alamatSiswaController.dispose();
    waliKelasSiswaController.dispose();
    namaAyahController.dispose();
    namaIbuController.dispose();
    emailOrangTuaController.dispose();
    noHpOrangTuaController.dispose();
    alamatOrangTuaController.dispose();
    pekerjaanAyahController.dispose();
    pekerjaanIbuController.dispose();
    pendidikanAyahController.dispose();
    pendidikanIbuController.dispose();
    noHpWaliController.dispose();
    alamatWaliController.dispose();
    pekerjaanWaliController.dispose();
    pendidikanWaliController.dispose();
    biayaSppController.dispose();
    biayaUangPangkalController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInactive() {
    // super.onInactive();
  }

  @override
  void onResumed() {
    // super.onResumed();
  }

  @override
  void onSuspended() {
    // super.onSuspended();
  }
}
