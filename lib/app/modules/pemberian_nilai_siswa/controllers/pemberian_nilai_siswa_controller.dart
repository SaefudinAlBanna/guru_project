import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PemberianNilaiSiswaController extends GetxController {
  //TODO: Implement PemberianNilaiSiswaController

  final count = 0.obs;
  var selectedSurat = ''.obs;

  final pertemuan = 1.obs;
  final selectedDate = DateTime.now().obs;
  final suratList = ['Al-Fatihah', 'An-Nas', 'Al-Falaq'].obs;
  
  final selectedSuratHafalan = ''.obs;
  final selectedSuratUmmi = ''.obs;
  
  final ayatHafalanController = TextEditingController();
  final ayatUmmiController = TextEditingController();
  final materiController = TextEditingController();
  final nilaiController = TextEditingController();
  final keteranganController = TextEditingController();
  
  final isDisimakGuru = false.obs;
  final isDisimakOrtu = false.obs;
  
  // Info Siswa
  final studentName = ''.obs;
  final studentId = ''.obs;
  final studentClass = ''.obs;
  final tingkatJilid = ''.obs;
  final ustadz = ''.obs;
  final tempat = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    ayatHafalanController.dispose();
    ayatUmmiController.dispose();
    materiController.dispose();
    nilaiController.dispose();
    keteranganController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void updateSelectedSurat(String? value) {
    if (value != null) {
      selectedSurat.value = value;
    }
  }

  void updateSelectedSuratHafalan(String? value) {
    if (value != null) selectedSuratHafalan.value = value;
  }

  void updateSelectedSuratUmmi(String? value) {
    if (value != null) selectedSuratUmmi.value = value;
  }

  void updateDisimakGuru(bool? value) {
    if (value != null) isDisimakGuru.value = value;
  }

  void updateDisimakOrtu(bool? value) {
    if (value != null) isDisimakOrtu.value = value;
  }

  void submitForm() {
    // TODO: Implement form submission
  }
}
