import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wesend/auth/login_page.dart';
import 'package:wesend/driver/homepage.dart';

import 'message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  int _selectedIndex = 1;

  toHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePageDriver();
    }));
  }

  toChatPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ChatPage();
    }));
  }

  toProfilePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      toHomePage();
    } else if (_selectedIndex == 1) {
      toChatPage();
    } else if (_selectedIndex == 2) {
      toProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OBROLAN", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color.fromARGB(255, 160, 149, 237),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.79,
                child: messages(
                  email: 'Driver',
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: message,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 206, 198, 255),
                        hintText: 'Tulis pesan..',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 160, 149, 237)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 160, 149, 237)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSaved: (value) {
                        message.text = value!;
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (message.text.isNotEmpty) {
                        fs.collection('Messages').doc().set({
                          'message': message.text.trim(),
                          'time': DateTime.now(),
                          'email': 'Driver',
                        });

                        message.clear();
                      }
                    },
                    icon: const Icon(Icons.send_sharp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 160, 149, 237),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 40), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wechat, size: 40), label: 'chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts, size: 40), label: 'account'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped),
    );
  }
}
