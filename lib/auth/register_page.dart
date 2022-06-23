import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wesend/auth/profile_page.dart';
import 'package:wesend/auth/validator.dart';
import 'package:wesend/auth/fire_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  final db = FirebaseFirestore.instance;
  String? namaLengkap;
  String? email;
  String? password;
  String? alamat;
  String? nomorHp;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 160, 149, 237),
        fixedSize: const Size.fromWidth(150),
        textStyle: const TextStyle(fontSize: 24),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));

    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Image.asset('images/driver-icon-white.png',
                        height: 350)),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      // FORM NAMA
                      TextFormField(
                        controller: _nameTextController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(
                          name: value,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Nama Lengkap',
                          hintText: 'Masukan nama lengkap',
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        onChanged: (String _val) {
                          namaLengkap = _val;
                        },
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16.0),

                      // FORM EMAIL
                      TextFormField(
                        controller: _emailTextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(
                          email: value,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Email',
                          hintText: 'Masukan email',
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        onChanged: (String _val) {
                          email = _val;
                        },
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16.0),

                      // FORM PASSWORD
                      TextFormField(
                        controller: _passwordTextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(
                          password: value,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Password',
                          hintText: 'Masukan password',
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        onChanged: (String _val) {
                          password = _val;
                        },
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16.0),

                      // FORM ALAMAT
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Alamat Lengkap',
                          hintText: 'Masukan alamat anda',
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        onChanged: (String _val) {
                          alamat = _val;
                        },
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16.0),

                      // FORM NOMOR HP
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'No Telepon',
                          hintText: 'Masukan nomor telepon',
                          errorBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        onChanged: (String _val) {
                          nomorHp = _val;
                        },
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 32.0),

                      // IS PROCESSING?
                      _isProcessing
                          ? const CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  // TOMBOL DAFTAR
                                  child: ElevatedButton(
                                    style: style,
                                    onPressed: () async {
                                      setState(() {
                                        _isProcessing = true;
                                      });

                                      if (_registerFormKey.currentState!
                                          .validate()) {
                                        User? user = await FireAuth
                                            .registerUsingEmailPassword(
                                          name: _nameTextController.text,
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text,
                                        );

                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        if (user != null) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage(user: user),
                                            ),
                                            ModalRoute.withName('/'),
                                          );
                                        }
                                      }

                                      db.collection('customers').add({
                                        'nama': namaLengkap,
                                        'email': email,
                                        'password': password,
                                        'alamat': alamat,
                                        'no_telepon': nomorHp
                                      });
                                    },
                                    child: const Text(
                                      'DAFTAR',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
