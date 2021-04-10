import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/pose.dart';
import 'package:flutter_application_6/video.dart';
import 'package:flutter_application_6/yolo.dart';

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
                        color: Colors.greenAccent[700],
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(60))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 50),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.subject_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '관리자 페이지 입니다.',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                '침대영역지정은 yolo',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '위험방지알람은 pose',
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
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: _size.width * 0.85,
                      alignment: Alignment.center,
                      // margin: EdgeInsets.symmetric(vertical: _size.height * 0.35),
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.deepPurple[900],
                            ),
                            hintText: 'Search our simptoms...',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '선택해 주세요.',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return Video();
                                },
                              ));
                            },
                            child: _buildShortcuts(
                                height: _size.height * 0.24,
                                image: 'images/thermometer.png',
                                title: 'yolo',
                                description: ''),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return Pose();
                                },
                              ));
                            },
                            child: _buildShortcuts(
                                height: _size.height * 0.24,
                                image: 'images/doctor.png',
                                title: 'pose',
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
                      color: Colors.deepPurple,
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
