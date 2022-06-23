import 'package:flutter/material.dart';
import 'package:wesend/driver/chat.dart';

class DetilePesananCust extends StatefulWidget {
  const DetilePesananCust({Key? key}) : super(key: key);

  @override
  State<DetilePesananCust> createState() => _DetilePesananCustState();
}

class _DetilePesananCustState extends State<DetilePesananCust> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(15),
    textStyle: const TextStyle(fontSize: 24),
    primary: const Color.fromARGB(255, 160, 149, 237),
    fixedSize: const Size.fromWidth(278),
  );

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
        title: const Text("DETAIL", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color.fromARGB(255, 160, 149, 237),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                    height: 230,
                    width: 580,
                    color: const Color.fromARGB(255, 169, 159, 231),
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          const Text("Data Barang",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: const TextField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Dikirim dari'),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  color: Colors.white,
                                  child: const TextField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Alamat tujuan'),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))),
            Text(
              "\nData diri penerima\n",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            Positioned(
                child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nama Lengkap'),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nomor Handphone'),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Alamat Lengkap'),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Foto Barang'),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: Column(
                              children: const [
                                Text("Foto Barang",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 78, 74, 74))),
                              ],
                            ),
                          ),
                          const Text(
                            "Masukan data barang",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 78, 74, 74)),
                          ),
                          Container(
                              height: 250,
                              width: 580,
                              color: Colors.white,
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Column(
                                  children: [
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
                                                  labelText:
                                                      'Berat barang (kg)',
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Expanded(
                                              child: DropdownButton(
                                                hint: const Text("Pilih status",
                                                    style: TextStyle(
                                                        fontSize: 20)),
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
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const AlertDialog(
                                                title: Text("Success"),
                                                content:
                                                    Text("Saved successfully"),
                                              );
                                            });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () => {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const Chat();
                                        }))
                                      },
                                      child: const Text("KIRIM PESAN"),
                                      style: style,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
