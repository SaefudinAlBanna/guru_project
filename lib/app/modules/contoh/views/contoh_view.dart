import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/contoh_controller.dart';

class ContohView extends GetView<ContohController> {
   ContohView({super.key});
  final dataxx = Get.arguments;

  // List get data => [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              children: [
                _buildHeaderSection(),
              ],
            ),
            Divider(height: 3, color: Colors.black),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Card(
                      child: Column(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama Siswa : $dataxx'),
                          Text('No Induk'),
                          Text('Kelas'),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Card(
                      child: Column(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(DateFormat('dd Mmmm Yyyy').toString()),
                          Text('Ustadz/ah'),
                          Text('Tempat'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tatap muka ke :'),
                Text('Tgl : ${DateTime.now()}'),
                SizedBox(height: 10),
                Text(
                  'HAFALAN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(height: 2, color: Colors.black),
                DropdownSearch<String>(
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      prefixText: 'surat: ',
                    ),
                  ),
                  // selectedItem: controller.kelasSiswaController.text,
                  items: (f, cs) => [
                    "Annas",
                    'Al-Falaq',
                    'Al Ikhlas',
                    'Al Lahab',
                    'An Nasr',
                    'dll'
                  ],
                  onChanged: (String? value) {
                    // controller.kelasSiswaController.text = value!;
                  },
                  popupProps: PopupProps.menu(
                      // disabledItemFn: (item) => item == '1A',
                      fit: FlexFit.tight),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ayat yang dihafal',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'UMMI/ALQURAN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(height: 2, color: Colors.black),
                DropdownSearch<String>(
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      prefixText: 'Jld/Surat: ',
                    ),
                  ),
                  // selectedItem: controller.kelasSiswaController.text,
                  items: (f, cs) => [
                    "Annas",
                    'Al-Falaq',
                    'Al Ikhlas',
                    'Al Lahab',
                    'An Nasr',
                    'dll'
                  ],
                  onChanged: (String? value) {
                    // controller.kelasSiswaController.text = value!;
                  },
                  popupProps: PopupProps.menu(
                      // disabledItemFn: (item) => item == '1A',
                      fit: FlexFit.tight),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Hal / Ayat',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Materi',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nilai',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'DISIMAK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(height: 2, color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Guru : Sudah'),
                    SizedBox(width: 15),
                    Text('Orang tua : Sudah'),
                  ],
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Keterangan',
                  ),
                ),
                Center(child: FloatingActionButton(onPressed: (){}, child: Text('Simpan'),)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Kartu Prestasi'),
      backgroundColor: Colors.indigo[400],
      elevation: 0,
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: const [
        Text(
          "KARTU PRESTASI PEMBELAJARAN ALQUR'AN METODE UMMI",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Text(
          "SD IT UKHUWAH ISLAMIYYAH",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
