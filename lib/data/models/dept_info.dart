import 'package:cloud_firestore/cloud_firestore.dart';

class DeptInfo{
  final String Dept_name;
  final String Dept_icon;
  final Map<String,dynamic> Dept_Doctor;

  DeptInfo({
    required this.Dept_name,
    required this.Dept_icon,
    required this.Dept_Doctor
  });


  Map<String, dynamic> toJson() => {
    "Dept_name":Dept_name,
    "Dept_icon":Dept_icon,
    "Dept_Doctor":Dept_Doctor
  };

  static DeptInfo fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return DeptInfo(
      Dept_name: snapshot['Dept_name'] ?? '',
      Dept_icon: snapshot['Dept_icon'] ?? '',
      Dept_Doctor: snapshot['Dept_Doctor']?? {},
    );
  }
}