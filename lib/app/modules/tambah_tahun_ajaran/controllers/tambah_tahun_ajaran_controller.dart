import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TambahTahunAjaranController extends GetxController {
  TextEditingController tahunAjaranC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> test() async {
    String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';
    String idPenginput = auth.currentUser!.uid;
    // print(namaPenginput);

    DocumentReference<Map<String, dynamic>> ambilDataPenginput = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .doc(idPenginput);

    DocumentSnapshot<Map<String, dynamic>> snapDataPenginput =
        await ambilDataPenginput.get();
    print('ini datanya : ${snapDataPenginput.data()?['nama']}');
    // print('ini datanya 2 : ${snapDataPenginput.data()}');
  }

  Future<void> simpanTahunAjaran() async {
    String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';
    String uid = auth.currentUser!.uid;
    String emailPenginput = auth.currentUser!.email!;

    DocumentReference<Map<String, dynamic>> ambilDataPenginput = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .doc(uid);

    DocumentSnapshot<Map<String, dynamic>> snapDataPenginput =
        await ambilDataPenginput.get();

    CollectionReference<Map<String, dynamic>> colTahunAjaran = firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran');
    QuerySnapshot<Map<String, dynamic>> snapshotTahunAjaran =
        await colTahunAjaran.get();
    List<Map<String, dynamic>> listTahunAjaran =
        snapshotTahunAjaran.docs.map((e) => e.data()).toList();

    //ambil namatahunajaranya
    listTahunAjaran.map((e) => e['namatahunajaran']).toList();

    // buat documen id buat tahun ajaran
    String idTahunAjaran = tahunAjaranC.text.replaceAll("/", "-");

    if (listTahunAjaran.elementAt(0)['namatahunajaran'] != tahunAjaranC.text) {
      if (!listTahunAjaran
          .any((element) => element['namatahunajaran'] == tahunAjaranC.text)) {
        //belum input tahun ajaran yang baru, maka bikin tahun ajaran baru
        colTahunAjaran.doc(idTahunAjaran).set({
          'namatahunajaran': tahunAjaranC.text,
          'idpenginput': uid,
          'emailpenginput': emailPenginput,
          'namapenginput': snapDataPenginput.data()?['nama'],
          'tanggalinput': DateTime.now().toString(),
          'idtahunajaran': idTahunAjaran,
        }).then(
          (value) =>
              Get.snackbar('Berhasil', 'Tahun ajaran sudah berhasil dibuat'),
        );
      } else {
        Get.snackbar('Gagal', 'Tahun ajaran sudah ada');
      }
      // Get.back();
    }
    // Get.back();
  }
}
