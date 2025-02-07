import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';

import 'package:get/get.dart';

import '../controllers/tambah_siswa_controller.dart';

class TambahSiswaView extends GetView<TambahSiswaController> {
  const TambahSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAMBAH SISWA BARU'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DATA SISWA",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 5,
                  width: Get.width,
                  color: Colors.blue,
                ),
                TextFormField(
                  controller: controller.namaSiswaController,
                  decoration: const InputDecoration(labelText: 'Nama Siswa'),
                ),
                DropdownSearch<String>(
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      prefixText: 'Kelas Siswa: ',
                      
                    ),
                   ),
                  
                  selectedItem: controller.kelasSiswaController.text,
                  
                  items: (f, cs) => ["1A", '1B', '2A', '2B', '3A', '3B'],
                  onChanged: (String? value) {
                    controller.kelasSiswaController.text = value!;
                  },
                  popupProps: PopupProps.menu(
                      // disabledItemFn: (item) => item == '1A',
                      fit: FlexFit.tight),
                      
                ),
                DropdownSearch<String>(
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      prefixText: 'Jenis Kelamin: ',
                      
                    ),
                   ),
                  selectedItem: controller.jenisKelaminSiswaController.text,
                  
                  items: (f, cs) => ["Laki-laki", 'Perempuan'],
                  onChanged: (String? value) {
                    controller.jenisKelaminSiswaController.text = value!;
                  },
                  popupProps: PopupProps.menu(
                      // disabledItemFn: (item) => item == '1A',
                      fit: FlexFit.tight),  
                ),
                DropdownSearch<String>(
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      prefixText: 'Agama: ',
                      
                    ),
                   ),
                  selectedItem: controller.agamaSiswaController.text,
                  
                  items: (f, cs) => ["Islam", 'Kristen', 'Katolik', 'Hindu', 'Budha'],
                  onChanged: (String? value) {
                    controller.agamaSiswaController.text = value!;
                    print(controller.agamaSiswaController.text);
                  },
                  popupProps: PopupProps.menu(
                      // disabledItemFn: (item) => item == '1A',
                      fit: FlexFit.tight),  
                ),
                TextFormField(
                  controller: controller.tempatLahirSiswaController,
                  decoration: const InputDecoration(labelText: 'Tempat Lahir'),
                ),
                TextFormField(
                  controller: controller.tanggalLahirSiswaController,
                  decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
                ),
                TextFormField(
                  controller: controller.alamatSiswaController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                ),
                TextFormField(
                  controller: controller.waliKelasSiswaController,
                  decoration: const InputDecoration(labelText: 'Wali Kelas'),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DATA ORANG TUA",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 5,
                  width: Get.width,
                  color: Colors.blue,
                ),
                TextFormField(
                  controller: controller.namaAyahController,
                  decoration: const InputDecoration(labelText: 'Nama Ayah'),
                ),
                TextFormField(
                  controller: controller.namaIbuController,
                  decoration: const InputDecoration(labelText: 'Nama Ibu'),
                ),
                TextFormField(
                  controller: controller.emailOrangTuaController,
                  decoration:
                      const InputDecoration(labelText: 'Email Orang Tua'),
                ),
                TextFormField(
                  controller: controller.noHpOrangTuaController,
                  decoration:
                      const InputDecoration(labelText: 'No. HP Orang Tua'),
                ),
                TextFormField(
                  controller: controller.alamatOrangTuaController,
                  decoration:
                      const InputDecoration(labelText: 'Alamat Orang Tua'),
                ),
                TextFormField(
                  controller: controller.pekerjaanAyahController,
                  decoration:
                      const InputDecoration(labelText: 'Pekerjaan Ayah'),
                ),
                TextFormField(
                  controller: controller.pekerjaanIbuController,
                  decoration: const InputDecoration(labelText: 'Pekerjaan Ibu'),
                ),
                TextFormField(
                  controller: controller.pendidikanAyahController,
                  decoration:
                      const InputDecoration(labelText: 'Pendidikan Ayah'),
                ),
                TextFormField(
                  controller: controller.pendidikanIbuController,
                  decoration:
                      const InputDecoration(labelText: 'Pendidikan Ibu'),
                ),
                TextFormField(
                  controller: controller.noHpWaliController,
                  decoration: const InputDecoration(labelText: 'No. HP Wali'),
                ),
                TextFormField(
                  controller: controller.alamatWaliController,
                  decoration: const InputDecoration(labelText: 'Alamat Wali'),
                ),
                TextFormField(
                  controller: controller.pekerjaanWaliController,
                  decoration:
                      const InputDecoration(labelText: 'Pekerjaan Wali'),
                ),
                TextFormField(
                  controller: controller.pendidikanWaliController,
                  decoration:
                      const InputDecoration(labelText: 'Pendidikan Wali'),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DATA PEMBAYARAN SEKOLAH",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 5,
                  width: Get.width,
                  color: Colors.blue,
                ),
                TextFormField(
                  controller: controller.biayaSppController,
                  decoration: const InputDecoration(labelText: 'Biaya SPP'),
                ),
                TextFormField(
                  controller: controller.biayaUangPangkalController,
                  decoration:
                      const InputDecoration(labelText: 'Biaya Uang Pangkal'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.tambahSiswa();
              },
              child: const Text('Tambah Siswa'),
            ),
          ],
        ),
        
      ),
      
    );
  }
}
