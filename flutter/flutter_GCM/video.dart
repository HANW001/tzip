import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_application_6/choice.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightGreen[300],
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("long text"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("long text"),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("long text"),
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
          SizedBox(
            width: 70,
          ),
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
                Container(
                  child: Text('text'),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
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
                Container(
                  child: Text('text'),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
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
                          msg: '저장되었습니다.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1);
                    },
                  ),
                ),
                Container(
                  child: Text('text'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
