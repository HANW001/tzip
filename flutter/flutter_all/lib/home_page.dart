import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gcm_app/home_screen.dart';
// import 'package:gcm_app/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          margin: EdgeInsets.symmetric(vertical: 9),
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
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              Text(
                                '담당 호실 설정',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Select your own room',
                                style: TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Only alarms the selected room',
                                style: TextStyle(
                                  fontSize: 13,
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
                                  return HomeScreen();
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
                      SizedBox(
                        height : 4,
                      ),
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
                      SizedBox(
                        height : 4,
                      ),
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
        height: 150,
        width : _size.width * 0.42,
        child : Card(
          shape : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                margin : EdgeInsets.symmetric(horizontal : 20, vertical : 7),
                // alignment : Alignment.topLeft,
                // height : 50,
                // width : 50,
              ),
              SizedBox(
                height : 30,
              ),
              Container(
                alignment: Alignment.center,
                // margin : EdgeInsets.symmetric(horizontal : 15),
                child : Text(
                  title,
                  style :TextStyle(
                      fontSize : 25,
                      color : Colors.lightGreen[300],
                      letterSpacing : 0.5,
                      fontWeight : FontWeight.w900),
                ),
              ),
              Container(
                alignment: Alignment.center,
                // margin : EdgeInsets.symmetric(horizontal : 15),
                child : Text(
                  description,
                  style :TextStyle(
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