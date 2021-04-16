import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gcm_app/third_page.dart';
// import 'package:gcm_app/constants.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
        backgroundColor: Colors.lightGreen[300]
      ),
      body : SingleChildScrollView(
        child: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          mainAxisAlignment : MainAxisAlignment.start,
          children: [
            Container(
              height: _size.height * 0.38,
              child : Stack(
                alignment : Alignment.topCenter,
                children : [
                  Container(
                    height: _size.height * 0.3,
                    decoration : BoxDecoration(
                      borderRadius :
                        BorderRadius.only(bottomLeft : Radius.circular(60)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.lightGreen[300],
                          Color(0xFF7FB45E),
                        ],
                        stops: [0.1, 0.9])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 25),
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
                          margin: EdgeInsets.symmetric(horizontal: 38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '홍길동 님,',
                                style: TextStyle(
                                    fontFamily: 'NanumGodic',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '담당 호실 설정',
                                style: TextStyle(
                                  fontFamily: 'NanumGodic',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              ),
                              SizedBox(height: 12),
                              Text(
                                '담당 병실의 알람만 수신합니다',
                                style: TextStyle(
                                  fontFamily: 'NanumGodic',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom : 20,
                    child: Container(
                      width: _size.width * 0.85,
                      alignment: Alignment.center,
                      margin : EdgeInsets.symmetric(horizontal : 30),
                      // margin: EdgeInsets.symmetric(vertical: _size.height * 0.04),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.lightGreen[300],
                          ),
                          hintText: 'Search the room...',
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
            Container(
              margin : EdgeInsets.symmetric(horizontal : 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children : [
                      Row(
                        children : [
                          InkWell(
                            onTap : () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ThirdPage();
                                },
                              ));
                            },
                            child : _buildShortcuts(
                              title : "101호실",
                              description: "Room 101"),
                            ),
                          _buildShortcuts(
                            title : "102호실",
                            description: "Room 102"
                          ),
                        ],
                      ),
                      SizedBox(height : 4),
                      Row(
                        children : [
                          _buildShortcuts(
                            title : "201호실",
                            description: "Room 201"
                          ),
                          _buildShortcuts(
                            title : "202호실",
                            description: "Room 202"
                          ),
                        ],
                      ),
                      SizedBox(height : 4),
                      Row(
                        children : [
                          _buildShortcuts(
                              title : "301호실",
                              description: "Room 301"
                          ),
                          _buildShortcuts(
                              title : "302호실",
                              description: "Room 302"
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildShortcuts(
      {double height, String title, String description}) {
    return Container(
        height: 160,
        width : _size.width * 0.42,
        child : Card(
          elevation: 2,
          shape : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                margin : EdgeInsets.symmetric(horizontal : 15, vertical : 30),
                // alignment : Alignment.topLeft,
                // height : 50,
                // width : 50,
              ),
              Container(
                alignment: Alignment.center,
                margin : EdgeInsets.symmetric(horizontal : 15),
                child : Text(
                  title,
                  style :TextStyle(
                    fontFamily: 'NanumGodic',
                    fontSize : 22,
                    color : Colors.lightGreen[300],
                    letterSpacing : 0.5,
                    fontWeight : FontWeight.w900),
                ),
              ),
              SizedBox(height : 4),
              Container(
                alignment: Alignment.center,
                // margin : EdgeInsets.symmetric(horizontal : 15),
                child : Text(
                  description,
                  style :TextStyle(
                    fontFamily: 'NanumGodic',
                    fontSize : 15,
                    color : Colors.lightGreen[300],
                    fontWeight : FontWeight.normal),
                ),
              )
            ],
          ),
        ),
    );
  }
}