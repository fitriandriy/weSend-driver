import 'package:flutter/material.dart';
import 'package:wesend/customers/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesend/customers/buat_pesanan.dart';

class DetilePesananCust extends StatefulWidget {
  final int index;
  const DetilePesananCust({Key? key, required this.index}) : super(key: key);

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

  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

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
            StreamBuilder(
              // Reading Items form our Database Using the StreamBuilder widget
              stream: db.collection('orders').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // NAH BAGIAN INI BUAT NAMPILIN TO DO NYA
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, int _currentIndex) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data.docs[this._currentIndex];
                    return Column(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                                width: 580,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 169, 159, 231),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 160, 149, 237),
                                      width: 2,
                                    )),
                                child: Center(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      const Text("Data Barang",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(height: 20),
                                      ListTile(
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading: const Icon(
                                              Icons.location_on_sharp),
                                          title: const Text('Dikirim Dari',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                          subtitle: Text(
                                              documentSnapshot['penjemputan'],
                                              style: const TextStyle(
                                                  fontSize: 20))),
                                      const Divider(),
                                      ListTile(
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading:
                                              const Icon(Icons.monitor_weight),
                                          title: const Text('Berat Barang',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                          subtitle: Text(
                                              documentSnapshot['penjemputan'],
                                              style: const TextStyle(
                                                  fontSize: 20))),
                                      const Divider(),
                                      ListTile(
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading:
                                              const Icon(Icons.monetization_on),
                                          title: const Text('Biaya',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                          subtitle: Text(
                                              documentSnapshot['penjemputan'],
                                              style: const TextStyle(
                                                  fontSize: 20))),
                                      const Divider(),
                                    ],
                                  ),
                                ))),
                        Text(
                          "\nData diri penerima\n",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[600]),
                        ),
                        ListTile(
                            leading: const Icon(Icons.person),
                            title: const Text('Nama',
                                style: TextStyle(fontSize: 20)),
                            subtitle: Text(documentSnapshot['penerima'],
                                style: const TextStyle(fontSize: 20))),
                        const Divider(),
                        ListTile(
                            leading: const Icon(Icons.phone),
                            title: const Text('Nomor HP',
                                style: TextStyle(fontSize: 20)),
                            subtitle: Text(documentSnapshot['no_telepon'],
                                style: const TextStyle(fontSize: 20))),
                        const Divider(),
                        ListTile(
                            leading: const Icon(Icons.house),
                            title: const Text('Alamat',
                                style: TextStyle(fontSize: 20)),
                            subtitle: Text(documentSnapshot['alamat'],
                                style: const TextStyle(fontSize: 20))),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Chat();
                            }))
                          },
                          child: const Text("CHAT KURIR"),
                          style: style,
                        ),
                      ],
                      // LIST TILE
                      // child: ListTile(
                      //   leading: SizedBox(
                      //     width: 50,
                      //     height: 50,
                      //     child: Image.asset('images/distance (1).png'),
                      //   ),
                      //   title: const Text('Driver '),
                      //   isThreeLine: true,
                      //   subtitle: Text('dari ' +
                      //       documentSnapshot['penjemputan'] +
                      //       '\nmenuju ' +
                      //       documentSnapshot['tujuan']),
                      //   onTap: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) =>
                      //             DetilePesananCust(index: _currentIndex)));
                      //   },
                      // ),
                    );
                  },
                );
              },
            ),
            // Positioned(
            //     top: 10,
            //     left: 10,
            //     child: Container(
            //         height: 230,
            //         width: 580,
            //         color: const Color.fromARGB(255, 169, 159, 231),
            //         padding: const EdgeInsets.all(20),
            //         child: Center(
            //           child: Column(
            //             children: [
            //               const Text("Data Barang",
            //                   style: TextStyle(
            //                       fontSize: 24,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.w600)),
            //               Container(
            //                 margin: const EdgeInsets.all(10),
            //                 child: Column(
            //                   children: [
            //                     Container(
            //                       color: Colors.white,
            //                       child: const TextField(
            //                         obscureText: false,
            //                         decoration: InputDecoration(
            //                             border: OutlineInputBorder(),
            //                             labelText: 'penjemputan'),
            //                         style: TextStyle(fontSize: 20),
            //                       ),
            //                     ),
            //                     const SizedBox(height: 10),
            //                     Container(
            //                       color: Colors.white,
            //                       child: const TextField(
            //                         obscureText: false,
            //                         decoration: InputDecoration(
            //                             border: OutlineInputBorder(),
            //                             labelText: 'Alamat tujuan'),
            //                         style: TextStyle(fontSize: 20),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ))),
            // Text(
            //   "\nData diri penerima\n",
            //   style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            // ),
            // Positioned(
            //     child: Container(
            //         color: Colors.white,
            //         padding: const EdgeInsets.all(20),
            //         child: Center(
            //           child: Column(
            //             children: [
            //               Container(
            //                 color: Colors.white,
            //                 margin: const EdgeInsets.only(bottom: 10),
            //                 child: const TextField(
            //                   obscureText: false,
            //                   decoration: InputDecoration(
            //                       border: OutlineInputBorder(),
            //                       labelText: 'Nama Lengkap'),
            //                   style: TextStyle(fontSize: 20),
            //                 ),
            //               ),
            //               Container(
            //                 color: Colors.white,
            //                 margin: const EdgeInsets.only(bottom: 10),
            //                 child: const TextField(
            //                   obscureText: false,
            //                   decoration: InputDecoration(
            //                       border: OutlineInputBorder(),
            //                       labelText: 'Nomor Handphone'),
            //                   style: TextStyle(fontSize: 20),
            //                 ),
            //               ),
            //               Container(
            //                 color: Colors.white,
            //                 margin: const EdgeInsets.only(bottom: 10),
            //                 child: const TextField(
            //                   obscureText: false,
            //                   decoration: InputDecoration(
            //                       border: OutlineInputBorder(),
            //                       labelText: 'Alamat Lengkap'),
            //                   style: TextStyle(fontSize: 20),
            //                 ),
            //               ),
            //               Container(
            //                 color: Colors.white,
            //                 margin: const EdgeInsets.only(bottom: 10),
            //                 child: const TextField(
            //                   obscureText: false,
            //                   decoration: InputDecoration(
            //                       border: OutlineInputBorder(),
            //                       labelText: 'Foto Barang'),
            //                   style: TextStyle(fontSize: 20),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 100,
            //                 child: Column(
            //                   children: const [
            //                     Text("Foto Barang"),
            //                   ],
            //                 ),
            //               ),
            //               ElevatedButton(
            //                 onPressed: () => {
            //                   Navigator.push(context,
            //                       MaterialPageRoute(builder: (context) {
            //                     return const Chat();
            //                   }))
            //                 },
            //                 child: const Text("CHAT KURIR"),
            //                 style: style,
            //               )
            //             ],
            //           ),
            //         ))),
          ],
        ),
      ),
    );
  }
}
