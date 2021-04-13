import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gcm_app/yolo/pose.dart';
import 'package:gcm_app/video.dart';
import 'package:gcm_app/home_page.dart';
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
      backgroundColor: Colors.deepPurpleAccent[50],
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        centerTitle: true,
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
                          margin: EdgeInsets.symmetric(vertical: 55),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '관리자 페이지',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '침대 영역 지정은 YOLO',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 3),
                              Text(
                                '위험 방지 알람은 Pose',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '이용하실 서비스를 선택해 주세요',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightGreen[300],
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(
                                builder: (context) {
                                  return Video();
                                },
                              ));
                            },
                            child: _buildShortcuts(
                                height: _size.height * 0.24,
                                image: 'images/bed.png',
                                title: '침대 범위 설정',
                                description: ''),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ));
                            },
                            child: _buildShortcuts(
                                height: _size.height * 0.24,
                                image: 'images/doctor.png',
                                title: '알람 시스템',
                                description: ''),
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
    return Container(
        height: height,
        width: _size.width * 0.4,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                alignment: Alignment.topLeft,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightGreen[300],
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              if (description != '')
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}
