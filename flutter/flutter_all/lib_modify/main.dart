import 'package:flutter/material.dart';
import 'package:gcm_app/chat_screen.dart';
import 'package:gcm_app/login_screen.dart';
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; // new
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';           // new

import 'src/authentication.dart';                  // new
import 'src/widgets.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gcm_app/onesignal_flutter.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        // ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Size _size;
  var tokens = '';

  @override
  void initState() {
    super.initState();
    _firebaseCloudMessaging_Listeners();
  }

  // 화면 리플래시...
  void _incrementToken(var item) {
    setState(() {
      tokens = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: _size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.lightGreen[300],
                          Color(0xFF7FB45E),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 27, vertical: 150),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 40),
                                  height: _size.height * 0.4,
                                  width: _size.width * 0.9,
                                  child: Card(
                                    elevation: 2,
                                    color: Colors.lightGreen[300],
                                    shape:
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                            alignment: Alignment.center,
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage('assets/images/moon.png')))
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 15),
                                            child: Text(
                                              '잘섬기계',
                                              style: TextStyle(
                                                fontFamily: 'NanumGodic',
                                                fontSize: 35,
                                                color: Colors.white,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 15),
                                            child: Text(
                                              'Good Care Machine',
                                              style: TextStyle(
                                                  fontFamily: 'NanumGodic',
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          )
                        ]
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // firebase
  void _firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) _iOS_Permission();

    // token
    _firebaseMessaging.getToken().then((token) {
      print('token: $token');
      // 토큰을 출력
      // _incrementToken(token);
    });
    // push notification
    _firebaseMessaging.configure(
      // 메시지가 왔을 때
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        // 메시지가 제대로 들어오는지 확인
        if (message != null && message['notification']['title'] != null &&
            message['notification']['body'] != null) {
          // 메시지 별 차이점 확인...

          // 메시지를 어케 받는지 확인 됐다면...
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  content: ListTile(
                    title: Text(message['notification']['title']),
                    subtitle: Text(message['notification']['body']),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('확인'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
          );
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void _iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered.listen((
        IosNotificationSettings settings) {
      print("Settings registereded: $settings");
    });
  }
}
