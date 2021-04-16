import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gcm_app/yolo/pose.dart';
import 'package:gcm_app/video.dart';
import 'package:gcm_app/second_page.dart';
import 'package:gcm_app/yolo/yolo.dart';

class Choice2 extends StatefulWidget {
  Choice2({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Choice2> {
  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.lightGreen[300],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: _size.height * 0.45,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: _size.height * 0.4,
                    width: _size.width,
                    decoration: BoxDecoration(
                      borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60)),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 65),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 20)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '관리자 페이지',
                                style: TextStyle(
                                  fontFamily: 'NanumGodic',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              ),
                              SizedBox(height: 15),
                              Text(
                                '배정된 침대 범위를 설정하고 병동을 관리합니다',
                                style: TextStyle(
                                  fontFamily: 'NanumGodic',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              ),
                              SizedBox(height: 7),
                              Text(
                                '개인 정보 유출에 주의해주세요',
                                style: TextStyle(
                                  fontFamily: 'NanumGodic',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: _size.width * 0.85,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(
                  //   '이용하실 서비스를 선택해 주세요',
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       color: Colors.lightGreen[300],
                  //       fontWeight: FontWeight.w700),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return Video();
                                },
                              ));
                            },
                            child: _buildShortcuts(
                                height: _size.height * 0.25,
                                image: 'assets/images/bed.png',
                                title: '침대 범위 설정',
                                description: 'YOLACT'),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return SecondPage();
                                },
                              ));
                            },
                            child: _buildShortcuts(
                                height: _size.height * 0.25,
                                image: 'assets/images/alarm.png',
                                title: '알람 시스템',
                                description: 'OpenPose'),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShortcuts({
    double height,
    String image,
    String title,
    String description,
  }) {
    return Center(
      child: Container(
        height: height,
        width: _size.width * 0.42,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                alignment: Alignment.topLeft,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'NanumGodic',
                    fontSize: 21,
                    color: Colors.lightGreen[300],
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 5),
              if (description != '')
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'NanumGodic',
                      fontSize: 14,
                      color: Colors.lightGreen[300],
                      fontWeight: FontWeight.normal),
                  ),
                ),
              SizedBox(height: 15),
            ],
          ),
        )
      )
    );
  }
}
