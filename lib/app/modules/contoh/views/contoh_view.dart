import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contoh_controller.dart';

class ContohView extends GetView<ContohController> {
  const ContohView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContohView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContohView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
