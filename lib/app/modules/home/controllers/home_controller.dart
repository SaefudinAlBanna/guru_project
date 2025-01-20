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
    Center(
      child: Text('ABSEN', style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),),
    ),
    Center(
      child: SizedBox(
        height: 200,
        width: 300,
        child: Card(
          color: Colors.blue,
          borderOnForeground: true,
          child: Center(
            child: Text('PROFILE', style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
    ),

  ];
}
