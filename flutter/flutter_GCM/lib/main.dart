import 'package:flutter/material.dart';
import 'package:flutter_application_6/home_page.dart';
// import 'package:flutter_application_6/yolo.dart';
import 'package:flutter_application_6/choice.dart';
import 'package:flutter_application_6/video.dart';
import 'package:flutter_application_6/pose.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Body Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/v': (context) => Video(),
        // '/b': (context) => ScreenB(),
        '/c': (context) => Choice2(),
        '/p': (context) => Pose(),
      },
    );
  }
}
