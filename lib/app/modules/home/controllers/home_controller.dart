import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home_widget.dart';

class HomeController extends GetxController {
  RxInt indexWidget =0.obs;

  void changeIndex(int index){
    indexWidget.value = index;
  }

  final List<Widget> myWidgets = [
    HomeWidget(),
  ];
}
