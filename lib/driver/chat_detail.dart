import 'package:flutter/material.dart';
import 'package:wesend/driver/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesend/main.dart';

class ChatDetail extends StatefulWidget {
  final int index;
  const ChatDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

String? pesan;

class _ChatDetailState extends State<ChatDetail> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(15),
    textStyle: const TextStyle(fontSize: 20),
    primary: const Color.fromARGB(255, 160, 149, 237),
    fixedSize: const Size.fromWidth(250),
  );

  late int _currentIndex;

  var _valGender;
  var beratBarang;

  final List _listGender = [
    " Driver di perjalanan",
    " Barang sedang diantar",
    " Barang sampai"
  ];

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PESAN", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color.fromARGB(255, 160, 149, 237),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            StreamBuilder(
              // Reading Items form our Database Using the StreamBuilder widget
              stream: db.collection('chat').snapshots(),
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
                                      //               const SizedBox(height: 10),
                                      //               const Text("Data Barang",
                                      //                   textAlign: TextAlign.center,
                                      //                   style: TextStyle(
                                      //                       fontSize: 24,
                                      //                       color: Colors.white,
                                      //                       fontWeight: FontWeight.w600)),
                                      //               const SizedBox(height: 20),
                                      //               ListTile(
                                      //                   textColor: Colors.white,
                                      //                   iconColor: Colors.white,
                                      //                   leading: const Icon(
                                      //                       Icons.location_on_sharp),
                                      //                   title: const Text('Dikirim Dari',
                                      //                       style: TextStyle(
                                      //                           fontSize: 20,
                                      //                           fontWeight: FontWeight.w600)),
                                      //                   subtitle: Text(
                                      //                       documentSnapshot['penjemputan'],
                                      //                       style: const TextStyle(
                                      //                           fontSize: 20))),
                                      //               const Divider(),
                                      //               ListTile(
                                      //                   textColor: Colors.white,
                                      //                   iconColor: Colors.white,
                                      //                   leading:
                                      //                       const Icon(Icons.monitor_weight),
                                      //                   title: const Text('Berat Barang',
                                      //                       style: TextStyle(
                                      //                           fontSize: 20,
                                      //                           fontWeight: FontWeight.w600)),
                                      //                   subtitle: Text(
                                      //                       documentSnapshot['berat_barang']
                                      //                               .toString() +
                                      //                           ' kg',
                                      //                       style: const TextStyle(
                                      //                           fontSize: 20))),
                                      //               const Divider(),
                                      //               ListTile(
                                      //                   textColor: Colors.white,
                                      //                   iconColor: Colors.white,
                                      //                   leading:
                                      //                       const Icon(Icons.monetization_on),
                                      //                   title: const Text('Biaya',
                                      //                       style: TextStyle(
                                      //                           fontSize: 20,
                                      //                           fontWeight: FontWeight.w600)),
                                      //                   subtitle: Text(
                                      //                       'Rp. ' +
                                      //                           (documentSnapshot[
                                      //                                       'berat_barang'] *
                                      //                                   4000)
                                      //                               .toString(),
                                      //                       style: const TextStyle(
                                      //                           fontSize: 20))),
                                      //               const Divider(),
                                      //             ],
                                      //           ),
                                      //         ))),
                                      // Text(
                                      //   "\nData diri penerima\n",
                                      //   style:
                                      //       TextStyle(fontSize: 20, color: Colors.grey[600]),
                                      // ),
                                      // ListTile(
                                      //     leading: const Icon(Icons.person),
                                      //     title: const Text('Nama',
                                      //         style: TextStyle(fontSize: 20)),
                                      //     subtitle: Text(documentSnapshot['penerima'],
                                      //         style: const TextStyle(fontSize: 20))),
                                      // const Divider(),
                                      // ListTile(
                                      //     leading: const Icon(Icons.phone),
                                      //     title: const Text('Nomor HP',
                                      //         style: TextStyle(fontSize: 20)),
                                      //     subtitle: Text(documentSnapshot['no_telepon'],
                                      //         style: const TextStyle(fontSize: 20))),
                                      // const Divider(),
                                      // ListTile(
                                      //     leading: const Icon(Icons.house),
                                      //     title: const Text('Alamat',
                                      //         style: TextStyle(fontSize: 20)),
                                      //     subtitle: Text(documentSnapshot['alamat'],
                                      //         style: const TextStyle(fontSize: 20))),
                                      // const Divider(),
                                      // Positioned(
                                      //     top: 10,
                                      //     left: 10,
                                      //     child: Container(
                                      //         height: 250,
                                      //         width: 580,
                                      //         color: const Color.fromARGB(255, 255, 255, 255),
                                      //         padding: const EdgeInsets.all(20),
                                      //         child: Center(
                                      //           child: ListView(
                                      //             children: [
                                      //               const Text('Masukan data berikut',
                                      //                   textAlign: TextAlign.center,
                                      //                   style: TextStyle(
                                      //                       fontSize: 20,
                                      //                       color: Color.fromARGB(
                                      //                           255, 100, 95, 95))),
                                      //               const SizedBox(
                                      //                 height: 20,
                                      //               ),
                                      //               Row(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment.spaceBetween,
                                      //                 children: [
                                      //                   Expanded(
                                      //                     child: TextField(
                                      //                       obscureText: false,
                                      //                       decoration: InputDecoration(
                                      //                         border: OutlineInputBorder(
                                      //                             borderRadius:
                                      //                                 BorderRadius.circular(
                                      //                                     10)),
                                      //                         labelText: 'Berat barang (kg)',
                                      //                         hintText: 'Dalam kg',
                                      //                       ),
                                      //                       style:
                                      //                           const TextStyle(fontSize: 20),
                                      //                       onChanged: (value) {
                                      //                         setState(() {
                                      //                           beratBarang = value;
                                      //                         });
                                      //                       },
                                      //                     ),
                                      //                   ),
                                      //                   const SizedBox(
                                      //                     width: 25,
                                      //                   ),
                                      //                   Expanded(
                                      //                     child: Container(
                                      //                       height: 63,
                                      //                       decoration: BoxDecoration(
                                      //                           color: Colors.white,
                                      //                           borderRadius:
                                      //                               BorderRadius.circular(10),
                                      //                           border: Border.all(
                                      //                             color: const Color.fromARGB(
                                      //                                 255, 160, 149, 237),
                                      //                             width: 1,
                                      //                           )),
                                      //                       child:
                                      //                           DropdownButtonHideUnderline(
                                      //                         child: DropdownButton(
                                      //                           hint: const Text(
                                      //                               " Pilih status",
                                      //                               style: TextStyle(
                                      //                                   fontSize: 20)),
                                      //                           value: _valGender,
                                      //                           items:
                                      //                               _listGender.map((value) {
                                      //                             return DropdownMenuItem(
                                      //                               child: Text(
                                      //                                 value,
                                      //                                 style: const TextStyle(
                                      //                                     fontSize: 20,
                                      //                                     color:
                                      //                                         Color.fromARGB(
                                      //                                             255,
                                      //                                             78,
                                      //                                             74,
                                      //                                             74)),
                                      //                               ),
                                      //                               value: value,
                                      //                             );
                                      //                           }).toList(),
                                      //                           onChanged: (value) {
                                      //                             setState(() {
                                      //                               _valGender =
                                      //                                   value; //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                      //                             });
                                      //                           },
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               const SizedBox(
                                      //                 height: 20,
                                      //               ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // ElevatedButton(
                                          //   onPressed: () => {
                                          //     Navigator.push(context,
                                          //         MaterialPageRoute(
                                          //             builder: (context) {
                                          //       return const Chat();
                                          //     }))
                                          //   },
                                          //   child: const Text("CHAT PELANGGAN"),
                                          //   style: style,
                                          // ),
                                          // ElevatedButton(
                                          //   style: style,
                                          //   child: const Text("SIMPAN",
                                          //       style: TextStyle(
                                          //           color: Color.fromARGB(
                                          //               255, 255, 255, 255))),
                                          //   onPressed: () {
                                          //     if (documentSnapshot[
                                          //             'berat_barang'] ==
                                          //         0) {
                                          //       db
                                          //           .collection('orders')
                                          //           .doc(documentSnapshot.id)
                                          //           .update({
                                          //         'berat_barang':
                                          //             int.parse(beratBarang)
                                          //       });
                                          //     }

                                          //     db
                                          //         .collection('orders')
                                          //         .doc(documentSnapshot.id)
                                          //         .update(
                                          //             {'status': _valGender});

                                          //     showDialog(
                                          //         context: context,
                                          //         builder:
                                          //             (BuildContext context) {
                                          //           return const AlertDialog(
                                          //             title: Text("Success"),
                                          //             content: Text(
                                          //                 "Saved successfully"),
                                          //           );
                                          //         });
                                          //   },
                                          // ),
                                          TextField(
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: 'Tulis pesan..',
                                            ),
                                            style:
                                                const TextStyle(fontSize: 20),
                                            onChanged: (String _val) {
                                              pesan = _val;
                                            },
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                int count = 1;
                                                db.collection('chat').add({
                                                  '$count': pesan,
                                                });

                                                count += 2;
                                              },
                                              icon: const Icon(
                                                  Icons.send_rounded,
                                                  color: Color.fromARGB(
                                                      255, 160, 149, 237)))
                                        ],
                                      ),
                                    ],
                                  ),
                                ))),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
