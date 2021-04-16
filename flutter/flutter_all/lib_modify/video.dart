import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

void main() {
  runApp(Video());
}

// class Video extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: VideoPlayerScreen(),
//     );
//   }
// }

class Video extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<Video> {
  Size _size;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://hanw001.github.io/tenplus.github.io/video/output2.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Column(children: [
          Text(
            '침대 범위 설정',
            style : TextStyle(
              fontFamily: 'NanumGodic',
              fontSize : 25.0,
              fontWeight : FontWeight.w900,
              color : Colors.white,
            ),
          ),
          // SizedBox(height: 4),
          // GestureDetector(
          //   child: Text(
          //     'Bed Range Settings',
          //     style : TextStyle(
          //       fontFamily: 'NanumGodic',
          //       fontSize : 16,
          //       fontWeight : FontWeight.w800,
          //       color : Colors.white,
          //     ),
          //   )
          // ),
        ]),
        flexibleSpace: new Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.lightGreen[300],
                Color(0xFF95CD72),
              ],
              stops: [0.3, 0.9],
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 16/9,
                  child: VideoPlayer(_controller),
                ),
                Column(
                  children: <Widget> [
                    Container(
                      padding : EdgeInsets.only(top : 55),
                      // padding: EdgeInsets.symmetric(vertical: 20),
                      // padding: EdgeInsets.all(20),
                      width : _size.width * 0.85,
                      child: Text(
                        'Information',
                        textAlign: TextAlign.center,
                        style : TextStyle(
                          fontFamily: 'NanumGodic',
                          fontSize : 25.0,
                          fontWeight : FontWeight.w900,
                          color : Colors.lightGreen[300],
                        ),
                      ),
                    ),
                    Container(
                      padding : EdgeInsets.only(top : 20),
                      width : _size.width * 0.85,
                      child: Text(
                        '환자 배정 전 먼저 침대 범위를 설정합니다',
                        textAlign: TextAlign.center,
                        style : TextStyle(
                          fontFamily: 'NanumGodic',
                          fontSize : 15.0,
                          fontWeight : FontWeight.w900,
                          color : Colors.lightGreen[300],
                        ),
                      ),
                    ),
                    Container(
                      padding : EdgeInsets.only(top : 30),
                      width : _size.width * 0.85,
                      child: Text(
                        'Setting : 침대 범위를 설정합니다',
                        textAlign: TextAlign.center,
                        style : TextStyle(
                          fontFamily: 'NanumGodic',
                          fontSize : 15.0,
                          fontWeight : FontWeight.w900,
                          color : Colors.lightGreen[300],
                        ),
                      ),
                    ),
                    Container(
                      padding : EdgeInsets.only(top : 7),
                      width : _size.width * 0.85,
                      child: Text(
                        'Reset : 침대 범위를 수정합니다',
                        textAlign: TextAlign.center,
                        style : TextStyle(
                          fontFamily: 'NanumGodic',
                          fontSize : 15.0,
                          fontWeight : FontWeight.w900,
                          color : Colors.lightGreen[300],
                        ),
                      ),
                    ),
                    Container(
                      padding : EdgeInsets.only(top : 7),
                      width : _size.width * 0.85,
                      child: Text(
                        'Save : 침대 범위를 저장합니다',
                        textAlign: TextAlign.center,
                        style : TextStyle(
                          fontFamily: 'NanumGodic',
                          fontSize : 15.0,
                          fontWeight : FontWeight.w900,
                          color : Colors.lightGreen[300],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomSheet: Row(
        children: <Widget>[
          SizedBox(width: 70),
          Container(
            width: 80,
            height: 80,
            child : Column(
              children : [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.lightGreen,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.autorenew),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // 만약 영상이 일시 중지 상태였다면, 재생합니다.
                          _controller.play();
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    'Reset',
                    style : TextStyle(
                      fontFamily: 'NanumGodic',
                      fontSize : 16.0,
                      fontWeight : FontWeight.w900,
                      color : Colors.lightGreen[300],
                    ),
                  )
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 80,
            height: 80,
            child: Column(
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.lightGreen,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // 만약 영상이 일시 중지 상태였다면, 재생합니다.
                          _controller.play();
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    'Setting',
                    style : TextStyle(
                      fontFamily: 'NanumGodic',
                      fontSize : 16.0,
                      fontWeight : FontWeight.w900,
                      color : Colors.lightGreen[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 80,
            height: 80,
            child: Column(
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.lightGreen,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.save),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: '저장되었습니다',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1);
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    'Save',
                    style : TextStyle(
                      fontFamily: 'NanumGodic',
                      fontSize : 16.0,
                      fontWeight : FontWeight.w900,
                      color : Colors.lightGreen[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
