import 'package:cloud_firestore/cloud_firestore.dart';
class User {
  String email;
  String password;
  String uid;

  User(
      {required this.password,
        required this.email,
        required this.uid,
      });

  Map<String, dynamic> toJson() => {

    "email": email,
    "password": password,
    "uid": uid,
  };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      password: snapshot['password'],

      uid: snapshot['uid'],

    );
  }


}