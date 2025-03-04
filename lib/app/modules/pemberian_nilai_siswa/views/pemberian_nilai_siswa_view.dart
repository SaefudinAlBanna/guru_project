import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pemberian_nilai_siswa_controller.dart';

class PemberianNilaiSiswaView extends GetView<PemberianNilaiSiswaController> {
  const PemberianNilaiSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 30),
            _buildMainContent(),
            const SizedBox(height: 20),
            _buildSubmitButton(),
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
        const SizedBox(height: 20),
        _buildStudentInfo(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildLabelColumn(),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 3,
          child: _buildInputColumn(),
        ),
      ],
    );
  }

  Widget _buildLabelColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Tatap Muka', style: TextStyle(fontWeight: FontWeight.w500)),
        Text('Tanggal', style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        _SectionHeader(title: 'HAFALAN'),
        Text('Surat', style: TextStyle(fontWeight: FontWeight.w500)),
        Text('Ayat', style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        _SectionHeader(title: 'UMMI/ALQORAN'),
        Text('Jilid/Surat', style: TextStyle(fontWeight: FontWeight.w500)),
        Text('Hal/Ayat', style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        Text('Materi', style: TextStyle(fontWeight: FontWeight.w500)),
        Text('Nilai', style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        _SectionHeader(title: 'DISIMAK'),
        Text('Guru', style: TextStyle(fontWeight: FontWeight.w500)),
        Text('Orang tua', style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 20),
        Text('Keterangan', style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildInputColumn() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(controller.pertemuan.toString()),
        Text(controller.selectedDate.value.toString()),
        const SizedBox(height: 20),
        const _SectionHeader(title: 'HAFALAN'),
        _buildDropdown(
          items: controller.suratList,
          value: controller.selectedSuratHafalan.value,
          onChanged: (value) => controller.updateSelectedSuratHafalan.call(value),
        ),
        _buildTextField(
          hintText: 'Ayat',
          controller: controller.ayatHafalanController,
        ),
        const SizedBox(height: 20),
        const _SectionHeader(title: 'UMMI/ALQORAN'),
        _buildDropdown(
          items: controller.suratList,
          value: controller.selectedSuratUmmi.value,
          onChanged: (value) => controller.updateSelectedSuratUmmi.call(value),
        ),
        _buildTextField(
          hintText: 'Hal/Ayat',
          controller: controller.ayatUmmiController,
        ),
        const SizedBox(height: 20),
        _buildTextField(
          hintText: 'Materi',
          controller: controller.materiController,
        ),
        _buildTextField(
          hintText: 'Nilai',
          controller: controller.nilaiController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        const _SectionHeader(title: 'DISIMAK'),
        _buildCheckbox(
          value: controller.isDisimakGuru.value,
          onChanged: (value) => controller.updateDisimakGuru.call(value),
          label: 'Sudah disimak oleh guru',
        ),
        _buildCheckbox(
          value: controller.isDisimakOrtu.value,
          onChanged: (value) => controller.updateDisimakOrtu.call(value),
          label: 'Sudah disimak oleh orang tua',
        ),
        const SizedBox(height: 20),
        _buildTextField(
          hintText: 'Keterangan',
          controller: controller.keteranganController,
          maxLines: 3,
        ),
      ],
    ));
  }

  Widget _buildDropdown({
    required List<String> items,
    required String? value,
    required Function(String?) onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: Container(),
        items: items.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        )).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int? maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required Function(bool?) onChanged,
    required String label,
  }) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: controller.submitForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo[400],
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12,
        ),
      ),
      child: const Text('Simpan'),
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

  Widget _buildStudentInfo() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
        children: [
          _buildInfoColumn(
            labels: const ['Nama', 'No. Induk', 'Kelas'],
            values: [
              controller.studentName.value,
              controller.studentId.value,
              controller.studentClass.value,
            ],
          ),
          const SizedBox(width: 60),
          _buildInfoColumn(
            labels: const ['Tgk/Jilid', 'Ustadz', 'Tempat'],
            values: [
              controller.tingkatJilid.value,
              controller.ustadz.value,
              controller.tempat.value,
            ],
          ),
        ],
      )),
    );
  }

  Widget _buildInfoColumn({
    required List<String> labels,
    required List<String> values,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: labels.map((label) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '$label : ',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          )).toList(),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values.map((value) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(value),
          )).toList(),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Divider(thickness: 2),
      ],
    );
  }
}
