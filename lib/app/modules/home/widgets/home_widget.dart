import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Muhammad Jaber',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[400],
        leading: Container(
          height: 75,
          width: 75,
          margin: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey[350],
            image: DecorationImage(
                image: NetworkImage("https://picsum.photos/id/91/367/267")),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.TAMBAH_PEGAWAI),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClassClipPathTop(),
            child: Container(
              height: 250,
              width: Get.width,
              color: Colors.indigo[400],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Column(
                  children: [
                    ClipPath(
                      clipper: ClipPathClass(),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        height: 215,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade200,
                              Colors.blue.shade400
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '07:00:02',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Masuk',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Icon(Icons.alarm, size: 45),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '14:10:02',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Pulang',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Divider(
                              height: 2,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            Center(
                              child: Container(
                                height: 33,
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber,
                                ),
                                child: Center(
                                  child: Text(
                                    'Durasi Kerja : 00.00.00 Jam',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TxtBtnKelas(kelasnya: 'Kelas 2A'),
                                  TxtBtnKelas(kelasnya: 'Kelas 3B'),
                                  TxtBtnKelas(kelasnya: 'Kelas 5B'),
                                  TxtBtnKelas(kelasnya: 'Kelas 6A'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 3,
                  color: Colors.black,
                ),
                SizedBox(height: 25),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => Get.snackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.brown.shade400,
                                  "DASHBOARD",
                                  "Nanti akan popup page sesuai dengan ketentuan"),
                                child: ColumnMenuTengah(
                                  icon:
                                      Icon(Icons.dashboard_outlined, size: 45),
                                  judulbawah: 'DASHBOARD',
                                ),
                              ),


                              GestureDetector(
                                onTap: () => Get.snackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.brown.shade400,
                                  "PILIHAN A",
                                  "Nanti akan popup page sesuai dengan ketentuan"),
                                child: ColumnMenuTengah(
                                  icon:
                                      Icon(Icons.calendar_month_outlined, size: 45),
                                  judulbawah: 'PILIHAN A',
                                ),
                              ),


                              GestureDetector(
                                onTap: () => Get.snackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.brown.shade400,
                                  "PILIHAN B",
                                  "Nanti akan popup page sesuai dengan ketentuan"),
                                child: ColumnMenuTengah(
                                  icon:
                                      Icon(Icons.facebook_outlined, size: 45),
                                  judulbawah: 'PILIHAN B',
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => Get.snackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.brown.shade400,
                                  "DASHBOARD",
                                  "Nanti akan popup page sesuai dengan ketentuan"),
                                child: ColumnMenuTengah(
                                  icon:
                                      Icon(Icons.dashboard_outlined, size: 45),
                                  judulbawah: 'DASHBOARD',
                                ),
                              ),


                              GestureDetector(
                                onTap: () => Get.snackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.brown.shade400,
                                  "PILIHAN A",
                                  "Nanti akan popup page sesuai dengan ketentuan"),
                                child: ColumnMenuTengah(
                                  icon:
                                      Icon(Icons.calendar_month_outlined, size: 45),
                                  judulbawah: 'PILIHAN A',
                                ),
                              ),


                              GestureDetector(
                                onTap: () => Get.snackbar(
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.brown.shade400,
                                  "PILIHAN B",
                                  "Nanti akan popup page sesuai dengan ketentuan"),
                                child: ColumnMenuTengah(
                                  icon:
                                      Icon(Icons.facebook_outlined, size: 45),
                                  judulbawah: 'PILIHAN B',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnMenuTengah extends StatelessWidget {
  const ColumnMenuTengah({
    required this.judulbawah,
    required this.icon,
    super.key,
  });

  final String judulbawah;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: icon,
          ),
        ),
        SizedBox(height: 5),
        Text(judulbawah),
      ],
    );
  }
}

class TxtBtnKelas extends StatelessWidget {
  const TxtBtnKelas({
    super.key,
    required this.kelasnya,
  });

  final String kelasnya;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        kelasnya,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(size.width, size.height - 50);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class ClassClipPathTop extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
