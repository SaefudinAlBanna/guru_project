import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DaftarNilaiController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Future<Future<QuerySnapshot<Map<String, dynamic>>>> getDataNilai() async {
  //   return FirebaseFirestore.instance.collection('Pegawai').get();
    // return FirebaseFirestore.instance
    //     .collection('Pegawai')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   for (var doc in querySnapshot.docs) {
    //     // print(doc["kelasAjar"]);
    //     doc.get(["kelasAjar"].toList());
    //   }
    //   return querySnapshot as QuerySnapshot<Map<String, dynamic>>;
    // });

    // return FirebaseFirestore.instance.collection('Pegawai').get();

    // List<pegawai> pegawaiList = [];
    Stream<DocumentSnapshot<Map<String, dynamic>>> userStream() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection('Pegawai').doc(uid).snapshots();
  }
  
}
