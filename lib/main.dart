import 'package:flutter/material.dart';

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
          title: Text("Cashy"),
          backgroundColor: Colors.red
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 0),
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/ic_payment.jpg'),
                ),
                Text("Rich Together"),
                Text("Save your money little bit")
              ],
            ),
          )
        ),
      ),
    );
  }
}
