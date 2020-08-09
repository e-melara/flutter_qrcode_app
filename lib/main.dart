import 'package:flutter/material.dart';
import 'package:qrcodeapp/src/Home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QrCode Read',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}
