import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DaftarKelasController extends GetxController {
  var data = Get.arguments;
  
  var getDataKelasNya = FirebaseFirestore.instance.collection('Siswa').get();



 // BERHASIL MENAMPILKAN DATA DETAIL SISWA berdasarkan kelas pada halaman guru  
 Future<QuerySnapshot<Map<String, dynamic>>> getDataKelas() async {
  // return FirebaseFirestore.instance.collection('Siswa').get();
  
  var snapshot = await getDataKelasNya;
  snapshot.docs.where((doc) => doc['kelas'] != data).toList();
  return FirebaseFirestore.instance.collection('Siswa').where('kelas', isEqualTo: data).get();
 }
}
