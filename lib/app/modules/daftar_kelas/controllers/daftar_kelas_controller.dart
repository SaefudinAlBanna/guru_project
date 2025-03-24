import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DaftarKelasController extends GetxController {
  var data = Get.arguments;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idUser = FirebaseAuth.instance.currentUser!.uid;
  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';
  String emailAdmin = FirebaseAuth.instance.currentUser!.email!;

  var getDataKelasNya = FirebaseFirestore.instance.collection('Siswa').get();



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


  // BERHASIL MENAMPILKAN DATA DETAIL SISWA berdasarkan kelas pada halaman guru
  Future<QuerySnapshot<Map<String, dynamic>>> getDataKelas() async {
    // return FirebaseFirestore.instance.collection('Siswa').get();

    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    // var snapshot = await getDataKelasNya;
    String kelasnya = data.toString();
    // snapshot.docs.where((doc) => doc['kelas'] != data).toList();
    // return FirebaseFirestore.instance.collection('Siswa').where('kelas', isEqualTo: data).get();
    // return FirebaseFirestore.instance
    //     .collection('Sekolah')
    //     .doc(idSekolah)
    //     .where('kelas', isEqualTo: data)
    //     .get();
    return await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('kelastahunajaran')
        .doc(kelasnya)
        .collection('semester')
        .doc('semester1') // ini nanti diganti otomatis
        .collection('daftarsiswasemester1')
        .get();
  }
}
