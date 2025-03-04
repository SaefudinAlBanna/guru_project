import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:guru_project/app/routes/app_pages.dart';

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
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tahun Ajaran',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nama Keompok',
            ),
          ),
          SizedBox(height: 10),
          DropdownSearch<String>(
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                prefixText: 'Pengampu: ',
                hintText: 'Pilih ustadz/ah',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey),
              ),
            ),
            // selectedItem: controller.kelasSiswaController.text,
            items: (f, cs) => [
              "Ustadz 1",
              "Ustadz 2",
              "Ustadz 3",
              "Ustadzah 1",
              "Ustadzah 2",
              "Ustadzah 3",
            ],
            onChanged: (String? value) {
              // controller.kelasSiswaController.text = value!;
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
                prefixText: 'Fase: ',
                hintText: 'Pilih Fase',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey),
              ),
            ),
            // selectedItem: controller.kelasSiswaController.text,
            items: (f, cs) => [
              "Fase A",
              "Fase B",
              "Fase C",
            ],
            onChanged: (String? value) {
              // controller.kelasSiswaController.text = value!;
            },
            popupProps: PopupProps.menu(
                // disabledItemFn: (item) => item == '1A',
                fit: FlexFit.tight),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.DAFTAR_SISWA),
            child: Text('pilih Siswa'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Nama Siswa ke ${index+1}'),
                  subtitle: Text('Kelas'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_rounded),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
             backgroundColor: Colors.blue, 
            ),
            onPressed: (){}, child: Text('Simpan', style: TextStyle(
              color: Colors.black,
            ),)),
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
