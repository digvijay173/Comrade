import 'package:Comrade/home.dart';
import 'package:flutter/material.dart';
//import 'package:Comrade/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      home: Home(),
    );
  }
}
