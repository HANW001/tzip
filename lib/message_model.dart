import 'package:gcm_app/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  // final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    // this.isLiked,
    this.unread,
  });
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

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: currentUser,
    time: '3:34 PM',
    text: '[욕창] 자세를 변경해주세요',
    // isLiked: true,
    unread: true,
  ),
  Message(
    sender: khw,
    time: '3:04 PM',
    text: '[욕창] 자세 변경 완료',
    // isLiked: true,
    unread: true,
  ),
  Message(
    sender: khw,
    time: '3:03 PM',
    text: '[욕창] 자세를 변경해주세요',
    // isLiked: true,
    unread: true,
  ),
  Message(
    sender: kjh,
    time: '2:33 PM',
    text: '[욕창] 자세 변경 완료',
    // isLiked: true,
    unread: true,
  ),
  Message(
    sender: kjh,
    time: '2:32 PM',
    text: '[욕창] 자세를 변경해주세요',
    // isLiked: true,
    unread: true,
  ),
  Message(
    sender: aes,
    time: '2:02 PM',
    text: '[욕창] 자세 변경 완료',
    // isLiked: true,
    unread: true,
  ),
  Message(
    sender: aes,
    time: '2:00 PM',
    text: '[욕창] 자세를 변경해주세요',
    // isLiked: true,
    unread: true,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages2 = [
  Message(
    sender: aes,
    time: '3:34 PM',
    text: '[낙상] 낙상 경고, 위험합니다 # 이거 색깔 빨간색으로 바꾸기',
    // isLiked: false,
    unread: true,
  ),
];

