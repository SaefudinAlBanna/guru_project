import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guru_project/app/modules/home/controllers/home_controller.dart';
import 'package:guru_project/app/routes/app_pages.dart';

class ProfileWidget extends GetView<HomeController> {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[400],
        actions: [
          IconButton(
            onPressed: () => controller.signOut(),
            icon: Icon(
              Icons.logout,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data!.data()!;
            return Stack(
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
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://ui-avatars.com/api/?name=${data['nama']}"),
                                    // "https://photos.google.com/photo/AF1QipO0EuuqmPsza1Ljrdy6roeFI9BbjQ043BrYtxpc"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                data['nama'].toString().toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${data['role']}",
                                style: TextStyle(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: 1.5,
                        color: Colors.grey[400],
                      ),
                      Expanded(
                        child: SafeArea(
                          child: ListView(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Info Pegawai",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => Get.toNamed(Routes.UPDATE_PASSWORD),
                                    icon: Icon(
                                      Icons.vpn_key_outlined,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                    
                                  ),
                                  IconButton(
                                    onPressed: () => Get.toNamed(Routes.UPDATE_PEGAWAI, arguments: data),
                                    icon: Icon(
                                      Icons.change_circle_outlined,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Card(
                                color: Colors.grey[200],
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      ...ListTile.divideTiles(
                                          color: Colors.grey,
                                          tiles: [
                                            ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading: Icon(Icons.key_outlined),
                                              title: Text("NIP / NIK"),
                                              subtitle: Text('${data['nip']}'),
                                            ),
                                            ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading:
                                                  Icon(Icons.email_outlined),
                                              title: Text("Email"),
                                              subtitle:
                                                  Text('${data['email']}'),
                                            ),
                                            const ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading:
                                                  Icon(Icons.male_outlined),
                                              title: Text("Jenis Kelamin"),
                                              subtitle: Text("Laki-Laki"),
                                            ),
                                            const ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading:
                                                  Icon(Icons.bloodtype_rounded),
                                              title: Text("Gol. Darah"),
                                              subtitle: Text("O"),
                                            ),
                                            const ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading: Icon(Icons.my_location),
                                              title: Text("Alamat Domisili"),
                                              subtitle: Text(
                                                  "Pringgolayan RT.08 Banguntapan"),
                                            ),
                                            ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading: Icon(
                                                  Icons.phone_android_outlined),
                                              title: Text("No Hp"),
                                              subtitle: Text('${data['noHp']}'),
                                            ),
                                            const ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading:
                                                  Icon(Icons.man_3_outlined),
                                              title: Text("Nama Ayah"),
                                              subtitle: Text("Saefudin"),
                                            ),
                                            const ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                              leading:
                                                  Icon(Icons.woman_outlined),
                                              title: Text("Nama Ibu"),
                                              subtitle: Text("Jumariyah"),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text('Data tidak ditemukan'),
          );
        },
      ),
    );
  }
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
