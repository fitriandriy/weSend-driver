import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wesend/driver/homepage.dart';
import 'package:wesend/driver/profile.dart';
// import 'package:wesend/customers/maps.dart';

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
          children: const [
            ListTile(
                title: Text(
                  "Barang Sampai",
                  style: TextStyle(
                      backgroundColor: Color.fromARGB(255, 147, 237, 148),
                      fontSize: 20),
                ),
                subtitle: Text(
                  "Nama: Fitri\nAlamat: Temuguruh\nTujuan: Semu\nBiaya: Rp20.000",
                  style: TextStyle(fontSize: 20),
                ),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.calendar_today),
                ))
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
