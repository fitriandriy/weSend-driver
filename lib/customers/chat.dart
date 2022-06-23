import 'package:flutter/material.dart';
import 'package:wesend/auth/login_page.dart';
import 'package:wesend/customers/homepage.dart';
// import 'package:google_fonts/google_fonts.dart';

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
          title: const Text(
            "CHAT", style: TextStyle(fontSize: 30),
            // style: GoogleFonts.galada(fontSize: 30),
          )),
      body: Center(
        child: ListView(
          addAutomaticKeepAlives: mounted,
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                  tileColor: Color.fromARGB(255, 255, 255, 255),
                  title: Text(
                    "Na Jaemin",
                    style: TextStyle(
                        backgroundColor: Color.fromARGB(255, 147, 237, 148),
                        fontSize: 24),
                  ),
                  subtitle: Text(
                    "Haloo, barang diantar ke rumah dekat jalan besar ya",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.person),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                  tileColor: Color.fromARGB(255, 255, 255, 255),
                  title: Text(
                    "Na Jaemin",
                    style: TextStyle(
                        backgroundColor: Color.fromARGB(255, 237, 147, 147),
                        fontSize: 24),
                  ),
                  subtitle: Text(
                    "Haloo, barang diantar ke rumah dekat jalan besar ya",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.person),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                  tileColor: Color.fromARGB(255, 255, 255, 255),
                  title: Text(
                    "Na Jaemin",
                    style: TextStyle(
                        backgroundColor: Color.fromARGB(255, 169, 147, 237),
                        fontSize: 24),
                  ),
                  subtitle: Text(
                    "Haloo, barang diantar ke rumah dekat jalan besar ya",
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.person),
                  )),
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
