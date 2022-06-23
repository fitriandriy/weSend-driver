import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wesend/driver/detile_pesanan.dart';
import 'package:wesend/driver/chat.dart';
import 'package:wesend/driver/profile.dart';

class HomePageDriver extends StatefulWidget {
  const HomePageDriver({Key? key}) : super(key: key);

  @override
  State<HomePageDriver> createState() => _HomePageDriverState();
}

class _HomePageDriverState extends State<HomePageDriver> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.white,
      fixedSize: const Size.fromWidth(278),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  int _selectedIndex = 0;

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
      return const ProfileDriver();
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

  // static const List<Widget> _widgetOptions = <Widget>[
  //   HomePageDriver(),
  //   Chat(),
  // ];
  var _valGender;
  final List _listGender = [
    "Driver di perjalanan",
    "Barang sedang diantar",
    "Barang sampai"
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
          padding: const EdgeInsets.all(15),
          children: [
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                    height: 250,
                    width: 580,
                    color: const Color.fromARGB(255, 160, 149, 237),
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          const Text('TUGAS SAAT INI',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: TextField(
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Berat barang (kg)',
                                      ),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Expanded(
                                    child: DropdownButton(
                                      hint: const Text("Pilih status",
                                          style: TextStyle(fontSize: 20)),
                                      value: _valGender,
                                      items: _listGender.map((value) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 78, 74, 74)),
                                          ),
                                          value: value,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _valGender =
                                              value; //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: style,
                            child: const Text("SIMPAN",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 91, 86, 86))),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("Success"),
                                      content: Text("Saved successfully"),
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    ))),
            Text(
              "\nDaftar Pesanan\n",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            Positioned(
                child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("New",
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 255, 161, 161),
                            fontSize: 20)),
                    subtitle: const Text(
                        "Nama: Fitri\nAlamat: Temuguruh\nTujuan: Semu\nBiaya: Rp20.000\n",
                        style: TextStyle(fontSize: 20)),
                    leading: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.calendar_today),
                    ),
                    trailing: const Icon(Icons.more_vert),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DetilePesananCust();
                      }));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "Barang Sampai",
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 147, 237, 148),
                          fontSize: 20),
                    ),
                    subtitle: const Text(
                      "Nama: Fitri\nAlamat: Temuguruh\nTujuan: Semu\nBiaya: Rp20.000",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.calendar_today),
                    ),
                    trailing: const Icon(Icons.more_vert),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DetilePesananCust();
                      }));
                    },
                  ),
                ],
              ),
            )),
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
