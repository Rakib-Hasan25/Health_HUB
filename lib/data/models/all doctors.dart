



import 'package:cloud_firestore/cloud_firestore.dart';

class AllDoctors{
 final String name;
  final String email;
  final String specialities;

  AllDoctors({
    required this.email,
    required this.name,
    required this.specialities
});


  Map<String, dynamic> toJson() => {
    "name":name,
    "email":email,
    "specialities":specialities
  };

  static AllDoctors fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AllDoctors(
      name: snapshot['name'] ?? '',
      email: snapshot['email'] ?? '',
      specialities: snapshot['specialities']?? '',
    );
  }
}

