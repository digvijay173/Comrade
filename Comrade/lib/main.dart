import 'package:Comrade/home.dart';
import 'package:flutter/material.dart';
//import 'package:Comrade/signin.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
