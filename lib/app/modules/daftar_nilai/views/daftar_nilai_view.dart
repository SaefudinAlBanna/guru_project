import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_nilai_controller.dart';

class DaftarNilaiView extends GetView<DaftarNilaiController> {
  const DaftarNilaiView({super.key});

  // PERCOBAAN PENGAMBILAN LIST MANUAL
  // final List<String> myList = ['1A', '1B', '2A', '2B'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DaftarNilaiView'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.userStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              Map<String, dynamic> user = snapshot.data!.data()!;
              // print('print user $user');

              //percobaan 1
              List mataPelajaranNya = user['mataPelajaran'];
              print('datanya adalah ${user['mataPelajaran']}');
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Text(
                    user['nama'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(user['email']),
                  SizedBox(height: 50),
                  Column(
                    children: mataPelajaranNya.map((pelajaran) {
                      return TextButton(
                          onPressed: () {
                            print(pelajaran);
                          }, 
                          child: Text(pelajaran));
                    }).toList(),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Tidak dapat mengambil data'),
              );
            }
          }),
    );
  }
}



//       body: ListView.builder(
//         itemCount: 6,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text('title'),
//             subtitle: Text('subtitle'),
//             trailing: DropdownButton<String>(
//               items: myList.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 print(newValue);
//               },
//             ),
//             leading: CircleAvatar(
//               child: Text('leading'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }







        // body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        //   future: null,
        //   builder: (context, snapshot) {
        //     // print('ini snaphootnya ${snapshot.data!.docs}');
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     if (!snapshot.hasData) {
        //       return Center(
        //           child: Text('No data available ${snapshot.data!.docs}'));
        //     }
        //     if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     }
        //     if (snapshot.data!.docs.isEmpty) {
        //       return Center(child: Text('No data available'));
        //     }
        //     Map<String, dynamic> data = snapshot.data!.data()!;
        //     if (snapshot.hasData) {
              // return ListView.builder(
              //   // itemCount: snapshot.data!.docs.length,
              //   itemCount: 6,
              //   itemBuilder: (context, index) {
              //     print(
              //         'ini snapshotnya ${snapshot.data!.docs[index].data()['kelasAjar'].toString()}');
              //     return ListTile(
              //       title: Text(snapshot.data!.docs[index]
              //           .data()['kelasAjar']
              //           .toString()),
              //       subtitle: Text(snapshot.data!.docs[index]
              //           .data()['mataPelajaran']
              //           .toString()),
              //       // subtitle: Text(snapshot.data!.docs[index].data()['nilai']),
              //       // leading: CircleAvatar(
              //       //   child: Text(snapshot.data!.docs[index].data()['nama'][0]),
              //       // ),
              //     );
              //   },
              // );


        //       return Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Column(
        //           children: [
        //             Text('Kelas yang di ajar oleh ustadznya'),
        //             SizedBox(height: 20),
        //             GridView.count(
        //               crossAxisCount: 3,
        //               crossAxisSpacing: 4,
        //               mainAxisSpacing: 4,
        //               children: snapshot.data!.docs.
        //             ),
        //           ],
        //         ),
        //       );
        //     }
        //     return Center(child: Text('Data loaded'));
        //     // Add your widget here based on the snapshot data
        //   },
        // )
      
   