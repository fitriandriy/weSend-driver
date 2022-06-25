import 'package:flutter/material.dart';
import 'package:wesend/auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCCEZnhniUUlnv0YR2GUgfi0c0qu2J_Gc8",
    appId: "1:1052204447411:android:d13f513fe11a60d08062c6",
    messagingSenderId: "1052204447411",
    projectId: "wesend-53f32",
  ));
  runApp(const MyApp());
}

final db = FirebaseFirestore.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
