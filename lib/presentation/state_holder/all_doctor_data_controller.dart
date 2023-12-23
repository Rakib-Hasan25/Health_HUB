import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_hub/data/models/all%20doctors.dart';
import 'package:health_hub/presentation/ui/utilis/auth.dart';

class AllDoctorDataController extends GetxController {
  RxList<AllDoctors> doctorList = <AllDoctors>[].obs;



  Future<void>getDoctorsData() async {

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await firestore.collection('All Doctors').get();

      for (var element in snapshot.docs) {
        doctorList.add(AllDoctors.fromSnap(element));
      }
    }
    catch(e){
      print("Error fetching data: $e");

    }
  }



}
