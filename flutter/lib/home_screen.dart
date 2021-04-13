import 'package:flutter/material.dart';
import 'package:gcm_app/home_page.dart';
import 'package:gcm_app/recent_chats.dart';
import 'package:gcm_app/chat_screen.dart';
import 'package:gcm_app/message_model.dart';
import 'message_model.dart';
//import 'package:flutter_chat_ui/widgets/category_selector.dart';
//import 'package:flutter_chat_ui/widgets/favorite_contacts.dart';
//import 'package:flutter_chat_ui/widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF95CD72),
      appBar : AppBar(
        // PreferredSize(preferredSize: Size.fromHeight(70),
        toolbarHeight: 65,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        leading: Container(),
        centerTitle: true,
        elevation : 0,
        title : Text(
          '101호실',
          style : TextStyle(
            fontSize : 28.0,
            fontWeight : FontWeight.bold,
            color : Colors.white,
          ),
        ),
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
      ),
      body : Column(
        children : <Widget>[
      //     Container(
      //       height : 90.0,
      //       color : Colors.lightGreen[300],
      //     ),
      //     SizedBox(
      //       height: 20,
      //       width: 20,
      //       child: Image.asset('images/medicalreport.png')),
          Expanded(
            child : Container(
              decoration : BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFEFEE),
                    Color(0xFFFFDCDB),
                    Colors.white,
                  ],
                  stops: [0.01, 0.15, 0.9],
                ),
                borderRadius : BorderRadius.only(
                  topLeft : Radius.circular(30.0),
                  topRight : Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding : EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children : <Widget>[
                    Padding(
                      padding : EdgeInsets.symmetric(horizontal : 20),
                      child : Row(
                        mainAxisAlignment : MainAxisAlignment.spaceBetween,
                        children : <Widget>[
                          Text(
                            'WARNING!!',
                            style : TextStyle(
                              color : Colors.red,
                              // color : Color(0xFFFF7C78),
                              fontSize : 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing : 1.0,
                            ),
                          ),
                          IconButton(
                            icon : Icon(
                              Icons.more_horiz,
                            ),
                            iconSize : 30,
                            color : Colors.red,
                            onPressed : () {},
                          ),
                        ]
                      )
                    ),
                    Container(
                      height : 120,
                      child : ListView.builder(
                        padding : EdgeInsets.only(left : 10),
                        scrollDirection : Axis.horizontal,
                        itemCount : favorites.length,
                        itemBuilder : (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatScreen(
                                  user: favorites[index],
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor : Colors.red,
                                    radius: 35.0,
                                    child : Text(
                                      "욕창",
                                      style : TextStyle(
                                        color : Colors.white,
                                        fontSize : 20,
                                        fontWeight : FontWeight.bold,
                                      ),
                                    ),
                                  // backgroundImage: AssetImage(favorites[index].imageUrl),
                                  ),
                                  SizedBox(height: 6.0),
                                  Text(
                                    favorites[index].name,
                                    style: TextStyle(
                                      color : Colors.blueGrey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ),
                          );
                        }
                      )
                    ),
                    Container(
                      height: 405,
                      padding : EdgeInsets.symmetric(vertical : 25.0),
                      decoration : BoxDecoration(
                        color : Colors.white,
                        borderRadius : BorderRadius.only(
                          topLeft : Radius.circular(30.0),
                          topRight : Radius.circular(30.0),
                        ),
                      ),

                      child : ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft : Radius.circular(30),
                          topRight : Radius.circular(30),
                        ),
                        child : ListView.builder(
                          itemCount : chats.length,
                          itemBuilder : (BuildContext context, int index) {
                            final Message chat = chats[index];
                            return GestureDetector(
                              onTap : () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder : (_) => ChatScreen(
                                    user : chat.sender,
                                  ),
                                ),
                              ),
                              child : Container(
                                margin : EdgeInsets.only(top : 5.0, bottom : 5.0, left : 12.0, right : 12.0),
                                padding : EdgeInsets.symmetric(horizontal : 12.0, vertical : 10.0),
                                decoration : BoxDecoration(
                                  color : chat.unread ? Color(0xFFFFEFEE) : Color(0xFFF9FFF7),
                                  borderRadius : BorderRadius.circular(20),
                                ),
                                child : Row(
                                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                  children : <Widget>[
                                    Row(
                                      children : <Widget>[
                                        // CircleAvatar(
                                        //   radius : 35,
                                        //   // backgroundImage : AssetImage(chat.sender.imageUrl),
                                        // ),
                                        SizedBox(width : 10.0),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children : <Widget>[
                                            Text(
                                              chat.sender.name,
                                              style : TextStyle(
                                                color : Colors.grey,
                                                fontSize : 15,
                                                fontWeight : FontWeight.bold,
                                              )
                                            ),
                                            SizedBox(height : 5.0),
                                            Container(
                                              width : MediaQuery.of(context).size.width * 0.45,
                                              child : Text(
                                                chat.text,
                                                style : TextStyle(
                                                  color : Colors.blueGrey,
                                                  fontSize : 15,
                                                  fontWeight : FontWeight.w600,
                                                ),
                                                overflow : TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children : <Widget>[
                                        Text(
                                          chat.time,
                                          style : TextStyle(
                                            color : Colors.grey,
                                            fontSize : 15,
                                            fontWeight : FontWeight.bold,
                                          ),
                                        ),
                                        chat.unread ? Container(
                                          width : 40.0,
                                          height : 25.0,
                                          decoration : BoxDecoration(
                                            color : Colors.red,
                                            borderRadius : BorderRadius.circular(30),
                                          ),
                                          alignment : Alignment.center,
                                          child : Text(
                                            'NEW',
                                            style : TextStyle(
                                              color : Colors.white,
                                              fontSize : 12.0,
                                              fontWeight : FontWeight.bold,
                                            )
                                          ),
                                        ) : Text(''), // SizedBox.shrink(),
                                      ]
                                    )
                                  ],
                                )
                              )
                            );
                          },
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
