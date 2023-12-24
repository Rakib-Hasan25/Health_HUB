



import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorInformation{
 final String name;
  final String email;
  final String degree;
  final String departmentId;

  DoctorInformation({
    required this.email,
    required this.name,
    required this.degree,
    required this.departmentId,
});


  Map<String, dynamic> toJson() => {
    "name":name,
    "email":email,
    "degree":degree,
    "departmentId":departmentId
  };

  static DoctorInformation fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return DoctorInformation(
      name: snapshot['name'] ?? '',
      email: snapshot['email'] ?? '',
      degree: snapshot['degree']?? '',
      departmentId: snapshot['departmentId']??'',
    );
  }
}

