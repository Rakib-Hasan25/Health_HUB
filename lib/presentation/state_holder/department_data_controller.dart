import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:health_hub/data/models/dept_info.dart';
import 'package:health_hub/presentation/ui/utilis/auth.dart';

class DepartmentDataController extends GetxController {
  List<DeptInfo>deptInfo = <DeptInfo>[];



  Future<void>getDepartmentData() async {

    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await firestore.collection('Department').get();

      for (var element in snapshot.docs) {
        deptInfo.add(DeptInfo.fromSnap(element));
      }
      update();
    }
    catch(e){
      print("Error fetching data: $e");

    }
  }



}
