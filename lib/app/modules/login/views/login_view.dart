import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:guru_project/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';



// Color orangeColors = const Color(0xffF5591F);
// Color orangeLightColors = const Color(0xffF2861E);
Color orangeColors = const Color(0xFFE52027);
Color orangeLightColors = const Color(0xFF831217);

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer(),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        controller: controller.emailC,
                        hint: "Enter your Email",
                        icon: Icons.email,
                        obsecure: false),
                    _textInput(
                        controller: controller.passC,
                        hint: "Password",
                        icon: Icons.vpn_key,
                        obsecure: true),
                    Obx(
                      () => ElevatedButton(
                        onPressed: () async {
                          if (controller.isLoading.isFalse) {
                            await controller.login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(controller.isLoading.isFalse
                            ? "Login"
                            : "LOADING..."),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: TextButton( onPressed: ()=> Get.toNamed(Routes.FORGOT_PASSWORD),
                          child: const Text("Forgot Password?"),
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Signup",
                            style: TextStyle(color: orangeColors)),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textInput({
    controller,
    hint,
    icon,
    obsecure,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        autocorrect: false,
        obscureText: obsecure,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              // colors: [orangeColors, orangeLightColors],
              colors: [Colors.indigo.shade400, Colors.indigo.shade300],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          const Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          // Center(
          //   child: Image.network(
          //     "https://picsum.photos/200/300",
          //     fit: BoxFit.cover,
          //     height: 100,
          //     width: 100,
          //   ),
          // ),
        ],
      ),
    );
  }
}
