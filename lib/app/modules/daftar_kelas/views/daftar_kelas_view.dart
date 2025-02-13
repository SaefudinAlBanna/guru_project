import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:guru_project/app/routes/app_pages.dart';

import '../controllers/daftar_kelas_controller.dart';

class DaftarKelasView extends GetView<DaftarKelasController> {
   DaftarKelasView({super.key});

   final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print('tampilkan $data');
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelas $data'),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: controller.getDataKelas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              
              
              
              if (snapshot.hasData) {

                // print(snapshot.data!.toString());

                // TO DO 1: Replace the Column widget with ListView.builder
                // return Column(
                //   children: snapshot.data!.docs
                //       .map((e) => ListTile(
                //             title: Text(e.data()['nama']),
                //             subtitle: Text(e.data()['kelas']),
                //             leading: CircleAvatar(
                //               child: Text(e.data()['nama'][0]),
                //             ),
                //             // onTap: () => Get.toNamed('/detail_siswa, arguments: e),
                //             trailing: IconButton(
                //               icon: const Icon(Icons.details_outlined),
                //               // onPressed: () {
                //               //   FirebaseFirestore.instance
                //               //       .collection('Siswa')
                //               //       .doc(e.id)
                //               //       .delete();
                //               onPressed: () {
                //                 Get.toNamed(Routes.DETAIL_SISWA, arguments: e);
                //               },
                //             ),
                //           ),)
                //       .toList(),
                // );
                
                // TO DO 2: tampilkan data sesuai kelas yang dipilih menggunakan dropdown
                

              

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data!.docs[index].data()['nama']),
                      subtitle: Text(snapshot.data!.docs[index].data()['kelas']),
                      leading: CircleAvatar(
                        child: Text(snapshot.data!.docs[index].data()['nama'][0]),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.details_outlined),
                        onPressed: () {
                          Get.toNamed(Routes.DETAIL_SISWA, arguments: snapshot.data!.docs[index]);
                        },
                      ),
                    );
                  },
                );


                // return Column(
                //   children: snapshot.data!.docs
                //       .map((e) => ListTile(
                //             title: Text(e.data()['nama']),
                //             subtitle: Text(e.data()['kelas']),
                //             leading: CircleAvatar(
                //               child: Text(e.data()['nama'][0]),
                //             ),
                //             // onTap: () => Get.toNamed('/detail_siswa, arguments: e),
                //             trailing: IconButton(
                //               icon: const Icon(Icons.details_outlined),
                //               // onPressed: () {
                //               //   FirebaseFirestore.instance
                //               //       .collection('Siswa')
                //               //       .doc(e.id)
                //               //       .delete();
                //               onPressed: () {
                //                 Get.toNamed(Routes.DETAIL_SISWA, arguments: e);
                //               },
                //             ),
                //           ),)
                //       .toList(),
                // );

              } else {
                return const Center(
                  child: Text('No data available'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
