import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/choice.dart';

void main() {
  runApp(Video());
}

class Video extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.greenAccent[400],
        title: Text(
          'yolo',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
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
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ),
      bottomSheet: Row(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            child: RaisedButton(
                child: Text(
                  '수정',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Video()));
                },
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            width: 200,
            height: 200,
            child: RaisedButton(
                child: Text(
                  '성공',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Choice2()));
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ],
      ),
    );
  }
}
