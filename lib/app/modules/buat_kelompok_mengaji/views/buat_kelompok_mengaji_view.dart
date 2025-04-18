import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/buat_kelompok_mengaji_controller.dart';

class BuatKelompokMengajiView extends GetView<BuatKelompokMengajiController> {
  const BuatKelompokMengajiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelompok Mengaji'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tahun Ajaran :'),
                  // Text('get tahun ajaran terakhir'),
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
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<String>(
                      future: controller.getDataSemester(),
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
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Fase',
                  ),
                ),
                selectedItem: controller.faseC.text.isNotEmpty
                    ? controller.faseC.text
                    : null,
                items: (f, cs) => controller.getDataFase(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.faseC.text = value;
                    print('ini fase : ${controller.faseC.text}');
                  }
                },
                popupProps: PopupProps.menu(fit: FlexFit.tight),
              ),
              SizedBox(height: 15),
              DropdownSearch<String>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Pengampu',
                  ),
                ),
                selectedItem: controller.pengampuC.text.isNotEmpty
                    ? controller.pengampuC.text
                    : null,
                items: (f, cs) => controller.getDataPengampu(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.pengampuC.text = value;
                  }
                },
                popupProps: PopupProps.menu(fit: FlexFit.tight),
              ),
              SizedBox(height: 20),
              DropdownSearch<String>(
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  labelText: 'Tempat',
                ),
              ),
              selectedItem: controller.tempatC.text.isNotEmpty
                  ? controller.tempatC.text
                  : null,
              items: (f, cs) => controller.getDataTempat(),
              onChanged: (String? value) {
                if (value != null) {
                  controller.tempatC.text = value;
                  // print('ini tampatC : $value');
                }
              },
              popupProps: PopupProps.menu(fit: FlexFit.tight),
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: (){}, child: Text('Buat Kelompok'))
          ],
        ),
      ),
    );
  }
}
