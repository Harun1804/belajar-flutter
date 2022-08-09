import 'package:flutter/material.dart';
import 'font_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cashy"),
          backgroundColor: Colors.red
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0),
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/ic_payment.jpg'),
                ),
                Text("Rich Together", style: mainHeader),
                Text("Save your money little bit",style: subHeader,)
              ],
            ),
          )
        ),
      ),
    );
  }
}
