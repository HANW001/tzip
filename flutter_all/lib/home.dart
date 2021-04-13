import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gcm_app/home_page.dart';
import 'package:gcm_app/choice.dart';
// import 'package:gcm_app/yolo.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                            children: <Widget>[
                              // IconButton(icon:Icon(Icons.subject_rounded),
                              //  color : Colors.white,
                              //   iconSize: 30,
                              //   splashColor: Colors.purple,
                              //   onPressed: (){},
                              // ),
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
                                'YWoo',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Convalescent Home',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '낙상 및 욕창 방지 알람 시스템',
                                style: TextStyle(
                                    fontSize: 19,
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
                      Column(
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
                                description: '침대 범위 및 알람'
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
                                  return HomePage();
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
                        color: Colors.lightGreen[300],
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
