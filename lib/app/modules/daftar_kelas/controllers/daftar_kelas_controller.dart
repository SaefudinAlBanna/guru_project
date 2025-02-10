import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaftarKelasController extends GetxController {
 Future<QuerySnapshot<Map<String, dynamic>>> getDataKelas() async {
  return FirebaseFirestore.instance.collection('Siswa').get();
 }
}
