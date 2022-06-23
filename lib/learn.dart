import 'package:flutter/material.dart';

// void main() => run(MyApp());

void main() {
  runApp(const MyApp());
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Hello World"),
      ),
      body: Center(
          child: Container(
              color: Colors.indigo[200],
              width: 150,
              height: 50,
              child: Text(
                "Hellooo",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[800]),
              ))),
    ));
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ini Latihan Row dan Column"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Text("Teks 1"),
                Text("Text 2"),
                Text("Text 3")
              ],
            ),
            Column(
              children: <Widget>[
                Text("Teks 4"),
                Text("Text 5"),
                Text("Text 6")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Latihan Container"),
      ),
      body: Container(
        color: Colors.indigo[200],
        margin: EdgeInsets.all(5),
      ),
    ));
  }
}




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  void tekanTombol() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Ini Statefull Widget"),
          ),
          body: Center(
            child: Column(children: [
              Text(number.toString()),
              ElevatedButton(
                onPressed: tekanTombol,
                child: Text("Tekan aku!"),
              )
            ]),
          )),
    );
  }
}
*/

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = "Ini adalah Text";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Anonymous Method"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        message = "Tombol sudah ditekan.";
                      });
                    },
                    child: const Text("Tekan Saya!"))
              ],
            ),
          )),
    );
  }
}
