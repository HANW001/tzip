import 'package:flutter/material.dart';
import 'package:flutter_application_6/message_model.dart';
import 'package:flutter_application_6/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _visibility = true;
  void _show() {
    setState(() {
      _visibility = true;
    });
  }

  void _hide() {
    setState(() {
      _visibility = false;
    });
  }

  _buildMessage(Message message, bool isMe) {
    DateTime now = DateTime.now();
    String formattedDate = now.hour.toString() + ":" + now.minute.toString();
    // dynamic currentTime = DateFormat.jm().format(DateTime.now());
    final Container msg = Container(
      margin: isMe
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
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: isMe ? Color(0xFFFFEFEE) : Color(0xFFF9FFF7),
        borderRadius: isMe
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
              color: isMe ? Colors.red : Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: isMe ? Colors.red : Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            // ignore: deprecated_member_use
            child: FlatButton(
              child: Text(
                "확인",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              color: Colors.lightGreen,
              splashColor: Colors.cyan,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              textColor: Colors.white,
              onPressed: () {
                var value = new Message(
                  sender: khw,
                  time: formattedDate, //time
                  text: '[욕창] 자세 변경 완료',
                  // isLiked: false,
                  unread: true,
                );
                messages.insert(0, value);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        //     IconButton(
        //       icon: message.isLiked
        //           ? Icon(Icons.favorite)
        //           : Icon(Icons.favorite_border),
        //       iconSize: 30.0,
        //       color: message.isLiked
        //           ? Theme.of(context).primaryColor
        //           : Colors.blueGrey,
        //       onPressed: () {},
        //     )
      ],
    );
  }

  // _buildMessageComposer() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 8.0),
  //     height: 70.0,
  //     color: Colors.white,
  //     child: Row(
  //       children: <Widget>[
  //         IconButton(
  //           icon: Icon(Icons.photo),
  //           iconSize: 25.0,
  //           color: Theme.of(context).primaryColor,
  //           onPressed: () {},
  //         ),
  //         Expanded(
  //           child: TextField(
  //             textCapitalization: TextCapitalization.sentences,
  //             onChanged: (value) {},
  //             decoration: InputDecoration.collapsed(
  //               hintText: 'Send a message...',
  //             ),
  //           ),
  //         ),
  //         IconButton(
  //           icon: Icon(Icons.send),
  //           iconSize: 25.0,
  //           color: Theme.of(context).primaryColor,
  //           onPressed: () {},
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
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
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            // _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
