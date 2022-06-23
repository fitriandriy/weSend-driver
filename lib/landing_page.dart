// import 'dart:ui';
import 'package:wesend/auth/register_page.dart';
import 'package:wesend/auth/login_page.dart';
import 'package:flutter/material.dart';
// import 'package:wesend/login_page.dart';
// import 'package:wesend/sign_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 24),
        primary: const Color.fromARGB(255, 160, 149, 237),
        fixedSize: const Size.fromWidth(378),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

    return Scaffold(
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 184, 181, 255),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/driver-icon.png'),
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: (ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      style: style,
                      child: const Text("MASUK")))),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: (ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RegisterPage();
                        }));
                      },
                      style: style,
                      child: const Text("DAFTAR")))),
            ],
          ),
        ),
      ),
    );
  }
}
