import 'package:flutter/material.dart';
import 'package:gcm_app/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is te root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GCM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightGreen[300]),
      home : LoginScreen(),
    );
  }
}
