import 'package:flutter/material.dart';
import 'package:gcm_app/message_model.dart';
import 'package:gcm_app/user_model.dart';
import 'package:provider/provider.dart';           // new
import 'src/authentication.dart';                  // new
import 'src/widgets.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

// massages
class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, int index, bool unread) {
    DateTime now = DateTime.now();
    String formattedDate = now.hour.toString() + ":" + now.minute.toString();
    final Container msg = Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: unread ? Color(0xFFFFEFEE) : Color(0xFFF9FFF7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              fontFamily: 'NanumGodic',
              color: unread ? Colors.red : Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 15),
          Text(
            message.text,
            style: TextStyle(
              fontFamily: 'NanumGodic',
              color: unread ? Colors.red : Colors.blueGrey,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 20),
          Container(
            // ignore: deprecated_member_use
            child: unread
                ? FlatButton(
              child: Text(
                '확 인',
                style: TextStyle(
                  fontFamily: 'NanumGodic',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              color: Colors.lightGreen[300],
              textColor: Colors.white,
              onPressed: () {
                messages[index].setUnread(false);
                messages[index].setText("자세 변경 완료");
                setState(() {});
              },
            )
                : Text(" "),
          ),
        ],
      ),
    );

    if (unread) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = now.hour.toString() + ":" + now.minute.toString();

    return Scaffold(
      backgroundColor: Color(0xFF95CD72),
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontFamily: 'NanumGodic',
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white,
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
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView.builder(
                    // reverse: true,
                    padding: EdgeInsets.only(top: 20),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      return _buildMessage(message, index, message.unread);
                      // if (index == messages.length - 1) {
                      //   final Message message = messages[index];
                      //   // final bool isMe = message.sender.id == currentUser.id;
                      //   return _buildMessage(message, message.unread);
                      // } else {
                      //   final Message message = messages[index];
                      //   // final bool isMe = message.sender.id == currentUser.id;
                      //   return _buildMessage(message, false);
                      // }
                    },
                  ),
                ),
              ),
            ),
            // _buildMessageComposer(),
          ],
        ),
      ),
      // floatingActionButton: FlatButton(
      //   child: Text("임시 데이터 생성 버튼"),
      //   color: Colors.lightGreen,
      //   textColor: Colors.white,
      //   onPressed: () {
      //     var value = new Message(
      //       sender: khw,
      //       time: formattedDate, //time
      //       text: '[욕창]자세변경필요',
      //       // isLiked: false,
      //       unread: true,
      //     );
      //     // messages.insert(0, value);
      //     messages.add(value);
      //
      //     setState(() {});
      //     // insert
      //     // read
      //   },
      // ),
    );
  }
}