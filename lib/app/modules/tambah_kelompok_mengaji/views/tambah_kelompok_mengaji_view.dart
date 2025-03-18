import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:guru_project/app/routes/app_pages.dart';

import '../controllers/tambah_kelompok_mengaji_controller.dart';

class TambahKelompokMengajiView
    extends GetView<TambahKelompokMengajiController> {
  const TambahKelompokMengajiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tahun Ajaran : '),
              FutureBuilder<String>(
                  future: controller.getTahunAjaranTerakhir(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error');
                    } else {
                      return Text(
                        snapshot.data ?? 'No Data',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    }
                  }),
            ],
          ),
          SizedBox(height: 10),
          DropdownSearch<String>(
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                prefixText: 'Pengampu : ',
              ),
            ),
            // selectedItem: controller.kelasSiswaC.text,
            selectedItem: controller.idPegawaiC.text,
            items: (f, cs) => controller.getDataWaliKelas(),
            onChanged: (String? value) {
              controller.waliKelasSiswaC.text = value!;
              controller.idPegawaiC.text = value;
              // print(value);
              // print(controller.idPegawaiC.text);
            },
            popupProps: PopupProps.menu(
                // disabledItemFn: (item) => item == '1A',
                fit: FlexFit.tight),
          ),
          SizedBox(height: 10),
          DropdownSearch<String>(
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                prefixText: 'kelas : ',
              ),
            ),
            selectedItem: controller.kelasSiswaC.text,
            items: (f, cs) => controller.getDataKelas(),
            onChanged: (String? value) {
              controller.kelasSiswaC.text = value!;
            },
            popupProps: PopupProps.menu(
                // disabledItemFn: (item) => item == '1A',
                fit: FlexFit.tight),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: controller.tampilSiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error');
                } else if (!snapshot.hasData || snapshot.data!.data() == null) {
                  return Text('No Data');
                } else {
                  var siswaList = snapshot.data!.data()!['siswa'] as List;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: siswaList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data!.data()!['siswa']['nama']),
                        subtitle: Text('Kelas'),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_rounded),
                        ),
                      );
                    },
                  );
                }
              }
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {},
              child: Text(
                'Simpan',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    title: const Text('Tambah Kelompok Mengaji'),
    backgroundColor: Colors.indigo[400],
    elevation: 0,
  );
}
