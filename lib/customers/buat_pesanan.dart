import 'package:flutter/material.dart';
import 'package:wesend/customers/homepage.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuatPesanan extends StatefulWidget {
  const BuatPesanan({Key? key}) : super(key: key);
  @override
  State<BuatPesanan> createState() => _BuatPesananState();
}

final db = FirebaseFirestore.instance;
String? value;
String? dikirimDari;
String? alamatTujuan;
String? namaLengkap;
String? nomorHp;
String? alamatLengkap;
File? fotoBarang;

class _BuatPesananState extends State<BuatPesanan> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(15),
    textStyle: const TextStyle(fontSize: 24),
    primary: const Color.fromARGB(255, 160, 149, 237),
    fixedSize: const Size.fromWidth(278),
  );

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      return AlertDialog(
        title: const Text('Failed to pick image'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Error: $e')],
          ),
        ),
      );
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      return AlertDialog(
        title: const Text('Failed to pick image'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Error: $e')],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buat Pesanan", style: TextStyle(fontSize: 28)),
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
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 169, 159, 231),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color.fromARGB(255, 160, 149, 237),
                          width: 2,
                        )
                        // color: Color.fromARGB(255, 167, 81, 81),

                        ),
                    height: 230,
                    width: 580,
                    // color: const Color.fromARGB(255, 169, 159, 231),
                    // padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          const Text("Masukan Data Barang",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                // DIKIRIM DARI
                                Container(
                                  color: Colors.white,
                                  child: TextField(
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Dikirim dari'),
                                    style: const TextStyle(fontSize: 20),
                                    onChanged: (String _val) {
                                      dikirimDari = _val;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // ALAMAT TUJUAN
                                Container(
                                  color: Colors.white,
                                  child: TextField(
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Alamat tujuan'),
                                    style: const TextStyle(fontSize: 20),
                                    onChanged: (String _val) {
                                      alamatTujuan = _val;
                                    },
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // FIELD NAMA LENGKAP
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Nama Lengkap',
                                hintText: 'Masukan nama lengkap',
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 20),
                              onChanged: (String _val) {
                                namaLengkap = _val;
                              },
                            ),
                          ),

                          // FIELD NO HP
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'No Telepon',
                                hintText: 'Masukan nomor telepon',
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 20),
                              onChanged: (String _val) {
                                nomorHp = _val;
                              },
                            ),
                          ),

                          // FIELD ALAMAT
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Alamat Lengkap',
                                hintText: 'Masukan alamat lengkap',
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              style: const TextStyle(fontSize: 20),
                              onChanged: (String _val) {
                                alamatLengkap = _val;
                              },
                            ),
                          ),

                          // FOTO
                          Container(
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Masukan Foto Barang",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 118, 116, 116))),
                                  IconButton(
                                      onPressed: () {
                                        pickImageC();
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        size: 40,
                                      ))
                                ],
                              )),
                          Container(
                            child: image != null
                                ? Image.file(image!)
                                : const Text("No image selected",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 118, 116, 116))),
                          ),
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const SizedBox(height: 20),
                          ),

                          // BUTTON BUAT PESANAN
                          ElevatedButton(
                            onPressed: () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const HomePageCustomer();
                              })),
                              db.collection('orders').add({
                                'alamat': alamatLengkap,
                                'no_telepon': nomorHp,
                                'penerima': namaLengkap,
                                'penjemputan': dikirimDari,
                                'tujuan': alamatTujuan,
                                'foto_barang': image
                              })
                            },
                            child: const Text("BUAT PESANAN"),
                            style: style,
                          ),
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
