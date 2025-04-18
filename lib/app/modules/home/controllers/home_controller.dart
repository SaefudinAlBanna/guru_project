import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:guru_project/app/routes/app_pages.dart';
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

  //=======================================================
  TextEditingController tempatC = TextEditingController();
  TextEditingController semesterC = TextEditingController();
  TextEditingController pengampuC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idUser = FirebaseAuth.instance.currentUser!.uid;
  String idSekolah = 'UQjMpsKZKmWWbWVu4Uwb';
  String emailAdmin = FirebaseAuth.instance.currentUser!.email!;

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

  Future<List<String>> getDataFase() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    String idSemester = 'Semester I';  // nanti ini diambil dari database

    List<String> faseList = [];
    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('semester')
        .doc(idSemester)
        .collection('kelompokmengaji')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        faseList.add(docSnapshot.id);
      }
    });
    return faseList;
  }

  Future<List<String>> getDataKelompok() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    String idSemester = 'Semester I';

    List<String> kelasList = [];
    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .doc(idUser)
        .collection('tahunajarankelompok')
        .doc(idTahunAjaran)
        .collection('semester')
        .doc(idSemester)
        .collection('kelompokmengaji')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        kelasList.add(docSnapshot.id);
      }
    });
    // print('ini kelasList : $kelasList');
    return kelasList;
    // }
    // return [];
  }

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

//===========================================================
//**
// ini untuk tambah kelompok
// */

  Future<List<String>> getDataPengampu() async {
    List<String> walikelasList = [];
    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot
          in querySnapshot.docs.where((doc) => doc['role'] == 'admin')) {
        walikelasList.add(docSnapshot.data()['alias']);
      }
    });
    return walikelasList;
  }

  List<String> getDataTempat() {
    List<String> temaptList = [
      'masjid',
      'aula',
      'kelas',
      'lab',
      'dll',
    ];
    return temaptList;
  }

  List<String> getDataSemester() {
    List<String> temaptList = [
      'semester1',
      'semester2',
    ];
    return temaptList;
  }

  Future<void> isiTahunAjaranKelompokPadaPegawai() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    String semesterNya =
        (semesterC.text == 'semester1') ? "Semester I" : "Semester II";
    QuerySnapshot<Map<String, dynamic>> querySnapshotGuru = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .where('alias', isEqualTo: pengampuC.text)
        .get();
    if (querySnapshotGuru.docs.isNotEmpty) {
      Map<String, dynamic> dataGuru = querySnapshotGuru.docs.first.data();
      String idPengampu = dataGuru['uid'];

      await firestore
          .collection('Sekolah')
          .doc(idSekolah)
          .collection('pegawai')
          .doc(idPengampu)
          .collection('tahunajarankelompok')
          .doc(idTahunAjaran)
          .set({'namatahunajaran': tahunajaranya});

      await firestore
          .collection('Sekolah')
          .doc(idSekolah)
          .collection('pegawai')
          .doc(idPengampu)
          .collection('tahunajarankelompok')
          .doc(idTahunAjaran)
          .collection('semester')
          .doc(semesterNya)
          .set({
        'namasemester': semesterNya,
        'tahunajaran': tahunajaranya,
        'emailpenginput': emailAdmin,
        'idpenginput': idUser,
        'tanggalinput': DateTime.now(),
      });
    }
  }

  Future<void> isiFieldPengampuKelompok() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    String idKelompokmengaji = "${pengampuC.text} ${tempatC.text}";

    String semesterNya =
        (semesterC.text == 'semester1') ? "Semester I" : "Semester II";

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .where('alias', isEqualTo: pengampuC.text)
        .get();
    String idPengampu = querySnapshot.docs.first.data()['uid'];

    isiTahunAjaranKelompokPadaPegawai();

    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('semester')
        .doc(semesterNya)
        .collection('kelompokmengaji')
        .doc(idKelompokmengaji)
        .set({
      'namasemester': semesterNya,
      'kelompokmengaji': idKelompokmengaji,
      'idpengampu': idPengampu,
      'namapengampu': pengampuC.text,
      'tempatmengaji': tempatC.text,
      'tahunajaran': tahunajaranya,
      'emailpenginput': emailAdmin,
      'idpenginput': idUser,
      'tanggalinput': DateTime.now(),
    });
  }

  Future<void> buatIsiSemester1() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");

    String semesterNya =
        (semesterC.text == 'semester1') ? "Semester I" : "Semester II";

    await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('tahunajaran')
        .doc(idTahunAjaran)
        .collection('semester')
        .doc(semesterNya)
        .set({
      'namasemester': semesterNya,
      'tahunajaran': tahunajaranya,
      'emailpenginput': emailAdmin,
      'idpenginput': idUser,
      'tanggalinput': DateTime.now(),
    });
  }

  Future<void> tambahDaftarKelompokPengampuAjar() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    String idKelompokmengaji = "${pengampuC.text} ${tempatC.text}";

    String semesterNya =
        (semesterC.text == 'semester1') ? "Semester I" : "Semester II";

    //ambil data guru terpilih .. ini nggak perlu dirubah
    QuerySnapshot<Map<String, dynamic>> querySnapshotGuru = await firestore
        .collection('Sekolah')
        .doc(idSekolah)
        .collection('pegawai')
        .where('alias', isEqualTo: pengampuC.text)
        .get();
    if (querySnapshotGuru.docs.isNotEmpty) {
      Map<String, dynamic> dataGuru = querySnapshotGuru.docs.first.data();
      String idPengampu = dataGuru['uid'];

      await firestore
          .collection('Sekolah')
          .doc(idSekolah)
          .collection('pegawai')
          .doc(idPengampu)
          .collection('tahunajarankelompok')
          .doc(idTahunAjaran)
          .collection('semester')
          .doc(semesterNya)
          .collection('kelompokmengaji')
          .doc(idKelompokmengaji)
          .set({
        'tahunajaran': tahunajaranya,
        'kelompokmengaji': idKelompokmengaji,
        'namasemester': semesterNya,
        'namapengampu': pengampuC.text,
        'idpengampu': idPengampu,
        'emailpenginput': emailAdmin,
        'idpenginput': idUser,
        'tanggalinput': DateTime.now(),
        'tempatmengaji': tempatC.text,
      });
    }
  }

  Future<void> tambahkanKelompokSiswa() async {
    String tahunajaranya = await getTahunAjaranTerakhir();
    // String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    // String idKelompokmengaji = "${pengampuC.text} ${tempatC.text}";
    String semesterNya =
        (semesterC.text == 'semester1') ? "Semester I" : "Semester II";

    // QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
    //     .collection('Sekolah')
    //     .doc(idSekolah)
    //     .collection('pegawai')
    //     .where('alias', isEqualTo: pengampuC.text)
    //     .get();
    // String idPengampu = querySnapshot.docs.first.data()['uid'];

    if (tahunajaranya.isNotEmpty &&
        semesterNya.isNotEmpty &&
        pengampuC.text.isNotEmpty) {
      try {
        // buatIsiKelompokMengajiTahunAjaran();
        isiFieldPengampuKelompok();
        buatIsiSemester1();
        tambahDaftarKelompokPengampuAjar();

        // await firestore
        //     .collection('Sekolah')
        //     .doc(idSekolah)
        //     .collection('tahunajaran')
        //     .doc(idTahunAjaran)
        //     .collection('semester')
        //     .doc(semesterNya)
        //     .collection('kelompokmengaji')
        //     .doc(idKelompokmengaji)
        //     .collection('daftarsiswakelompok');
            // .doc(null)
            // .set({
          // 'namasiswa': '',
          // 'nisn': '',
          // 'kelas': '',
          // 'fase': '',
          // 'tahunajaran': '',
          // 'kelompoksiswa': '',
          // 'semester': '',
          // 'pengampu': '',
          // 'idpengampu': idPengampu,
          // 'emailpenginput': '',
          // 'idpenginput': '',
          // 'tanggalinput': DateTime.now(),
          // 'idsiswa': '',
        // });
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    } else {
      Get.snackbar('Error', 'pengampu dan tempat tidak boleh kosong');
    }
  }

  Future<void> buatKelompokMengaji() async {
    // String tahunajaranya = await getTahunAjaranTerakhir();
    // String idTahunAjaran = tahunajaranya.replaceAll("/", "-");
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buat Kelompok Mengaji'),
        ),
        body: Center(child: Text('data')),
      ),
    );
    // Get.defaultDialog(
    //     title: 'Konfirmasi',
    //     middleText: 'Silahkan buat kelompok mengajinya',
    //     actions: [
    //       Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(10),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text('TAHUN AJARAN :'),
    //                 FutureBuilder<String>(
    //                     future: getTahunAjaranTerakhir(),
    //                     builder: (context, snapshot) {
    //                       if (snapshot.connectionState ==
    //                           ConnectionState.waiting) {
    //                         return CircularProgressIndicator();
    //                       } else if (snapshot.hasError) {
    //                         return Text('Error');
    //                       } else {
    //                         return Text(
    //                           snapshot.data ?? 'No Data',
    //                           style: TextStyle(
    //                               fontSize: 18, fontWeight: FontWeight.bold),
    //                         );
    //                       }
    //                     }),
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             height: 50,
    //             width: Get.width,
    //             child: DropdownSearch<String>(
    //               decoratorProps: DropDownDecoratorProps(
    //                 decoration: InputDecoration(
    //                   border: UnderlineInputBorder(),
    //                   filled: true,
    //                   labelText: 'Pengampu',
    //                 ),
    //               ),
    //               selectedItem:
    //                   pengampuC.text.isNotEmpty ? pengampuC.text : null,
    //               items: (f, cs) => getDataPengampu(),
    //               onChanged: (String? value) {
    //                 if (value != null) {
    //                   pengampuC.text = value;
    //                   // print('ini onchange : ${pengampuC.text}');
    //                 }
    //               },
    //               popupProps: PopupProps.menu(fit: FlexFit.tight),
    //             ),
    //           ),
    //           SizedBox(height: 5),
    //           SizedBox(
    //             height: 50,
    //             width: Get.width,
    //             child: DropdownSearch<String>(
    //               decoratorProps: DropDownDecoratorProps(
    //                 decoration: InputDecoration(
    //                   border: UnderlineInputBorder(),
    //                   filled: true,
    //                   labelText: 'Tempat',
    //                 ),
    //               ),
    //               selectedItem: tempatC.text.isNotEmpty ? tempatC.text : null,
    //               items: (f, cs) => getDataTempat(),
    //               onChanged: (String? value) {
    //                 if (value != null) {
    //                   tempatC.text = value;
    //                   // print('ini onchange : ${tempatC.text}');
    //                 }
    //               },
    //               popupProps: PopupProps.menu(fit: FlexFit.tight),
    //             ),
    //           ),
    //           SizedBox(height: 5),
    //           SizedBox(
    //             height: 50,
    //             width: Get.width,
    //             child: DropdownSearch<String>(
    //               decoratorProps: DropDownDecoratorProps(
    //                 decoration: InputDecoration(
    //                   border: UnderlineInputBorder(),
    //                   filled: true,
    //                   labelText: 'Semester',
    //                 ),
    //               ),
    //               selectedItem:
    //                   semesterC.text.isNotEmpty ? semesterC.text : null,
    //               items: (f, cs) => getDataSemester(),
    //               onChanged: (String? value) {
    //                 if (value != null) {
    //                   semesterC.text = value;
    //                   // print('ini onchange : ${semesterC.text}');
    //                 }
    //               },
    //               popupProps: PopupProps.menu(fit: FlexFit.tight),
    //             ),
    //           ),
    //         ],
    //       ),
    //       OutlinedButton(
    //           onPressed: () {
    //             // isLoading.value = false;
    //             // Get.back();
    //             Get.offAllNamed(Routes.HOME);
    //           },
    //           child: Text('CANCEL')),
    //       ElevatedButton(
    //           onPressed: () {
    //             tambahkanKelompokSiswa();
    //             Get.offAllNamed(Routes.TAMBAH_KELOMPOK_MENGAJI);
    //           },
    //           child: Text('Buat'))
    //     ]);
    // }
  }
}// END REGION BARU


