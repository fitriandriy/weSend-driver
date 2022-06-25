import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wesend/auth/login_page.dart';
import 'package:wesend/driver/chat_detail.dart';
import 'package:wesend/driver/homepage.dart';
import 'package:wesend/auth/profile_page.dart';
import 'package:wesend/customers/detile_pesanan.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 20),
      primary: const Color.fromARGB(255, 160, 149, 237),
      fixedSize: const Size.fromWidth(278),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  int _selectedIndex = 1;

  toHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePageDriver();
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

  late DocumentSnapshot documentSnapshot;
  var beratBarang;
  var currentIndex;
  var _valGender;
  final List _listGender = [
    " Driver di perjalanan",
    " Barang sedang diantar",
    " Barang sampai"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 160, 149, 237),
          title: Text(
            "GoSend",
            style: GoogleFonts.galada(fontSize: 30),
          )),
      body: Center(
        child: ListView(
          addAutomaticKeepAlives: mounted,
          children: [
            // LIST PESANAN
            Positioned(
              child: StreamBuilder(
                // Reading Items form our Database Using the StreamBuilder widget
                stream: db.collection('chat').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // NAH BAGIAN INI BUAT NAMPILIN TO DO NYA
                  return SizedBox(
                    height: 550,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, int index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.docs[index];
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(stops: [
                              0.02,
                              0.02
                            ], colors: [
                              Color.fromARGB(255, 160, 149, 237),
                              Colors.white
                            ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),

                          // LIST TILE
                          child: ListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset('images/distance (1).png'),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Driver '),
                                Text(
                                  ' ' + documentSnapshot['status'] + ' ',
                                  style: const TextStyle(
                                      backgroundColor:
                                          Color.fromARGB(255, 160, 149, 237),
                                      color: Colors.white),
                                )
                              ],
                            ),
                            isThreeLine: true,
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Ini Pesan'),
                              ],
                            ),
                            onTap: () {
                              if (currentIndex == null) {
                                setState(() {
                                  this.documentSnapshot = documentSnapshot;
                                });

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Terima Pesanan?'),
                                        content: ElevatedButton(
                                            onPressed: () {
                                              db
                                                  .collection('orders')
                                                  .doc(documentSnapshot.id)
                                                  .update({
                                                'status':
                                                    ' Driver di perjalanan'
                                              });

                                              toHomePage();
                                            },
                                            child: const Text('Terima')),
                                      );
                                    });
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ChatDetail(index: index)));
                              }
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
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
