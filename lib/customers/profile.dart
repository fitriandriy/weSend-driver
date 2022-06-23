import 'package:flutter/material.dart';
import 'package:wesend/customers/homepage.dart';
import 'package:wesend/customers/chat.dart';
import 'package:wesend/landing_page.dart';

void main() {
  runApp(const ProfileCustomer());
}

class ProfileCustomer extends StatefulWidget {
  const ProfileCustomer({Key? key}) : super(key: key);

  @override
  State<ProfileCustomer> createState() => _ProfileCustomerState();
}

class _ProfileCustomerState extends State<ProfileCustomer> {
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
      return const ProfileCustomer();
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
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFIL", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color.fromARGB(255, 160, 149, 237),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: (10.0), top: (20.0)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/fotoProfile.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Fitri Andriyani",
                      style: TextStyle(fontSize: 28, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(
                              'fitriandri@gmail.com',
                              style: TextStyle(
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
                    width: 2,
                  )),
              child: Column(children: const [
                ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Nama', style: TextStyle(fontSize: 20)),
                    subtitle: Text('Fitri Andriyani',
                        style: TextStyle(fontSize: 20))),
                Divider(),
                ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email', style: TextStyle(fontSize: 20)),
                    subtitle: Text('fitriandri@gmail.com',
                        style: TextStyle(fontSize: 20))),
                Divider(),
                ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('No. Telepon', style: TextStyle(fontSize: 20)),
                    subtitle:
                        Text('+6285232128433', style: TextStyle(fontSize: 20))),
                Divider(),
                ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Alamat', style: TextStyle(fontSize: 20)),
                    subtitle:
                        Text('Jl. Menanjak', style: TextStyle(fontSize: 20))),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LandingPage();
                  }));
                },
                style: style,
                child: const Text("Logout")),
          ),
          const SizedBox(
            height: 365,
          ),
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromARGB(255, 160, 149, 237),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 40), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wechat, size: 40), label: 'chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.manage_accounts, size: 40),
                    label: 'account'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              onTap: _onItemTapped),
        ],
      ),
    );
  }
}
