import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gcm_app/second_page.dart';
import 'package:gcm_app/choice.dart';
// import 'package:gcm_app/yolo.dart';


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
                          margin: EdgeInsets.symmetric(vertical: 60),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // IconButton(icon:Icon(Icons.subject_rounded),
                              //  color : Colors.white,
                              //   iconSize: 30,
                              //   splashColor: Colors.purple,
                              //   onPressed: (){},
                              // ),
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
                                '영우 요양원',
                                style: TextStyle(
                                  fontFamily: 'NanumGodic',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                  color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '알람 시스템',
                                style: TextStyle(
                                    fontFamily: 'NanumGodic',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 12),
                              Text(
                                '낙상 및 욕창 방지 알람 시스템',
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
                    bottom: 20,
                    child: Container(
                      width: _size.width * 0.85,
                      alignment: Alignment.center,
                      // margin: EdgeInsets.symmetric(vertical: _size.height * 0.35),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                  return Choice2();
                                },
                              ));
                            },
                            child: _buildShortcuts(
                                height: _size.height * 0.25,
                                image: 'assets/images/man.png',
                                title: '관리자',
                                description: '침대 범위 설정 / 알람'
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
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
                                image: 'assets/images/doctor.png',
                                title: '요양보호사',
                                description: '알람 시스템'),
                          ),
                        ],
                      )
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
                    fontSize: 22,
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
