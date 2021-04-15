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

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('푸시알림 테스트'),
        ),
        body: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Center(
      child: Text(tokens),
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

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is te root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GCM',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.lightGreen[300]),
//       home : LoginScreen(),
//     );
//   }
// }

//
// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }
//
//   Future<void> init() async {
//     await Firebase.initializeApp();
//
//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loginState = ApplicationLoginState.loggedIn;
//       } else {
//         _loginState = ApplicationLoginState.loggedOut;
//       }
//       notifyListeners();
//     });
//   }
//
//   ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
//   ApplicationLoginState get loginState => _loginState;
//
//   String _email;
//   String get email => _email;
//
//   void startLoginFlow() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }
//
//   void verifyEmail(
//       String email,
//       void Function(FirebaseAuthException e) errorCallback,
//       ) async {
//     try {
//       var methods =
//       await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       if (methods.contains('password')) {
//         _loginState = ApplicationLoginState.password;
//       } else {
//         _loginState = ApplicationLoginState.register;
//       }
//       _email = email;
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signInWithEmailAndPassword(
//       String email,
//       String password,
//       void Function(FirebaseAuthException e) errorCallback,
//       ) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void cancelRegistration() {
//     _loginState = ApplicationLoginState.emailAddress;
//     notifyListeners();
//   }
//
//   void registerAccount(String email, String displayName, String password,
//       void Function(FirebaseAuthException e) errorCallback) async {
//     try {
//       var credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await credential.user.updateProfile(displayName: displayName);
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }
//
// class HomePage extends StatelessWidget {
//   HomePage({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Meetup'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Image.asset('assets/images/alarm.png'),
//           SizedBox(height: 8),
//           IconAndDetail(Icons.calendar_today, 'October 30'),
//           IconAndDetail(Icons.location_city, 'San Francisco'),
//           // Add from here
//           Consumer<ApplicationState>(
//             builder: (context, appState, _) => Authentication(
//               email: appState.email,
//               loginState: appState.loginState,
//               startLoginFlow: appState.startLoginFlow,
//               verifyEmail: appState.verifyEmail,
//               signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
//               cancelRegistration: appState.cancelRegistration,
//               registerAccount: appState.registerAccount,
//               signOut: appState.signOut,
//             ),
//           ),
//           // to here
//           Divider(
//             height: 8,
//             thickness: 1,
//             indent: 8,
//             endIndent: 8,
//             color: Colors.grey,
//           ),
//           Header("What we'll be doing"),
//           Paragraph(
//             'Join us for a day full of Firebase Workshops and Pizza!',
//           ),
//         ],
//       ),
//     );
//   }
// }
