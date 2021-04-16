import 'package:flutter/material.dart';
import 'package:flutterui_body_application/message_model.dart';
import 'package:flutterui_body_application/user_model.dart';

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
      margin: unread
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              // left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: unread ? Color(0xFFFFEFEE) : Color(0xFFF9FFF7),
        borderRadius: unread
            ? BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: unread ? Colors.red : Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: unread ? Colors.red : Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            // ignore: deprecated_member_use
            child: unread
                ? FlatButton(
                    child: Text("확인"),
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    onPressed: () {
                      messages[index].setUnread(false);
                      messages[index].setText("변경완료");
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
        toolbarHeight: 65,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
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
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
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
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    // reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      return _buildMessage(message, index, message.unread);
                  
                    },
                  ),
                ),
              ),
            ),
            // _buildMessageComposer(),
          ],
        ),
      ),
