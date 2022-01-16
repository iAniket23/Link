import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String description;
  final List teamList;
  final List taskList;

  const User({
    required this.username,
    required this.description,
    required this.email,
    required this.uid,
    required this.teamList,
    required this.taskList,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'description': description,
        'teamList': teamList,
        'taskList': taskList,
      };

  // take document snapshot and return a user model
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      description: snapshot['description'],
      teamList: snapshot['teamList'],
      taskList: snapshot['taskList'],
    );
  }
}
