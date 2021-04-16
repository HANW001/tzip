import 'package:flutterui_body_application/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  String text;

  // final bool isLiked;
  bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    // this.isLiked,
    this.unread,
  });

  setUnread(bool unread){
    this.unread = unread;
  }

  setText(String text){
    this.text = text;
  }
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'images/grandfather.jpg',
);

// USERS
final User kts = User(
  id: 1,
  name: '김택수',
  imageUrl: 'images/grandfather.jpg',
);
final User khw = User(
  id: 2,
  name: '김한울',
  imageUrl: 'images/grandfather.jpg',
);
final User kjh = User(
  id: 3,
  name: '권재현',
  imageUrl: 'images/grandfather.jpg',
);
final User aes = User(
  id: 4,
  name: '안은선',
  imageUrl: 'images/grandmother.jpg',
);
final User ksy = User(
  id: 5,
  name: '김소연',
  imageUrl: 'images/grandmother.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [khw, kjh];
List<User> yc = [kts, khw, aes, ksy];
List<User> ns = [kjh];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: kts,
    time: '3:35 PM',
    text: '자세 변경 완료',
    // isLiked: false,
    unread: false,
  ),
  Message(
    sender: khw,
    time: '3:34 PM',
    text: '자세 변경 필요',
    // isLiked: false,
    unread: true,
  ),
  Message(
    sender: kjh,
    time: '3:30 PM',
    text: '낙상 경고',
    // isLiked: false,
    unread: true,
  ),
  Message(
    sender: aes,
    time: '2:30 PM',
    text: '자세 변경 완료',
    // isLiked: false,
    unread: false,
  ),
  Message(
    sender: ksy,
    time: '1:30 PM',
    text: '자세 변경 완료',
    // isLiked: false,
    unread: false,
  ),
];

DateTime now = DateTime.now();
String formattedDate = now.hour.toString() + ":" + now.minute.toString();
List<Message> messages = [

  Message(
    sender: currentUser,
    time: formattedDate,
    text: '[욕창] 자세를 변경해주세요',
    // isLiked: true,
    unread: true,
  )];

