
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_hub/data/models/all%20doctors.dart';
import 'package:health_hub/presentation/ui/utilis/auth.dart';

class DoctorInformationController extends GetxController{


  static String? SelectedDepartment(String s){
    if(s.toLowerCase()== "eye"){
      return "1";
    }
    else if(s.toLowerCase()== "heart"){
      return "2";
    }
    else if(s.toLowerCase() =="cardiologists"){
      return "3";
    }
    else return "0";

  }

  Future<void>uploadDoctorData(String name,String email,String degree,String departmentId) async {

    try {
      DoctorInformation doctorInformation = DoctorInformation(email: email, name: name, degree: degree, departmentId: departmentId);


      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await firestore.collection('Doctor Information').get() ;

      if(snapshot.docs.isEmpty){
        await firestore.collection("Doctor Information").doc("1").set(doctorInformation.toJson());
      }
      else {
        String docId = (snapshot.size + 1).toString();
        await firestore.collection("Doctor Information").doc(docId).set(
            doctorInformation.toJson());
      }

      Get.snackbar("Congratulation", "Successfully uploaded new doctor Data");
    }
    catch(e){
      Get.snackbar("Something is Wrong", "failed to upload data");


    }
  }

  List<DoctorInformation> doctorList = [];
  Future<void>getDoctorsData() async {

    try {
      doctorList = [];
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await firestore.collection('Doctor Information').get();
      for (var element in snapshot.docs) {
        doctorList.add(DoctorInformation.fromSnap(element));
      }
      update();
    }
    catch(e){
      print("Error fetching data: $e");

    }
  }



}