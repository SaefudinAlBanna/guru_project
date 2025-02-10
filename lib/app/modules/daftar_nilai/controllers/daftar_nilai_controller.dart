import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaftarNilaiController extends GetxController {
  Future<QuerySnapshot<Map<String, dynamic>>> getDataNilai() async {
  return FirebaseFirestore.instance.collection('Pegawai').get();
 }

}
