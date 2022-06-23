import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wesend/auth/login_page.dart';
import 'package:wesend/customers/homepage.dart';
import 'package:wesend/customers/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({required this.user, Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final db = FirebaseFirestore.instance;
String? noTelepon;
String? alamat;

class _ProfilePageState extends State<ProfilePage> {
  // bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  final ButtonStyle style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 20),
      primary: const Color.fromARGB(255, 160, 149, 237),
      fixedSize: const Size.fromWidth(158),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  toHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePageCustomer();
    }));
  }

  toChatPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const Chat();
    }));
  }

  toProfilePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }

  int _selectedIndex = 2;

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
        title: const Text("PROFIL", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color.fromARGB(255, 160, 149, 237),
      ),
      body: Center(
        child: ListView(
          children: [
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: (10.0), top: (20.0)),
                    child: Icon(Icons.account_circle_rounded,
                        size: 80, color: Color.fromARGB(255, 135, 134, 134))),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_currentUser.displayName}",
                        style:
                            const TextStyle(fontSize: 28, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                '${_currentUser.email}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Tentang',
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: const Color.fromARGB(255, 160, 149, 237),
                        width: 2)),
                child: Column(children: [
                  ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Nama', style: TextStyle(fontSize: 20)),
                      subtitle: Text('${_currentUser.displayName}',
                          style: const TextStyle(fontSize: 20))),
                  const Divider(),
                  ListTile(
                      leading: const Icon(Icons.email),
                      title:
                          const Text('Email', style: TextStyle(fontSize: 20)),
                      subtitle: Text('${_currentUser.email}',
                          style: const TextStyle(fontSize: 20))),
                  const Divider(),
                  StreamBuilder(
                      stream: db.collection('customers').snapshots(),
                      builder: (BuildContext contect, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, int index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.docs[index];

                            if (snapshot.data.docs[index]['nama'] ==
                                '${_currentUser.displayName}') {
                              return Column(
                                children: [
                                  ListTile(
                                      leading: const Icon(Icons.phone),
                                      title: const Text('No. Telepon',
                                          style: TextStyle(fontSize: 20)),
                                      subtitle: Text(
                                          documentSnapshot['no_telepon'],
                                          style:
                                              const TextStyle(fontSize: 20))),
                                  const Divider(),
                                  ListTile(
                                      leading: const Icon(Icons.home),
                                      title: const Text('Alamat',
                                          style: TextStyle(fontSize: 20)),
                                      subtitle: Text(documentSnapshot['alamat'],
                                          style:
                                              const TextStyle(fontSize: 20))),
                                ],
                              );
                            } else {
                              return Stack(
                                children: [
                                  Container(width: 0.5, color: Colors.white)
                                ],
                              );
                            }
                          },
                        );
                      })
                ]),
              ),
            ),

            // LOGOUT BUTTON
            _isSigningOut
                ? const CircularProgressIndicator()
                : Container(
                    margin: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await FirebaseAuth.instance.signOut();
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text('KELUAR'),
                      style: style,
                    ),
                  )
          ],
        ),
      ),

      // BOTTOM NAVBAR
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
