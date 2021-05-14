import 'package:shop_app/screens/group_messages_model/group_user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.png',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Group 1',
  imageUrl: 'assets/images/greg.png',
);
final User james = User(
  id: 2,
  name: 'Group 2',
  imageUrl: 'assets/images/james.png',
);
final User john = User(
  id: 3,
  name: 'Group 3',
  imageUrl: 'assets/images/john.png',
);
final User olivia = User(
  id: 4,
  name: 'Group 4',
  imageUrl: 'assets/images/olivia.png',
);
final User sam = User(
  id: 5,
  name: 'Group 5',
  imageUrl: 'assets/images/sam.png',
);
final User sophia = User(
  id: 6,
  name: 'Group 6',
  imageUrl: 'assets/images/sophia.png',
);
final User steven = User(
  id: 7,
  name: 'Group 7',
  imageUrl: 'assets/images/steven.png',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '8:30 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '',
    text: 'Almost ready',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Almost ready',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'Almost ready',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'Almost ready',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: '',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: '',
    isLiked: false,
    unread: true,
  ),
];
