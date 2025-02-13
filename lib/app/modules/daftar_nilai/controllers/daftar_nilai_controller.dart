import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DaftarNilaiController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
    Stream<DocumentSnapshot<Map<String, dynamic>>> userStream() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection('Pegawai').doc(uid).snapshots();
  }
  
}
